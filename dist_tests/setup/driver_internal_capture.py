#!/usr/bin/env python3
"""
driver_internal_capture.py — gdb batch-mode driver, generalized: does
NOT know or need to know which locals matter (s1/y/cp/z/...), does NOT
set breakpoints on inner callees, and does NOT need special handling
for rejection loops.

Technique: break once at the FUT's raw entry, resolve the ADDRESS of
every debug-visible local and pointer argument at that point (locals'
stack addresses are fixed for the function's whole lifetime, even
before they're written), write randomized bytes into the declared
input buffers, then run `finish` -- which lets the function run to
completion including any internal loops, however many iterations it
takes. After finish, read every previously-resolved address: since
this is the LAST read after all execution has settled, it automatically
captures final values with no first/last bookkeeping and no dependency
on which internal function produced them.

Required env vars:
    GDB_DRIVER_ELF               path to the ELF
    GDB_DRIVER_CAPTURE_WITNESS   path to capture_witness.json
    GDB_DRIVER_FUNC              FUT name
    GDB_DRIVER_TRIAL_SEED        RNG seed (int)
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
    and locals alike. At -O0 (typical for these harnesses, given the
    .ll shows unoptimized allocas with #dbg_declare at function entry),
    all locals live in the function's outermost block, so frame.block()
    at the entry breakpoint already sees everything. If a target's
    debug info nests locals in deeper lexical blocks not yet "active"
    at entry, those would be missed here -- worth checking `info locals`
    manually once if a variable you expect doesn't show up."""
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
    """Returns (address, byte_size) for a symbol, handling both:
      - pointer-typed formal arguments: VALUE is the address, size is
        unknown from the type alone (caller must supply it separately).
      - array/aggregate locals (alloca'd): the symbol itself is an
        lvalue in memory; .address gives where, .type.sizeof gives size
        directly from debug info -- no manual type-string parsing needed.
    Returns (None, None) if the symbol isn't resolvable at this PC
    (e.g. optimized into a register with no memory location)."""
    try:
        val = sym.value(frame)
    except gdb.error:
        return None, None

    if sym.type.code == gdb.TYPE_CODE_PTR:
        try:
            return int(val), None  # size unknown here, filled from witness
        except gdb.error:
            return None, None
    else:
        try:
            addr = int(val.address)
            size = int(sym.type.sizeof)
            return addr, size
        except (gdb.error, TypeError):
            return None, None


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

    gdb.execute(f"file {elf_path}", to_string=True)
    gdb.execute(f"target remote {GDB_TARGET}", to_string=True)

    fn_bp = gdb.Breakpoint(f"*{fut_name}", internal=False)
    gdb.execute("continue", to_string=True)

    if gdb.selected_thread() is None:
        raise RuntimeError("target exited before reaching FUT entry")
    frame = gdb.selected_frame()
    if frame.name() != fut_name:
        raise RuntimeError(f"stopped in '{frame.name()}', expected '{fut_name}'")
    fn_bp.delete()

    symbols = collect_all_symbols(frame.block())

    # Resolve every symbol's (address, size) at entry, BEFORE running
    # anything -- addresses are stable for the function's whole lifetime.
    captures = {}   # name -> (address, size)
    skipped = []
    for name, sym in symbols.items():
        addr, size = resolve_symbol_address_and_size(sym, frame)
        if name in arg_length_by_name:
            size = arg_length_by_name[name]  # override with witness-declared length
        if addr is None or size is None:
            skipped.append(name)
            continue
        captures[name] = (addr, size)

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
    for name, (addr, size) in captures.items():
        try:
            dumped[name] = read_bytes(addr, size)
        except gdb.error as e:
            dumped[name] = None  # memory became inaccessible post-return

    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, f"{variant}_trial{trial_seed:06d}.json")
    with open(out_path, "w") as f:
        json.dump({
            "status": status,   
            "inputs": written_inputs,
            "captured": dumped,      # includes formal ptr args AND every local
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