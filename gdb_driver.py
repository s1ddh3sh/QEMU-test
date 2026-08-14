#!/usr/bin/env python3
"""
driver.py — witness replay driver, using an init-helper breakpoint to
recover buffer addresses with no DWARF and no globals dependency.

Relies only on a harness convention already present in the target .ll:
  - each input/output buffer is passed to a plain-calling-convention
    init helper (mayo_memset / mayo_memcpy) right after its alloca,
    in the same order the witness JSON declares them
  - the function under test is called exactly once from main

Usage (inside gdb-multiarch batch mode, one call per ELF):
    gdb-multiarch -nx -batch -x driver.py \
        --args <elf_path> <witness.json> <function_under_test> <trial_id> <variant>

    variant is "correct" or "faulty" — selects which _expected key to check.

Expects QEMU already running:
    qemu-system-arm -M mps2-an386 -kernel <elf> -nographic -semihosting -S -gdb tcp::1234
"""

import gdb
import json
import sys
import struct
import os

GDB_TARGET = "localhost:1234"

# INIT_HOOK_SYMBOLS = ["mayo_memset", "mayo_memcpy"]


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


def read_r0():
    return int(gdb.parse_and_eval("$r0")) & 0xFFFFFFFF


# ---------------------------------------------------------------------------
# Address recovery via init-helper breakpoints
# ---------------------------------------------------------------------------
# def recover_buffer_addresses(num_buffers):
#     """
#     Break at the RAW ENTRY (no prologue skip — note the '*') of every
#     symbol in INIT_HOOK_SYMBOLS, so r0 still holds the untouched incoming
#     argument. Breaking on the plain symbol name instead resolves past the
#     prologue and can leave r0 already clobbered/reused.
#     """
#     bps = [gdb.Breakpoint(f"*{sym}", internal=False) for sym in INIT_HOOK_SYMBOLS
#            if _symbol_exists(sym)]
#     if not bps:
#         raise RuntimeError(f"none of {INIT_HOOK_SYMBOLS} found in this ELF")

#     addrs = []
#     while len(addrs) < num_buffers:
#         gdb.execute("continue", to_string=True)
#         if gdb.selected_thread() is None:
#             raise RuntimeError("target exited before all init calls seen")
#         addrs.append(read_r0())

#     for bp in bps:
#         bp.delete()

#     return addrs


# def _symbol_exists(name):
#     try:
#         gdb.execute(f"info address {name}", to_string=True)
#         return True
#     except gdb.error:
#         return False

def get_pointer_args(frame):
    """
    Return the function's pointer-typed formal parameters, in declaration
    order, by walking the frame's block. Scalar args (m, n, ...) are
    skipped. Relies on the tested function still being debug-info visible
    (DWARF preserved through llc/gcc) at the raw-entry PC.
    """
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

# ---------------------------------------------------------------------------
# Trial execution
# ---------------------------------------------------------------------------
def run_trial(elf_path, function_under_test, inputs, layout):
    gdb.execute(f"file {elf_path}", to_string=True)
    gdb.execute(f"target remote {GDB_TARGET}", to_string=True)

    fn_bp = gdb.Breakpoint(f"*{function_under_test}", internal=False)
    gdb.execute("continue", to_string=True)

    frame = gdb.selected_frame()
    if frame.name() != function_under_test:
        raise RuntimeError(
            f"stopped in '{frame.name()}', expected '{function_under_test}'"
        )
    fn_bp.delete()
    ptr_args = get_pointer_args(frame)
    names = list(layout.keys())
    if len(ptr_args) != len(names):
        raise RuntimeError(
            f"layout has {len(names)} buffers {names}, but "
            f"{function_under_test} has {len(ptr_args)} pointer args "
            f"{[s.name for s in ptr_args]} — order/count mismatch"
        )

    addr_of = {}
    for name, sym in zip(names, ptr_args):
        addr_of[name] = int(sym.value(frame))
    print(f"[i] recovered addresses: {addr_of}")

    for name, values in inputs.items():
        if name not in addr_of:
            continue
        write_bytes(addr_of[name], values)

    gdb.execute("finish", to_string=True)

    outputs = {}
    for name, spec in layout.items():
        if spec.get("role") != "output":
            continue
        outputs[name] = read_bytes(addr_of[name], spec["length"])

    gdb.execute("kill", to_string=True)
    return outputs


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------
def main():
    try:
        elf_path = os.environ["GDB_DRIVER_ELF"]
        witness_path = os.environ["GDB_DRIVER_WITNESS"]
        function_under_test = os.environ["GDB_DRIVER_FUNC"]
        trial_id = os.environ["GDB_DRIVER_TRIAL"]
        variant = os.environ["GDB_DRIVER_VARIANT"]
    except KeyError as e:
        print(f"[!] missing required env var: {e}")
        print("    set GDB_DRIVER_ELF, GDB_DRIVER_WITNESS, GDB_DRIVER_FUNC,")
        print("    GDB_DRIVER_TRIAL, GDB_DRIVER_VARIANT before invoking gdb")
        sys.exit(2)

    with open(witness_path) as f:
        spec = json.load(f)

    layout = spec["layout"]
    trial = next(t for t in spec["trials"] if t["trial_id"] == trial_id)
    inputs = trial["inputs"]
    expected = trial["expected"]

    result = run_trial(elf_path, function_under_test, inputs, layout)

    mismatches = []
    for name, spec_l in layout.items():
        if spec_l.get("role") != "output":
            continue
        exp_key = f"{name}_{variant}"
        if exp_key not in expected:
            continue
        actual = result.get(name, [])
        if actual != expected[exp_key]:
            mismatches.append((name, expected[exp_key], actual))

    if mismatches:
        print(f"[!] MISMATCH on {elf_path} ({trial_id}, {variant}):")
        for name, exp, act in mismatches:
            print(f"    {name}: expected={exp}")
            print(f"    {name}: actual=  {act}")
        print("RESULT : FAIL")
    else:
        print(f"[OK] {trial_id} ({variant}) confirmed on {elf_path}")
        print("RESULT : PASS")


if __name__ == "__main__":
    main()