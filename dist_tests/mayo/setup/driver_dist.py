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
def connect(elf_path):
    # print(f"[debug] elf_path = {elf_path}", file=sys.stderr)
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




def random_fill(rng, field_mod, length):
    return [rng.randrange(field_mod) for _ in range(length)]


def run_to_completion_and_dump(layout):
    """Assumes buffers already written; finishes the FUT call and dumps
    every output-role buffer in full (per its layout length)."""
    gdb.execute("finish", to_string=True)
    return None  # caller reads via addr_of after this returns

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

    with open(witness_path) as f:
        layout = json.load(f)["layout"]

    connect(elf_path)

    main_entry = int(gdb.parse_and_eval("(unsigned long)&main")) & ~1
    bp_main = gdb.Breakpoint(f"*0x{main_entry:x}", internal=False)
    gdb.execute("continue", to_string=True)
    frame = gdb.selected_frame()
    if frame.name() != "main":
        raise RuntimeError(f"stopped in '{frame.name()}', expected 'main'")
    bp_main.delete()

    return_addr = int(gdb.parse_and_eval("$lr")) & ~1
    ret_bp = gdb.Breakpoint(f"*0x{return_addr:x}", internal=False)

    # Resolve every address FIRST -- before any writes -- so addr_of is
    # fully populated before the randomization loop below touches it.
    scalar_addr = {}
    for name, spec in layout.items():
        if spec.get("type") != "scalar":
            continue
        scalar_addr[name] = int(gdb.parse_and_eval(f"&{spec['anchor']}"))

    ptr_names = [n for n, s in layout.items() if s.get("type") != "scalar"]
    ptr_addr = {}
    if ptr_names:
        fn_bp = gdb.Breakpoint(f"*{func}", internal=False)
        gdb.execute("continue", to_string=True)
        fframe = gdb.selected_frame()
        if fframe.name() != func:
            raise RuntimeError(f"stopped in '{fframe.name()}', expected '{func}'")
        fn_bp.delete()
        ptr_args = get_pointer_args(fframe)
        if len(ptr_args) != len(ptr_names):
            raise RuntimeError(
                f"layout has {len(ptr_names)} pointer buffers {ptr_names}, but "
                f"{func} has {len(ptr_args)} pointer args"
            )
        ptr_addr = {n: int(sym.value(fframe)) for n, sym in zip(ptr_names, ptr_args)}

    addr_of = {**scalar_addr, **ptr_addr}

    # Now randomize: the probed buffer's prefix uses probe_seed (varies
    # per repeat); every OTHER pointer-buffer input uses co_seed (fixed
    # across the whole calibration of this buffer) -- leaving co-buffers
    # at zero would mask multiplicative dependencies like mat_mul's O*x.
    rng = random.Random(probe_seed)
    co_rng = random.Random(co_seed)
    for name, spec in layout.items():
        if spec.get("role") != "input":
            continue
        if name == probe_buf:
            vals = random_fill(rng, field_mod, probe_len)
            write_bytes(addr_of[name], vals)
        elif spec.get("type") != "scalar":
            fill_len = spec["length"]
            vals = random_fill(co_rng, field_mod, fill_len)
            write_bytes(addr_of[name], vals)
        # non-probed scalar inputs: left at compiled-in init_value

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

    with open(witness_path) as f:
        layout = json.load(f)["layout"]
    with open(active_lengths_path) as f:
        active_lengths = json.load(f)

    connect(elf_path)
    # main_sym = gdb.lookup_global_symbol("main")
    # if main_sym is None:
    #     raise RuntimeError("could not resolve symbol 'main'")
    main_entry = int(gdb.parse_and_eval("(unsigned long)&main")) & ~1  # clear Thumb bit
    if main_entry == 0:
        raise RuntimeError("could not resolve symbol 'main' via parse_and_eval")

    bp_main = gdb.Breakpoint(f"*0x{main_entry:x}", internal=False)
    gdb.execute("continue", to_string=True)
    frame = gdb.selected_frame()
    if frame.name() != "main":
        raise RuntimeError(f"stopped in '{frame.name()}', expected 'main'")
    bp_main.delete()
    # print(gdb.execute("x/1i $pc", to_string=True), file=sys.stderr)  # sanity check

    return_addr = int(gdb.parse_and_eval("$lr")) & ~1  # clear Thumb bit
    ret_bp = gdb.Breakpoint(f"*0x{return_addr:x}", internal=False)  
    # print(gdb.execute("disassemble main", to_string=True), file=sys.stderr)
    # print(gdb.execute(f"info symbol {return_addr:#x}", to_string=True), file=sys.stderr)
    # print(gdb.execute(f"print/x &__mbc_arg_add_f_a", to_string=True), file=sys.stderr)
    # print(gdb.execute(f"print/x &__mbc_arg_add_f_b", to_string=True), file=sys.stderr)
    rng = random.Random(trial_seed)
    written_inputs = {}

    # Patch scalar input anchors now -- main() hasn't executed any loads yet.
    scalar_addr = {}
    for name, spec in layout.items():
        if spec.get("type") != "scalar":
            continue
        addr = int(gdb.parse_and_eval(f"&{spec['anchor']}"))
        scalar_addr[name] = addr
        if spec.get("role") == "input":
            val = rng.randrange(field_mod)
            write_bytes(addr, [val])
            readback = read_bytes(addr, 1)
            # print(f"[debug] wrote {val} to {name}@0x{addr:x}, readback={readback}", file=sys.stderr)
            written_inputs[name] = [val]

    # Patch pointer buffer inputs, if any (unchanged logic from before).
    ptr_names = [n for n, s in layout.items() if s.get("type") != "scalar"]
    ptr_addr = {}
    if ptr_names:
        fn_bp = gdb.Breakpoint(f"*{func}", internal=False)
        gdb.execute("continue", to_string=True)
        fframe = gdb.selected_frame()
        if fframe.name() != func:
            raise RuntimeError(f"stopped in '{fframe.name()}', expected '{func}'")
        fn_bp.delete()
        ptr_args = get_pointer_args(fframe)
        if len(ptr_args) != len(ptr_names):
            raise RuntimeError(
                f"layout has {len(ptr_names)} pointer buffers {ptr_names}, but "
                f"{func} has {len(ptr_args)} pointer args"
            )
        ptr_addr = {n: int(sym.value(fframe)) for n, sym in zip(ptr_names, ptr_args)}
        for name, spec in layout.items():
            if spec.get("type") == "scalar" or spec.get("role") != "input":
                continue
            fill_len = active_lengths.get(name, spec["length"])
            vals = random_fill(rng, field_mod, fill_len)
            write_bytes(ptr_addr[name], vals)
            written_inputs[name] = vals

    # Run until our manually-placed return-address breakpoint -- main()
    # has fully completed, including its post-call store to the scalar
    # output anchor, and the inferior is still alive.
    gdb.execute("continue", to_string=True)
    ret_bp.delete()

    addr_of = {**scalar_addr, **ptr_addr}
    outputs = {}
    for name, spec in layout.items():
        if spec.get("role") == "output":
            outputs[name] = read_bytes(addr_of[name], spec["length"])
            # print(f"[debug] read {name}@0x{addr_of[name]:x} = {outputs[name]}", file=sys.stderr)

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
    
    if mode == "collect":
        run_collect()
    else:
        print(f"[!] unknown or missing GDB_DRIVER_MODE: {mode!r}", file=sys.stderr)
        sys.exit(2)


if __name__ == "__main__":
    main()