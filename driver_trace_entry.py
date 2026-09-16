#!/usr/bin/env python3
"""
driver_trace_entry.py -- diagnostic only. Does the SAME Phase 0/1 setup as
driver_dist_sig.py (main entry -> mlen anchor -> entry_func breakpoint ->
sig/csk/m/siglen writes, all already confirmed working), then single-steps
through the function's OWN body with `next` (steps over calls, doesn't dive
into mat_mul/shake/etc.), printing every source line, until either:
  - the process exits (prints the last line reached before that happened), or
  - a step lands inside mat_add/mat_add__faulted (prints "reached FUT"), or
  - GDB_DRIVER_TRACE_STEPS steps are exhausted (prints "still going after N").

Run directly, not through collect_dist.py, so you can read the raw trace:

    qemu-system-arm -M mps2-an386 -kernel <elf> -nographic -semihosting -S \\
        -gdb tcp::1234 &
    GDB_DRIVER_ELF=<elf> \\
    GDB_DRIVER_ENTRY_FUNC=pqmayo_MAYO_1_ref_mayo_sign_signature \\
    GDB_DRIVER_ENTRY_OUTPUT_LEN=431 \\
    GDB_DRIVER_ENTRY_CSK_SEED=1 \\
    GDB_DRIVER_FUNC=mat_add \\
    GDB_DRIVER_TRACE_STEPS=80 \\
    gdb-multiarch -nx -batch -x driver_trace_entry.py
"""

import gdb
import os
import random
import sys

GDB_TARGET = "localhost:1234"


def write_bytes(addr, values):
    inferior = gdb.selected_inferior()
    inferior.write_memory(addr, bytes(v & 0xFF for v in values))


def read_bytes(addr, count):
    inferior = gdb.selected_inferior()
    return list(bytes(gdb.selected_inferior().read_memory(addr, count)))


def get_pointer_args(frame):
    block = frame.block()
    while block and not block.function:
        block = block.superblock
    if block is None:
        raise RuntimeError("no debug info block for this frame")
    return [s for s in block if s.is_argument and s.type.code == gdb.TYPE_CODE_PTR]


def resolve_symbol_addr(symbol):
    try:
        return (int(gdb.parse_and_eval(f"(unsigned long)&{symbol}")) & ~1) or None
    except gdb.error:
        return None


def main():
    elf_path = os.environ["GDB_DRIVER_ELF"]
    entry_func = os.environ.get("GDB_DRIVER_ENTRY_FUNC",
                                "pqmayo_MAYO_1_ref_mayo_sign_signature")
    entry_out_len = int(os.environ.get("GDB_DRIVER_ENTRY_OUTPUT_LEN", "431"))
    mlen_value = int(os.environ.get("GDB_DRIVER_ENTRY_MLEN_VALUE", "32"))
    csk_seed = int(os.environ.get("GDB_DRIVER_ENTRY_CSK_SEED", "1"))
    csk_len = int(os.environ.get("GDB_DRIVER_ENTRY_CSK_LEN", "24"))
    func = os.environ.get("GDB_DRIVER_FUNC", "mat_add")
    func_faulted = os.environ.get("GDB_DRIVER_FUNC_FAULTED", f"{func}__faulted")
    n_steps = int(os.environ.get("GDB_DRIVER_TRACE_STEPS", "80"))

    gdb.execute(f"file {elf_path}", to_string=True)
    gdb.execute(f"target remote {GDB_TARGET}", to_string=True)

    # --- Phase 0: main entry, write mlen anchor (identical to driver_dist_sig.py)
    main_entry = int(gdb.parse_and_eval("(unsigned long)&main")) & ~1
    bp_main = gdb.Breakpoint(f"*0x{main_entry:x}", internal=False)
    gdb.execute("continue", to_string=True)
    bp_main.delete()

    mlen_anchor = os.environ.get(
        "GDB_DRIVER_ENTRY_MLEN_ANCHOR", f"__mbc_arg_{entry_func}_mlen")
    try:
        addr = int(gdb.parse_and_eval(f"&{mlen_anchor}"))
        write_bytes(addr, list(mlen_value.to_bytes(4, "little")))
        print(f"[trace] wrote mlen={mlen_value} via '{mlen_anchor}'")
    except gdb.error:
        print(f"[trace] mlen anchor not found; leaving as-is", file=sys.stderr)

    # --- Phase 1: entry_func raw entry, write csk/m/siglen (identical setup)
    addr_entry = resolve_symbol_addr(entry_func)
    if addr_entry is None:
        print(f"[trace] could not resolve '{entry_func}'", file=sys.stderr)
        sys.exit(1)
    bp_entry = gdb.Breakpoint(f"*0x{addr_entry:x}", internal=False)
    gdb.execute("continue", to_string=True)
    bp_entry.delete()

    frame = gdb.selected_frame()
    ptr_args = {s.name: s for s in get_pointer_args(frame)}
    print(f"[trace] stopped at {entry_func} entry, args: {list(ptr_args.keys())}")

    sp = int(gdb.parse_and_eval("$sp"))
    csk_addr = int.from_bytes(bytes(read_bytes(sp + 4, 4)), "little")
    if csk_addr:
        rng = random.Random(csk_seed)
        write_bytes(csk_addr, [rng.randrange(256) for _ in range(csk_len)])
        print(f"[trace] wrote csk at 0x{csk_addr:x} (seed={csk_seed})")

    if "m" in ptr_args:
        m_addr = int(ptr_args["m"].value(frame))
        rng = random.Random(0)
        write_bytes(m_addr, [rng.randrange(256) for _ in range(mlen_value)])
        print(f"[trace] wrote {mlen_value} message bytes at 0x{m_addr:x}")

    if "siglen" in ptr_args:
        sl_addr = int(ptr_args["siglen"].value(frame))
        write_bytes(sl_addr, list(entry_out_len.to_bytes(4, "little")))
        print(f"[trace] set *siglen = {entry_out_len} at 0x{sl_addr:x}")

    fut_addrs = {a for a in (resolve_symbol_addr(func),
                             resolve_symbol_addr(func_faulted)) if a}
    print(f"[trace] FUT addresses to watch for: {[hex(a) for a in fut_addrs]}")

    # --- Step through the function's own body, line by line.
    print(f"[trace] === stepping (up to {n_steps} steps) ===")
    for i in range(n_steps):
        try:
            out = gdb.execute("next", to_string=True)
        except gdb.error as e:
            print(f"[trace] step {i}: gdb error: {e}")
            break

        inferior = gdb.selected_inferior()
        if not inferior.is_valid() or not inferior.threads():
            print(f"[trace] step {i}: PROCESS EXITED. Last `next` output:\n{out}")
            print(f"[trace] === this is the line where it died / exited ===")
            break

        try:
            f = gdb.selected_frame()
            pc = int(f.pc())
        except gdb.error:
            print(f"[trace] step {i}: no frame selected after step. "
                  f"Raw output:\n{out}")
            break

        line = out.strip().replace("\n", " | ")
        print(f"[trace] step {i:3d} pc=0x{pc:x} frame={f.name()}: {line}")

        if pc in fut_addrs:
            print(f"[trace] === reached FUT ({f.name()}) at step {i} -- "
                  f"the earlier fix(es) worked, this was likely a transient "
                  f"issue or fixed by something in this run's setup ===")
            break
    else:
        print(f"[trace] === exhausted {n_steps} steps without exiting or "
              f"reaching the FUT; still inside {entry_func}, increase "
              f"GDB_DRIVER_TRACE_STEPS ===")


if __name__ == "__main__":
    main()