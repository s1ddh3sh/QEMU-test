#!/usr/bin/env python3
"""
driver_dist.py — gdb batch-mode driver with two modes:

  probe   : write a random prefix of ONE buffer, zero elsewhere, run,
            dump outputs. Used by calibrate.py for binary search.
  collect : write a randomized value (per active_lengths.json) of EVERY
            input buffer, run, dump outputs. Used for N-trial data
            collection against correct/faulty ELF pairs, and for the
            paired secret-sweep collector (collect_dist.py) via the
            GDB_DRIVER_OVERRIDE_* env vars below.

Address recovery: pointer buffers are resolved off the FUT's raw-entry
breakpoint frame (debug info required on the FUT itself). Scalar
arguments are backed by patchable global anchors (__mbc_arg_<fn>_<arg>)
and resolved via gdb.parse_and_eval, since they have no debug symbol
and never appear as pointer args on the frame.

Timing notes (hard-won, do not "simplify" without re-reading these):
  - main() must be broken at its TRUE entry address (resolved via
    parse_and_eval, not a name-based breakpoint) -- GDB's name/prologue
    resolution can land mid-prologue, after some scalar-anchor loads
    have already executed, silently capturing stale values into
    registers before the driver's write ever lands.
  - Scalar anchors must be written AFTER Reset_Handler's .data copy has
    run (i.e. after main() is reached) but BEFORE main() reaches the
    load instruction that consumes them -- writing before Reset_Handler
    finishes gets silently overwritten by the .data init copy.
  - main()'s caller (Reset_Handler / crt0) has no debug/CFI info, so
    `finish` cannot unwind out of main(). Instead, $lr is captured at
    main()'s true entry (before anything overwrites it) and used to set
    an explicit return-address breakpoint, so the driver can stop
    exactly when main() completes while the inferior is still alive
    (letting it run to its natural semihosting exit tears down memory,
    and any read afterward silently returns the ELF's static image
    instead of raising an error).

Required env vars (all modes):
    GDB_DRIVER_ELF        path to the ELF
    GDB_DRIVER_WITNESS    path to qemu_witness.json (layout only)
    GDB_DRIVER_FUNC       function-under-test name
    GDB_DRIVER_MODE       "probe" | "collect"
    GDB_DRIVER_FIELD_MOD  fallback uniform-byte range (see distribution
                          notes below), e.g. 256

Optional (all modes):
    GDB_DRIVER_FIXED_SCALARS  comma-separated list of scalar layout
                              names that must stay at their compiled-in
                              init_value every run (a structural
                              parameter), instead of being randomized
                              like a normal fuzzed input.
    GDB_DRIVER_KYBER_K        Kyber security parameter K (2/3/4), used
                              only to pick the correct KYBER_ETA1 for
                              "centered binomial distribution, eta1"
                              sampling. Default: 3 (KYBER_ETA1=2).

probe mode additionally needs:
    GDB_DRIVER_PROBE_BUF     name of the buffer being probed
    GDB_DRIVER_PROBE_LEN     prefix length to randomize
    GDB_DRIVER_PROBE_SEED    RNG seed (int) for the probed buffer
    GDB_DRIVER_CO_SEED       RNG seed (int) for every OTHER pointer
                             buffer input, held fixed across the whole
                             calibration of one buffer so co-buffer
                             noise doesn't masquerade as sensitivity
    GDB_DRIVER_PROBE_OUT     path to write result JSON

    probe mode always uses a plain uniform byte fill in [0, field_mod),
    ignoring any declared "distribution" -- calibration only cares
    which BYTE offsets influence the output, not whether the bytes
    decode to a realistic field/polynomial element (see calibrate.py's
    module docstring).

collect mode additionally needs:
    GDB_DRIVER_ACTIVE_LENGTHS  path to active_lengths.json
    GDB_DRIVER_TRIAL_SEED      RNG seed for this trial (int)
    GDB_DRIVER_VARIANT         "correct" | "faulty"
    GDB_DRIVER_OUTDIR          results directory

collect mode optionally supports a single-position override, used by the
paired secret-sweep collector to hold a background input fixed while
forcing ONE buffer's ONE position to an explicit value (rather than the
normal randomized fill), for EITHER a pointer buffer OR a scalar-anchor
buffer:
    GDB_DRIVER_OVERRIDE_BUF   name of the buffer/scalar to override
    GDB_DRIVER_OVERRIDE_POS   byte position within that buffer to
                              override (scalars are always position 0)
    GDB_DRIVER_OVERRIDE_VAL   the value to force at that position

Witness layout entries support two extra optional keys, on top of the
usual "role"/"length"/"type"/"anchor"/"init_value":

    "also_input": true
        For buffers that are BOTH written before the call AND read as
        output afterward (e.g. an in-place transform like poly_ntt's
        r). The buffer is randomized before the call like a normal
        input, but its pre-call snapshot is recorded under the key
        "<name>_pre" in the trial JSON's "inputs" section -- NOT under
        "<name>" -- so it never collides with the genuine post-call
        value recorded under "<name>" in "outputs".

    "distribution": "<one of the documented Kyber distributions>"
        Set by extract_qemu_witness.py from the function_inputs
        sample's "distribution" dict. collect mode samples this
        buffer/scalar's randomized fill from the matching Kyber-shaped
        distribution (centered binomial, an R_q polynomial domain, a
        byte string, ...) instead of a flat uniform byte fill -- see
        sample_for_distribution() below for exactly how each one is
        interpreted. A buffer with no "distribution" key (e.g. a raw
        uint8_t* recorded only as a scalar trace byte, like
        crypto_kem_keypair's pk/sk in the task's own example) falls
        back to the plain uniform [0, field_mod) fill, same as probe
        mode.

Expects QEMU already running:
    qemu-system-arm -M mps2-an386 -kernel <elf> -nographic -semihosting -S -gdb tcp::1234
"""

import gdb
import json
import os
import random
import sys

GDB_TARGET = "localhost:1234"


# ---------------------------------------------------------------------------
# Memory helpers
# ---------------------------------------------------------------------------

def write_bytes(addr, values):
    inferior = gdb.selected_inferior()
    packed = bytes(v & 0xFF for v in values)
    inferior.write_memory(addr, packed)


def read_bytes(addr, count):
    inferior = gdb.selected_inferior()
    raw = inferior.read_memory(addr, count)
    return list(bytes(raw))


def random_fill(rng, field_mod, length):
    return [rng.randrange(field_mod) for _ in range(length)]


# ---------------------------------------------------------------------------
# Kyber distribution-aware sampling (collect mode only -- see module
# docstring; probe mode always uses plain random_fill above).
# ---------------------------------------------------------------------------

KYBER_Q = 3329
KYBER_K = int(os.environ.get("GDB_DRIVER_KYBER_K", "3"))
KYBER_ETA1 = {2: 3, 3: 2, 4: 2}.get(KYBER_K, 2)
KYBER_ETA2 = 2


def _int16_le(val):
    """Two's-complement little-endian encoding of a signed value, as
    used for poly.coeffs[i] (int16_t) throughout the reference impl."""
    val &= 0xFFFF
    return [val & 0xFF, (val >> 8) & 0xFF]


def _cbd_sample(rng, eta):
    """One centered-binomial-distribution coefficient with parameter
    eta: sum of eta random bits minus sum of eta random bits, range
    [-eta, eta] -- matches indcpa's cbd.c algorithm shape (not its
    exact byte-packing, since here we sample bit-by-bit from rng
    directly rather than unpacking a byte string first)."""
    a = sum(rng.randrange(2) for _ in range(eta))
    b = sum(rng.randrange(2) for _ in range(eta))
    return a - b


def _sample_cbd(rng, eta, n_coeffs):
    out = []
    for _ in range(n_coeffs):
        out.extend(_int16_le(_cbd_sample(rng, eta)))
    return out


def _sample_poly_mod_q(rng, n_coeffs):
    """Uniform coefficient in [0, KYBER_Q). Used for every plain
    coefficient/NTT/Montgomery-adjacent 'poly'/'polyvec' distribution
    where the exact reduction domain isn't load-bearing for a random
    test buffer -- see the distribution table below for the ones that
    intentionally use a looser signed range instead."""
    out = []
    for _ in range(n_coeffs):
        out.extend(_int16_le(rng.randrange(0, KYBER_Q)))
    return out


def _sample_poly_signed(rng, n_coeffs, bound):
    """Uniform signed int16 in [-bound, bound]. Used for Montgomery-
    domain and 'reduced' polynomials, whose valid range is wider than
    (Montgomery) or narrower than (reduced) plain [0, q) -- exact
    bounds aren't load-bearing here, only "plausibly in-domain, signed"
    is."""
    out = []
    for _ in range(n_coeffs):
        out.extend(_int16_le(rng.randrange(-bound, bound + 1)))
    return out


def _sample_message_poly(rng, n_coeffs):
    """A poly with each coefficient the embedding of a random message
    bit: either 0 or round(q/2), matching poly_frommsg's encoding."""
    half_q = (KYBER_Q + 1) // 2
    out = []
    for _ in range(n_coeffs):
        out.extend(_int16_le(half_q if rng.randrange(2) else 0))
    return out


def _sample_raw_bytes(rng, n_bytes):
    return [rng.randrange(256) for _ in range(n_bytes)]


# dist string (exactly as written by trace.h/the function_inputs
# harness) -> (kind, extra). "poly"-shaped kinds are sampled 2 bytes
# (one int16_t) per coefficient; polyvec variants need no special
# handling since their coefficient count simply falls out of the
# buffer's declared byte length (K * 256 coefficients is already what
# the alloca size encodes).
_DISTRIBUTION_TABLE = {
    "centered binomial distribution, eta1": ("cbd", KYBER_ETA1),
    "centered binomial distribution, eta2": ("cbd", KYBER_ETA2),
    "Kyber ciphertext byte string": ("bytes", None),
    "Kyber public key byte string": ("bytes", None),
    "Kyber secret key byte string": ("bytes", None),
    "message byte string": ("bytes", None),
    "shared secret byte string": ("bytes", None),
    "uniform 256-bit byte string": ("bytes", None),
    "message embedded in R_q = Z_q[X]/(X^n + 1)": ("message_poly", None),
    "R_q = Z_q[X]/(X^n + 1), coefficient domain": ("poly_mod_q", None),
    "R_q = Z_q[X]/(X^n + 1), coefficient domain polyvec": ("poly_mod_q", None),
    "R_q = Z_q[X]/(X^n + 1), NTT domain": ("poly_mod_q", None),
    "R_q = Z_q[X]/(X^n + 1), NTT domain polyvec": ("poly_mod_q", None),
    "R_q = Z_q[X]/(X^n + 1), poly": ("poly_mod_q", None),
    "R_q = Z_q[X]/(X^n + 1), polyvec": ("poly_mod_q", None),
    "R_q = Z_q[X]/(X^n + 1), Montgomery domain": ("poly_signed", KYBER_Q - 1),
    "R_q = Z_q[X]/(X^n + 1), reduced coefficients": ("poly_signed", KYBER_Q // 2),
    "R_q = Z_q[X]/(X^n + 1), reduced polynomial": ("poly_signed", KYBER_Q // 2),
    "R_q = Z_q[X]/(X^n + 1), reduced polyvec": ("poly_signed", KYBER_Q // 2),
    "uniform polynomial matrix in R_q": ("poly_mod_q", None),
}


def sample_for_distribution(dist_name, length, rng, field_mod):
    """
    Fill exactly `length` bytes for a buffer/scalar whose declared
    distribution is `dist_name`. Falls back to a plain uniform fill in
    [0, field_mod) if dist_name is falsy/unrecognized.
    """
    entry = _DISTRIBUTION_TABLE.get(dist_name) if dist_name else None
    if entry is None:
        return random_fill(rng, field_mod, length)

    kind, extra = entry
    if kind == "bytes":
        out = _sample_raw_bytes(rng, length)
    else:
        n_coeffs = length // 2
        if kind == "cbd":
            out = _sample_cbd(rng, extra, n_coeffs)
        elif kind == "poly_mod_q":
            out = _sample_poly_mod_q(rng, n_coeffs)
        elif kind == "poly_signed":
            out = _sample_poly_signed(rng, n_coeffs, extra)
        elif kind == "message_poly":
            out = _sample_message_poly(rng, n_coeffs)
        else:
            raise ValueError(f"unhandled distribution kind: {kind!r}")

    # length not an exact multiple of 2 for a poly-shaped distribution
    # would be a witness/harness bug, but don't let that crash a whole
    # collection run -- pad/truncate defensively and keep going.
    if len(out) < length:
        out.extend(_sample_raw_bytes(rng, length - len(out)))
    elif len(out) > length:
        out = out[:length]
    return out


# ---------------------------------------------------------------------------
# Connection / shared setup
# ---------------------------------------------------------------------------

def connect(elf_path):
    gdb.execute(f"file {elf_path}", to_string=True)
    gdb.execute(f"target remote {GDB_TARGET}", to_string=True)


def get_pointer_args(frame):
    block = frame.block()
    while block and not block.function:
        block = block.superblock
    if block is None:
        raise RuntimeError("no debug info block found for this frame")
    args = []
    for sym in block:
        if sym.is_argument and sym.type.code == gdb.TYPE_CODE_PTR:
            args.append(sym)
    return args


def get_fixed_scalars():
    raw = os.environ.get("GDB_DRIVER_FIXED_SCALARS") or ""
    return set(s for s in raw.split(",") if s)


def get_override():
    """
    Returns (override_buf, override_pos, override_val). override_buf is
    "" if no override was requested (the common case for a plain
    collect_dist.py N-trial run) -- callers should treat an empty
    override_buf as "never matches any layout name" and skip the
    override branch entirely.
    """
    override_buf = os.environ.get("GDB_DRIVER_OVERRIDE_BUF", "")
    override_pos = int(os.environ.get("GDB_DRIVER_OVERRIDE_POS", "-1"))
    override_val = int(os.environ.get("GDB_DRIVER_OVERRIDE_VAL", "-1"))
    return override_buf, override_pos, override_val


def break_at_main_true_entry():
    """
    Resolve main()'s TRUE entry address via parse_and_eval (bypassing
    GDB's name/prologue-skip resolution, which has been observed to land
    past the prologue -- after some scalar-anchor loads have already
    executed -- regardless of "main" vs "*main" breakpoint syntax), break
    there, and capture $lr for a later manual return-address breakpoint
    (main()'s caller has no debug/CFI info, so `finish` cannot be used).

    Returns return_addr (int), with the temporary entry breakpoint
    already deleted and execution stopped at main()'s first instruction.
    """
    main_entry = int(gdb.parse_and_eval("(unsigned long)&main")) & ~1
    if main_entry == 0:
        raise RuntimeError("could not resolve symbol 'main' via parse_and_eval")

    bp_main = gdb.Breakpoint(f"*0x{main_entry:x}", internal=False)
    gdb.execute("continue", to_string=True)

    frame = gdb.selected_frame()
    if frame.name() != "main":
        raise RuntimeError(f"stopped in '{frame.name()}', expected 'main'")
    bp_main.delete()

    return_addr = int(gdb.parse_and_eval("$lr")) & ~1
    return return_addr


def resolve_pointer_addrs(func, layout):
    """
    Break at the FUT's raw entry and resolve every pointer-typed layout
    entry off the frame's pointer arguments. Returns ({}, []) (and sets
    no breakpoint) if there are no pointer buffers at all -- callers must
    check ptr_names before assuming a callee frame exists to
    `continue`/return from.
    """
    ptr_names = [n for n, s in layout.items() if s.get("type") != "scalar"]
    if not ptr_names:
        return {}, []

    fn_bp = gdb.Breakpoint(f"*{func}", internal=False)
    gdb.execute("continue", to_string=True)

    frame = gdb.selected_frame()
    if frame.name() != func:
        raise RuntimeError(f"stopped in '{frame.name()}', expected '{func}'")
    fn_bp.delete()

    ptr_args = get_pointer_args(frame)
    if len(ptr_args) != len(ptr_names):
        raise RuntimeError(
            f"layout has {len(ptr_names)} pointer buffers {ptr_names}, but "
            f"{func} has {len(ptr_args)} pointer args "
            f"{[s.name for s in ptr_args]} — order/count mismatch"
        )

    ptr_addr = {n: int(sym.value(frame)) for n, sym in zip(ptr_names, ptr_args)}
    return ptr_addr, ptr_names


# ---------------------------------------------------------------------------
# probe mode
# ---------------------------------------------------------------------------

def run_probe():
    elf_path = os.environ["GDB_DRIVER_ELF"]
    witness_path = os.environ["GDB_DRIVER_WITNESS"]
    func = os.environ["GDB_DRIVER_FUNC"]
    field_mod = int(os.environ["GDB_DRIVER_FIELD_MOD"])
    probe_buf = os.environ["GDB_DRIVER_PROBE_BUF"]
    probe_len = int(os.environ["GDB_DRIVER_PROBE_LEN"])
    probe_seed = int(os.environ["GDB_DRIVER_PROBE_SEED"])
    co_seed = int(os.environ["GDB_DRIVER_CO_SEED"])
    probe_out = os.environ["GDB_DRIVER_PROBE_OUT"]

    fixed_scalars = get_fixed_scalars()

    with open(witness_path) as f:
        layout = json.load(f)["layout"]

    connect(elf_path)

    return_addr = break_at_main_true_entry()
    ret_bp = gdb.Breakpoint(f"*0x{return_addr:x}", internal=False)

    # Resolve every address FIRST -- before any writes -- so addr_of is
    # fully populated before the randomization loop below touches it.
    scalar_addr = {}
    for name, spec in layout.items():
        if spec.get("type") != "scalar":
            continue
        scalar_addr[name] = int(gdb.parse_and_eval(f"&{spec['anchor']}"))

    ptr_addr, ptr_names = resolve_pointer_addrs(func, layout)
    addr_of = {**scalar_addr, **ptr_addr}

    # The probed buffer's prefix uses probe_seed (varies per repeat so
    # calibrate.py's n_repeats can guard against unlucky coincidences);
    # every OTHER pointer-buffer input uses co_seed, held fixed across
    # the whole calibration of one buffer -- leaving co-buffers at zero
    # would mask multiplicative dependencies (e.g. a poly product: an
    # all-zero co-buffer forces the product to zero regardless of the
    # buffer being probed, making it appear insensitive up to its full
    # declared length). Always a plain uniform byte fill, regardless of
    # any declared "distribution" -- see module docstring.
    rng = random.Random(probe_seed)
    co_rng = random.Random(co_seed)

    for name, spec in layout.items():
        if spec.get("type") != "scalar" or spec.get("role") != "input":
            continue
        addr = scalar_addr[name]
        if name in fixed_scalars:
            val = spec.get("init_value", 0)
        elif name == probe_buf:
            val = rng.randrange(field_mod)
        else:
            val = co_rng.randrange(field_mod)
        write_bytes(addr, [val])

    for name in ptr_names:
        spec = layout[name]
        also_in = spec.get("also_input")
        is_input = spec.get("role") == "input" or also_in
        if not is_input:
            continue
        addr = ptr_addr[name]
        if name == probe_buf:
            vals = random_fill(rng, field_mod, probe_len)
        else:
            vals = random_fill(co_rng, field_mod, spec["length"])
        write_bytes(addr, vals)

    gdb.execute("continue", to_string=True)
    ret_bp.delete()

    outputs = {}
    for name, spec in layout.items():
        if spec.get("role") == "output":
            outputs[name] = read_bytes(addr_of[name], spec["length"])

    with open(probe_out, "w") as f:
        json.dump(outputs, f)

    print(f"[probe] {probe_buf} len={probe_len} seed={probe_seed} -> {probe_out}")


# ---------------------------------------------------------------------------
# collect mode
# ---------------------------------------------------------------------------

def run_collect():
    elf_path = os.environ["GDB_DRIVER_ELF"]
    witness_path = os.environ["GDB_DRIVER_WITNESS"]
    func = os.environ["GDB_DRIVER_FUNC"]
    field_mod = int(os.environ["GDB_DRIVER_FIELD_MOD"])
    active_lengths_path = os.environ["GDB_DRIVER_ACTIVE_LENGTHS"]
    trial_seed = int(os.environ["GDB_DRIVER_TRIAL_SEED"])
    variant = os.environ["GDB_DRIVER_VARIANT"]
    out_dir = os.environ["GDB_DRIVER_OUTDIR"]

    fixed_scalars = get_fixed_scalars()
    override_buf, override_pos, override_val = get_override()

    with open(witness_path) as f:
        layout = json.load(f)["layout"]
    with open(active_lengths_path) as f:
        active_lengths = json.load(f)

    connect(elf_path)

    return_addr = break_at_main_true_entry()
    ret_bp = gdb.Breakpoint(f"*0x{return_addr:x}", internal=False)

    rng = random.Random(trial_seed)
    written_inputs = {}

    # -----------------------------------------------------------------
    # Scalar inputs: patch now, at main()'s true entry, before any load
    # instruction that would consume them has executed.
    #
    # Override applies here too (scalars are always a single byte at
    # position 0), NOT just to pointer buffers -- a scalar-anchor-backed
    # argument targeted by a paired sweep would otherwise silently
    # ignore the override.
    # -----------------------------------------------------------------
    scalar_addr = {}
    for name, spec in layout.items():
        if spec.get("type") != "scalar":
            continue
        addr = int(gdb.parse_and_eval(f"&{spec['anchor']}"))
        scalar_addr[name] = addr
        if spec.get("role") != "input":
            continue

        if name in fixed_scalars:
            # Structural parameter that must stay at its compiled-in
            # value every trial, not be randomized over the domain.
            val = spec.get("init_value", 0)
        elif name == override_buf and override_pos == 0:
            # Paired secret-sweep override: force this scalar to an
            # explicit value instead of randomizing it. Scalars are
            # always a single byte, so "position 0" is the only valid
            # override position for them.
            val = override_val
        else:
            val = sample_for_distribution(spec.get("distribution"), 1, rng, field_mod)[0]

        write_bytes(addr, [val])
        written_inputs[name] = [val]

    # -----------------------------------------------------------------
    # Pointer buffer inputs (and also_input buffers, e.g. an in-place
    # transform that is both written before AND read after the call).
    #
    # Sampled from the buffer's declared "distribution" if it has one
    # (centered binomial, an R_q polynomial domain, a byte string, ...),
    # falling back to a plain uniform [0, field_mod) fill otherwise.
    #
    # Override applies to a single byte position within the buffer, if
    # requested and if this is the named override buffer.
    # -----------------------------------------------------------------
    ptr_addr, ptr_names = resolve_pointer_addrs(func, layout)

    for name in ptr_names:
        spec = layout[name]
        also_in = spec.get("also_input")
        is_input = spec.get("role") == "input" or also_in
        if not is_input:
            continue

        fill_len = active_lengths.get(name, spec["length"])
        vals = sample_for_distribution(spec.get("distribution"), fill_len, rng, field_mod)
        write_bytes(ptr_addr[name], vals)

        if name == override_buf and 0 <= override_pos < len(vals):
            vals[override_pos] = override_val
            write_bytes(ptr_addr[name] + override_pos, [override_val])

        # also_input buffers are recorded under a distinct "<name>_pre"
        # key so they never collide with the genuine post-call value
        # recorded under "<name>" in outputs below -- get_buffer() in
        # the test scripts checks "inputs" before "outputs", so writing
        # both under the same key would silently make --out-buf read
        # the PRE-call snapshot instead of the real result.
        key = f"{name}_pre" if also_in else name
        written_inputs[key] = vals

    # -----------------------------------------------------------------
    # Run until our manually-placed return-address breakpoint -- main()
    # has fully completed (including any post-call store to a scalar
    # output anchor), and the inferior is still alive.
    # -----------------------------------------------------------------
    gdb.execute("continue", to_string=True)
    ret_bp.delete()

    addr_of = {**scalar_addr, **ptr_addr}
    outputs = {}
    for name, spec in layout.items():
        if spec.get("role") == "output":
            outputs[name] = read_bytes(addr_of[name], spec["length"])

    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, f"{variant}_trial{trial_seed:06d}.json")
    with open(out_path, "w") as f:
        json.dump({"inputs": written_inputs, "outputs": outputs}, f)


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    mode = os.environ.get("GDB_DRIVER_MODE")
    if mode == "probe":
        run_probe()
    elif mode == "collect":
        run_collect()
    else:
        print(f"[!] unknown or missing GDB_DRIVER_MODE: {mode!r}", file=sys.stderr)
        sys.exit(2)


if __name__ == "__main__":
    main()