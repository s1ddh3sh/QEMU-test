#!/usr/bin/env python3
"""
driver_internal_capture.py — gdb batch-mode driver, generalized: does
NOT know or need to know which locals matter (s1/y/cp/z/...), does NOT
set breakpoints on inner callees, and does NOT need special handling
for rejection loops.

Technique: break at the FUT's POST-PROLOGUE entry (plain symbol name,
not '*symbol' -- see note below), resolve the ADDRESS of every
debug-visible local and pointer argument at that point, write
randomized bytes into the declared input buffers, then run `finish`.

IMPORTANT: we deliberately do NOT use '*fut_name' (raw entry) here.
At the raw entry, the compiler has not yet finished spilling
stack-passed arguments (ARM AAPCS: args 5+ arrive on the caller's
stack, not in r0-r3) into their debug-info-visible stack slots -- so
symbols for those arguments resolve to garbage/null at that PC. The
plain 'fut_name' breakpoint resolves past the prologue, once every
argument (register- and stack-passed alike) has a stable address.

Required env vars:
    GDB_DRIVER_ELF               path to the ELF
    GDB_DRIVER_CAPTURE_WITNESS   path to capture_witness.json
    GDB_DRIVER_FUNC               FUT name
    GDB_DRIVER_TRIAL_SEED         RNG seed (int)
    GDB_DRIVER_VARIANT           "correct" | "faulty"
    GDB_DRIVER_OUTDIR            results directory

Optional env vars:
    GDB_DRIVER_DIST_SPEC          JSON object mapping buffer name ->
                                   distribution key, e.g.
                                   '{"s1":"eta2","s2":"eta2"}'
                                   Buffers not listed default to
                                   "uniform_bytes" (legacy behavior:
                                   raw uniform bytes in [0,255]).
    GDB_DRIVER_DEFAULT_DIST       Fallback distribution key applied to
                                   any pointer-arg buffer not named in
                                   GDB_DRIVER_DIST_SPEC. Defaults to
                                   "uniform_bytes" if unset.
    GDB_DRIVER_PRE_TRANSFORM_SPEC
                                   JSON list of {"label", "func",
                                   "arg_name", "size"} objects. Each
                                   entry sets a TRANSIENT breakpoint on
                                   `func`'s entry; when hit, dumps
                                   `size` bytes from the pointer
                                   argument `arg_name`, stores it under
                                   `label` in the output JSON's
                                   "pre_transform" section, then
                                   deletes that breakpoint and resumes.
                                   Use this to capture a buffer's value
                                   BEFORE an in-place transform (e.g.
                                   NTT) runs on it, since by the time
                                   the FUT returns the only thing left
                                   in memory is the post-transform
                                   value. Example:
                                   '[{"label":"s1_pre_ntt",
                                      "func":"pqcrystals_dilithium2_ref_polyvecl_ntt",
                                      "arg_name":"v","size":4096},
                                     {"label":"s2_pre_ntt",
                                      "func":"pqcrystals_dilithium2_ref_polyveck_ntt",
                                      "arg_name":"v","size":4096}]'
                                   If a labeled function is never
                                   called during this trial, that label
                                   is simply absent from the output
                                   (not an error) -- e.g. it may only
                                   run on some rejection-loop paths.
"""

import gdb
import json
import os
import random
import sys

GDB_TARGET = "localhost:1234"


# ---------------------------------------------------------------------
# Distribution registry (unchanged from previous patch)
# ---------------------------------------------------------------------

def sample_uniform_bytes(rng, n):
    """Legacy behavior: n raw uniform bytes in [0,255]."""
    return [rng.randrange(256) for _ in range(n)]


def sample_eta_range(rng, n, eta):
    """Uniform integer coefficients in [-eta, eta]. Valid range for:
       - Dilithium: eta in {2, 4} depending on parameter set
       - Kyber:     eta in {2, 3} depending on parameter set/k
    """
    return [rng.randint(-eta, eta) for _ in range(n)]


def sample_cbd_range(rng, n, eta):
    """Centered binomial distribution over [-eta, eta], matching the
    real CBD_eta sampler used by both Kyber and Dilithium in
    production."""
    out = []
    for _ in range(n):
        a = sum(rng.randrange(2) for _ in range(eta))
        b = sum(rng.randrange(2) for _ in range(eta))
        out.append(a - b)
    return out


def sample_uniform_gamma1_l2(rng, n):
    """Dilithium2's y sampler (polyvecl_uniform_gamma1) reconstructs
    each coefficient as GAMMA1 - t, t uniform in [0, 2*GAMMA1 - 1],
    giving y_i in [-(GAMMA1-1), GAMMA1]. GAMMA1 = 2^17 = 131072 for
    Dilithium2 specifically -- L3/L5 use GAMMA1 = 2^19, so this key
    is NOT parameter-set-portable; add a separate
    uniform_gamma1_l3/l5 key rather than reusing this one there."""
    GAMMA1 = 131072
    return [rng.randint(-(GAMMA1 - 1), GAMMA1) for _ in range(n)]


DISTRIBUTIONS = {
    "uniform_bytes": sample_uniform_bytes,
    "eta2": lambda rng, n: sample_eta_range(rng, n, eta=2),
    "eta3": lambda rng, n: sample_eta_range(rng, n, eta=3),
    "eta4": lambda rng, n: sample_eta_range(rng, n, eta=4),
    "cbd_eta2": lambda rng, n: sample_cbd_range(rng, n, eta=2),
    "cbd_eta3": lambda rng, n: sample_cbd_range(rng, n, eta=3),
    "uniform_gamma1_l2": sample_uniform_gamma1_l2,
}


def encode_int32_le(values):
    """Pack a list of signed ints into a little-endian int32 byte
    stream (4 bytes per value, two's-complement wrap for negatives)."""
    out = []
    for v in values:
        u = v & 0xFFFFFFFF
        out.extend([u & 0xFF, (u >> 8) & 0xFF, (u >> 16) & 0xFF, (u >> 24) & 0xFF])
    return out


def generate_buffer_values(name, size, rng, dist_spec, default_dist):
    """Returns a list of BYTE values (len == size) ready for
    write_bytes(), regardless of which distribution produced them."""
    dist_key = dist_spec.get(name, default_dist)
    sampler = DISTRIBUTIONS.get(dist_key)
    if sampler is None:
        raise RuntimeError(
            f"unknown distribution '{dist_key}' for buffer '{name}'. "
            f"Valid options: {sorted(DISTRIBUTIONS.keys())}"
        )

    if dist_key == "uniform_bytes":
        return sampler(rng, size)  # size is a byte count here

    if size % 4 != 0:
        raise RuntimeError(
            f"buffer '{name}' has size {size} bytes, not divisible by "
            f"4 -- can't interpret as int32_t coeffs[] for "
            f"distribution '{dist_key}'."
        )
    n_coeffs = size // 4
    coeff_values = sampler(rng, n_coeffs)
    return encode_int32_le(coeff_values)


def write_bytes(addr, values):
    inferior = gdb.selected_inferior()
    inferior.write_memory(addr, bytes(v & 0xFF for v in values))


def read_bytes(addr, count):
    inferior = gdb.selected_inferior()
    return list(bytes(inferior.read_memory(addr, count)))


def collect_all_symbols(block):
    """Walk this block and every enclosing block up to (but not past)
    the function boundary, collecting every named symbol -- arguments
    and locals alike."""
    syms = {}
    b = block
    while b is not None:
        for sym in b:
            if sym.name and sym.name not in syms:
                syms[sym.name] = sym
        if b.function:
            break
        b = b.superblock
    return syms


def resolve_symbol_address_and_size(sym, frame):
    """Returns (address, byte_size) for a symbol."""
    try:
        val = sym.value(frame)
    except gdb.error:
        return None, None

    if sym.type.code == gdb.TYPE_CODE_PTR:
        try:
            return int(val), None
        except gdb.error:
            return None, None
    else:
        try:
            addr = int(val.address)
            size = int(sym.type.sizeof)
            return addr, size
        except (gdb.error, TypeError):
            return None, None


def break_at_fut_entry(fut_name):
    """Sets the breakpoint on the plain symbol name -- gdb resolves
    this past the prologue automatically, unlike '*fut_name' which
    stops at the raw entry before argument spilling completes."""
    fn_bp = gdb.Breakpoint(fut_name, internal=False)
    gdb.execute("continue", to_string=True)

    if gdb.selected_thread() is None:
        raise RuntimeError("target exited before reaching FUT entry")
    frame = gdb.selected_frame()
    if frame.name() != fut_name:
        raise RuntimeError(f"stopped in '{frame.name()}', expected '{fut_name}'")
    fn_bp.delete()
    return frame


# ---------------------------------------------------------------------
# NEW: pre-transform capture
#
# Sets a breakpoint on a callee's plain symbol name (same
# prologue-skip reasoning as break_at_fut_entry: pointer args are
# fully resolved by then, and the callee hasn't yet mutated the buffer
# its pointer argument refers to -- the mutation happens in the
# callee's BODY, which hasn't executed at this PC). Dumps the target
# buffer, deletes the breakpoint immediately (so a second, unrelated
# call to the same function later in the trial doesn't re-fire and
# overwrite this label), then resumes.
# ---------------------------------------------------------------------

def capture_pre_transform(spec_list):
    """spec_list: list of {"label","func","arg_name","size"} dicts.
    Returns dict label -> list[int] (raw bytes), omitting labels whose
    function was never called before the FUT returned."""
    results = {}
    if not spec_list:
        return results

    for spec in spec_list:
        label = spec["label"]
        func = spec["func"]
        arg_name = spec["arg_name"]
        size = spec["size"]

        try:
            bp = gdb.Breakpoint(func, internal=False)
        except gdb.error as e:
            print(f"[!] pre-transform: couldn't set breakpoint on "
                  f"'{func}' for label '{label}': {e}. Skipping -- "
                  f"check the function name is correct/not inlined.",
                  file=sys.stderr)
            continue

        gdb.execute("continue", to_string=True)

        if gdb.selected_thread() is None:
            # Target exited before this function was ever called this
            # trial -- not an error, just means this transform didn't
            # run (e.g. only invoked on some rejection-loop paths).
            print(f"[i] pre-transform: '{func}' (label '{label}') "
                  f"never hit before target exit -- omitting from output",
                  file=sys.stderr)
            try:
                bp.delete()
            except gdb.error:
                pass
            continue

        frame = gdb.selected_frame()
        if frame.name() != func:
            print(f"[!] pre-transform: expected to stop in '{func}' for "
                  f"label '{label}', actually stopped in "
                  f"'{frame.name()}' -- skipping this label",
                  file=sys.stderr)
            bp.delete()
            continue

        symbols = collect_all_symbols(frame.block())
        if arg_name not in symbols:
            print(f"[!] pre-transform: arg '{arg_name}' not found in "
                  f"'{func}' at this PC (available: "
                  f"{sorted(symbols.keys())}) -- skipping label '{label}'",
                  file=sys.stderr)
            bp.delete()
            continue

        addr, _ = resolve_symbol_address_and_size(symbols[arg_name], frame)
        if addr is None or addr == 0:
            print(f"[!] pre-transform: '{arg_name}' resolved to null/"
                  f"unresolvable address for label '{label}' -- skipping",
                  file=sys.stderr)
            bp.delete()
            continue

        try:
            results[label] = read_bytes(addr, size)
            print(f"[debug] pre-transform captured '{label}' "
                  f"({size} bytes from {func}:{arg_name})", file=sys.stderr)
        except gdb.error as e:
            print(f"[!] pre-transform: failed to read {size} bytes at "
                  f"0x{addr:x} for label '{label}': {e}", file=sys.stderr)

        # Delete immediately -- we only want the FIRST call to this
        # function captured under this label.
        bp.delete()

    return results


def run_collect():
    elf_path = os.environ["GDB_DRIVER_ELF"]
    witness_path = os.environ["GDB_DRIVER_CAPTURE_WITNESS"]
    fut_name = os.environ["GDB_DRIVER_FUNC"]
    trial_seed = int(os.environ["GDB_DRIVER_TRIAL_SEED"])
    variant = os.environ["GDB_DRIVER_VARIANT"]
    out_dir = os.environ["GDB_DRIVER_OUTDIR"]

    dist_spec_raw = os.environ.get("GDB_DRIVER_DIST_SPEC", "{}")
    try:
        dist_spec = json.loads(dist_spec_raw)
    except json.JSONDecodeError as e:
        raise RuntimeError(
            f"GDB_DRIVER_DIST_SPEC is not valid JSON: {dist_spec_raw!r} ({e})"
        )
    default_dist = os.environ.get("GDB_DRIVER_DEFAULT_DIST", "uniform_bytes")
    if default_dist not in DISTRIBUTIONS:
        raise RuntimeError(
            f"GDB_DRIVER_DEFAULT_DIST='{default_dist}' is not a known "
            f"distribution. Valid options: {sorted(DISTRIBUTIONS.keys())}"
        )
    unknown_keys = [v for v in dist_spec.values() if v not in DISTRIBUTIONS]
    if unknown_keys:
        raise RuntimeError(
            f"GDB_DRIVER_DIST_SPEC references unknown distribution(s) "
            f"{unknown_keys}. Valid options: {sorted(DISTRIBUTIONS.keys())}"
        )

    pre_transform_raw = os.environ.get("GDB_DRIVER_PRE_TRANSFORM_SPEC", "[]")
    try:
        pre_transform_spec = json.loads(pre_transform_raw)
    except json.JSONDecodeError as e:
        raise RuntimeError(
            f"GDB_DRIVER_PRE_TRANSFORM_SPEC is not valid JSON: "
            f"{pre_transform_raw!r} ({e})"
        )
    for spec in pre_transform_spec:
        missing = [k for k in ("label", "func", "arg_name", "size") if k not in spec]
        if missing:
            raise RuntimeError(
                f"GDB_DRIVER_PRE_TRANSFORM_SPEC entry {spec} missing "
                f"required key(s): {missing}"
            )

    with open(witness_path) as f:
        witness = json.load(f)
    formal_args = witness["formal_args"]
    arg_length_by_name = {a["name"]: a.get("length") for a in formal_args if a["kind"] == "ptr"}
    input_names = [a["name"] for a in formal_args if a["kind"] == "ptr"]

    gdb.execute(f"file {elf_path}", to_string=True)
    gdb.execute(f"target remote {GDB_TARGET}", to_string=True)

    frame = break_at_fut_entry(fut_name)

    symbols = collect_all_symbols(frame.block())

    missing_inputs = [n for n in input_names if n not in symbols]
    if missing_inputs:
        raise RuntimeError(
            f"witness expects pointer args {input_names}, but gdb's "
            f"symbol table at this PC is missing: {missing_inputs}. "
            f"Available symbols: {sorted(symbols.keys())}. This usually "
            f"means the breakpoint fired before argument spilling "
            f"completed, or a name mismatch between the .ll and DWARF."
        )
    print(f"[debug] resolved pointer-arg symbols: "
          f"{[s for s in symbols if s in input_names]}", file=sys.stderr)
    if dist_spec:
        print(f"[debug] per-buffer distributions: {dist_spec} "
              f"(default for unlisted buffers: '{default_dist}')",
              file=sys.stderr)

    captures = {}   # name -> (address, size)
    skipped = []
    for name, sym in symbols.items():
        addr, size = resolve_symbol_address_and_size(sym, frame)
        if name in arg_length_by_name:
            size = arg_length_by_name[name]
        if addr is None or size is None:
            skipped.append(name)
            continue
        captures[name] = (addr, size)

    for name in input_names:
        if name in captures and captures[name][0] == 0:
            raise RuntimeError(
                f"input buffer '{name}' resolved to a NULL address "
                f"(0x0) -- this would crash the target on write. "
                f"Aborting before writing/finishing."
            )

    # --- write randomized values into every declared input buffer ---
    rng = random.Random(trial_seed)
    written_inputs = {}
    for a in formal_args:
        if a["kind"] != "ptr":
            continue
        name = a["name"]
        if name not in captures:
            continue
        addr, size = captures[name]
        vals = generate_buffer_values(name, size, rng, dist_spec, default_dist)
        write_bytes(addr, vals)
        written_inputs[name] = vals

    # --- NEW: capture pre-transform snapshots (e.g. pre-NTT s1/s2),
    # BEFORE running to completion. Each spec transiently breaks,
    # dumps, deletes its own breakpoint, and resumes -- so execution
    # continues seamlessly into the remaining pre-transform captures
    # and then into the normal `finish` below. ---
    pre_transform_captured = capture_pre_transform(pre_transform_spec)

    # --- run to completion (handles internal loops transparently) ---
    status = "completed"
    try:
        gdb.execute("finish", to_string=True)
    except gdb.error as e:
        status = f"gdb_error_during_finish: {e}"

    # --- read every captured symbol's final memory content ---
    dumped = {}
    if status == "completed":
        for name, (addr, size) in captures.items():
            try:
                dumped[name] = read_bytes(addr, size)
            except gdb.error:
                dumped[name] = None
    else:
        dumped = {name: None for name in captures}
        print(f"[!] skipping all memory reads -- target connection lost "
              f"({status}); captured data would be unreliable (stale "
              f"ELF-image fallback, not live memory)")

    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, f"{variant}_trial{trial_seed:06d}.json")
    with open(out_path, "w") as f:
        json.dump({
            "status": status,
            "inputs": written_inputs,
            "captured": dumped,
            "pre_transform": pre_transform_captured,
            "skipped_symbols": skipped,
            "dist_spec": dist_spec,
            "default_dist": default_dist,
        }, f)

    try:
        gdb.execute("kill", to_string=True)
    except gdb.error:
        pass

    print(f"[collect-internal] {variant} seed={trial_seed} status={status} "
          f"captured={list(dumped.keys())} "
          f"pre_transform={list(pre_transform_captured.keys())} -> {out_path}")


def main():
    run_collect()


if __name__ == "__main__":
    main()