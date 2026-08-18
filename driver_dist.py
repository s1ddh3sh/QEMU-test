#!/usr/bin/env python3
"""
driver_dist.py — gdb batch-mode driver with two modes:

  probe   : write a random prefix of ONE buffer, zero elsewhere, run,
            dump outputs. Used by calibrate.py for binary search.
  collect : write a random prefix (per active_lengths.json) of EVERY
            input buffer, run, dump outputs. Used for N-trial data
            collection against correct/faulty ELF pairs.

Address recovery is identical to the original driver.py (pointer-arg
walk off the FUT's raw-entry breakpoint frame) -- no DWARF/global
dependency beyond debug info on the FUT itself.

Required env vars (all modes):
    GDB_DRIVER_ELF        path to the ELF
    GDB_DRIVER_WITNESS    path to qemu_witness.json (layout only)
    GDB_DRIVER_FUNC       function-under-test name
    GDB_DRIVER_MODE       "probe" | "collect"
    GDB_DRIVER_FIELD_MOD  field modulus for random fill, e.g. 16

probe mode additionally needs:
    GDB_DRIVER_PROBE_BUF     name of the buffer being probed
    GDB_DRIVER_PROBE_LEN     prefix length to randomize
    GDB_DRIVER_PROBE_SEED    RNG seed (int)
    GDB_DRIVER_PROBE_OUT     path to write result JSON

collect mode additionally needs:
    GDB_DRIVER_ACTIVE_LENGTHS  path to active_lengths.json
    GDB_DRIVER_TRIAL_SEED      RNG seed for this trial (int)
    GDB_DRIVER_VARIANT         "correct" | "faulty"
    GDB_DRIVER_OUTDIR          results directory

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


# ---------------------------------------------------------------------------
# Address recovery (unchanged from driver.py)
# ---------------------------------------------------------------------------

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


def resolve_addresses(elf_path, function_under_test, layout):
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
    return addr_of


def random_fill(rng, field_mod, length):
    return [rng.randrange(field_mod) for _ in range(length)]


def run_to_completion_and_dump(layout):
    """Assumes buffers already written; finishes the FUT call and dumps
    every output-role buffer in full (per its layout length)."""
    gdb.execute("finish", to_string=True)
    return None  # caller reads via addr_of after this returns


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
    probe_out = os.environ["GDB_DRIVER_PROBE_OUT"]

    with open(witness_path) as f:
        layout = json.load(f)["layout"]

    addr_of = resolve_addresses(elf_path, func, layout)

    rng = random.Random(probe_seed)
    for name, spec in layout.items():
        if spec.get("role") != "input":
            continue
        if name == probe_buf:
            # only the first probe_len bytes of the probed buffer are
            # randomized; everything past probe_len, and every other
            # input buffer entirely, is left at its post-memset default
            # (zero), so any output difference vs. the all-zero baseline
            # can only be attributed to bytes within [0, probe_len).
            vals = random_fill(rng, field_mod, probe_len)
            write_bytes(addr_of[name], vals)
        # all other input buffers: leave untouched (zero from memset)

    gdb.execute("finish", to_string=True)

    outputs = {}
    for name, spec in layout.items():
        if spec.get("role") == "output":
            outputs[name] = read_bytes(addr_of[name], spec["length"])

    with open(probe_out, "w") as f:
        json.dump(outputs, f)

    gdb.execute("kill", to_string=True)
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

    with open(witness_path) as f:
        layout = json.load(f)["layout"]
    with open(active_lengths_path) as f:
        active_lengths = json.load(f)

    addr_of = resolve_addresses(elf_path, func, layout)

    # SAME seed must be used for correct and faulty runs of the same
    # trial_id, so both variants see identical inputs -- the caller is
    # responsible for passing the same GDB_DRIVER_TRIAL_SEED for both.
    rng = random.Random(trial_seed)
    for name, spec in layout.items():
        if spec.get("role") != "input":
            continue
        fill_len = active_lengths.get(name, spec["length"])
        vals = random_fill(rng, field_mod, fill_len)
        write_bytes(addr_of[name], vals)
        # bytes [fill_len, spec['length']) are left at their post-memset
        # default (zero) -- deliberately unrandomized, per calibration.

    gdb.execute("finish", to_string=True)

    outputs = {}
    for name, spec in layout.items():
        if spec.get("role") == "output":
            outputs[name] = read_bytes(addr_of[name], spec["length"])

    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, f"{variant}_trial{trial_seed:06d}.json")
    with open(out_path, "w") as f:
        json.dump(outputs, f)

    gdb.execute("kill", to_string=True)
    print(f"[collect] {variant} seed={trial_seed} -> {out_path}")


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