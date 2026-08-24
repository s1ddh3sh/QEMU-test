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
"""

import gdb
import json
import os
import random
import sys

GDB_TARGET = "localhost:1234"


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


# ---------------------------------------------------------------------
# FIX: break past the prologue (no leading '*'), and verify + report
# which pointer-arg symbols gdb actually exposes at this PC, so a
# name/order mismatch is caught explicitly rather than silently zipped
# wrong. This replaces what used to be inline in run_collect().
# ---------------------------------------------------------------------
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


def run_collect():
    elf_path = os.environ["GDB_DRIVER_ELF"]
    witness_path = os.environ["GDB_DRIVER_CAPTURE_WITNESS"]
    fut_name = os.environ["GDB_DRIVER_FUNC"]
    trial_seed = int(os.environ["GDB_DRIVER_TRIAL_SEED"])
    variant = os.environ["GDB_DRIVER_VARIANT"]
    out_dir = os.environ["GDB_DRIVER_OUTDIR"]

    with open(witness_path) as f:
        witness = json.load(f)
    formal_args = witness["formal_args"]
    arg_length_by_name = {a["name"]: a.get("length") for a in formal_args if a["kind"] == "ptr"}
    input_names = [a["name"] for a in formal_args if a["kind"] == "ptr"]

    gdb.execute(f"file {elf_path}", to_string=True)
    gdb.execute(f"target remote {GDB_TARGET}", to_string=True)

    # --- FIX APPLIED HERE: use the prologue-skipping breakpoint ---
    frame = break_at_fut_entry(fut_name)

    symbols = collect_all_symbols(frame.block())

    # --- FIX APPLIED HERE: verify pointer-arg symbols by NAME, not
    # position, and fail loudly (not silently mis-zip) if any expected
    # input buffer isn't resolvable at this PC. ---
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

    # Sanity check: every input buffer must have resolved to a nonzero
    # address -- catches the exact null-pointer failure mode we just
    # fixed, in case it recurs for a different reason later.
    for name in input_names:
        if name in captures and captures[name][0] == 0:
            raise RuntimeError(
                f"input buffer '{name}' resolved to a NULL address "
                f"(0x0) -- this would crash the target on write. "
                f"Aborting before writing/finishing."
            )

    # --- write randomized bytes into every declared input buffer ---
    rng = random.Random(trial_seed)
    written_inputs = {}
    for a in formal_args:
        if a["kind"] != "ptr":
            continue
        name = a["name"]
        if name not in captures:
            continue
        addr, size = captures[name]
        vals = [rng.randrange(256) for _ in range(size)]
        write_bytes(addr, vals)
        written_inputs[name] = vals

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
            "skipped_symbols": skipped,
        }, f)

    try:
        gdb.execute("kill", to_string=True)
    except gdb.error:
        pass

    print(f"[collect-internal] {variant} seed={trial_seed} status={status} "
          f"captured={list(dumped.keys())} -> {out_path}")


def main():
    run_collect()


if __name__ == "__main__":
    main()