#!/usr/bin/env python3
"""
collect_paired_sweep.py — sweeps a chosen secret position through every
value in [0, field_mod), running both correct.elf and faulty.elf at each
value, with ONE shared background input p held fixed across the entire
sweep (same trial_seed for every run).

Cost: field_mod * 2 QEMU boots total (e.g. 16 * 2 = 32 for GF(16)) --
enough to look up every (s1, s2) pair's raw (y1,y2,y3,y4) outputs, since
all pairs share the same 16 already-computed per-value results. This does
NOT produce a statistical test (no p-values) -- it's a raw, descriptive
comparison for a single background p. For a real hypothesis test across
multiple backgrounds, --n-seeds must be > 1 (see ineffective_paired_test.py
for how multi-seed data would be tested; single-seed output is meant to be
read directly).

Usage:
    python3 collect_paired_sweep.py --witness .../qemu_witness.json \
        --active-lengths .../active_lengths.json \
        --correct-elf correct.elf --faulty-elf faulty.elf \
        --func m_vec_add --field-mod 16 \
        --secret-buf in --secret-pos 0 \
        --outdir .../dist_paired --fixed-scalars m_vec_limbs
"""

import argparse
import json
import os
import subprocess
import time


def launch_qemu(elf_path, machine, gdb_port=1234):
    proc = subprocess.Popen(
        ["qemu-system-arm", "-M", machine, "-kernel", elf_path,
         "-nographic", "-semihosting", "-S", "-gdb", f"tcp::{gdb_port}"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    time.sleep(0.3)
    return proc


_DRIVER_SCRIPT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "driver_dist.py")


def run_one(elf_path, witness_path, active_lengths_path, func, field_mod,
            seed, variant, out_path, machine, fixed_scalars,
            secret_buf, secret_pos, secret_val):
    qemu_proc = launch_qemu(elf_path, machine)
    env = os.environ.copy()
    env.update({
        "GDB_DRIVER_ELF": elf_path,
        "GDB_DRIVER_WITNESS": witness_path,
        "GDB_DRIVER_FUNC": func,
        "GDB_DRIVER_MODE": "collect",
        "GDB_DRIVER_FIELD_MOD": str(field_mod),
        "GDB_DRIVER_ACTIVE_LENGTHS": active_lengths_path,
        "GDB_DRIVER_TRIAL_SEED": str(seed),
        "GDB_DRIVER_VARIANT": variant,
        "GDB_DRIVER_OUTDIR": os.path.dirname(out_path),
        "GDB_DRIVER_FIXED_SCALARS": fixed_scalars,
        "GDB_DRIVER_OVERRIDE_BUF": secret_buf,
        "GDB_DRIVER_OVERRIDE_POS": str(secret_pos),
        "GDB_DRIVER_OVERRIDE_VAL": str(secret_val),
    })
    subprocess.run(
        ["gdb-multiarch", "-nx", "-batch", "-x", _DRIVER_SCRIPT],
        env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    qemu_proc.terminate()
    qemu_proc.wait(timeout=5)

    produced = os.path.join(os.path.dirname(out_path), f"{variant}_trial{seed:06d}.json")
    if os.path.exists(produced):
        os.replace(produced, out_path)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--witness", required=True)
    ap.add_argument("--active-lengths", required=True)
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument("--field-mod", type=int, default=16)
    ap.add_argument("--outdir", required=True)
    ap.add_argument("--machine", default="mps2-an386")
    ap.add_argument("--fixed-scalars", default="")
    ap.add_argument("--secret-buf", required=True)
    ap.add_argument("--secret-pos", type=int, required=True,
                     help="byte position within secret-buf to sweep")
    ap.add_argument("--seed", type=int, default=0,
                     help="single shared background seed p for every run")
    args = ap.parse_args()

    os.makedirs(args.outdir, exist_ok=True)

    print(f"[i] sweeping {args.secret_buf}[{args.secret_pos}] over "
          f"{args.field_mod} values, background seed p={args.seed} "
          f"(shared across the whole sweep)")
    print(f"[i] total executions: {args.field_mod} * 2 = {args.field_mod * 2}")

    for sval in range(args.field_mod):
        c_path = os.path.join(args.outdir, f"correct_sv{sval:02d}.json")
        f_path = os.path.join(args.outdir, f"faulty_sv{sval:02d}.json")
        print(f"  s={sval}: correct + faulty")
        run_one(args.correct_elf, args.witness, args.active_lengths, args.func,
                args.field_mod, args.seed, "correct", c_path, args.machine,
                args.fixed_scalars, args.secret_buf, args.secret_pos, sval)
        run_one(args.faulty_elf, args.witness, args.active_lengths, args.func,
                args.field_mod, args.seed, "faulty", f_path, args.machine,
                args.fixed_scalars, args.secret_buf, args.secret_pos, sval)

    print(f"[i] done. {args.field_mod} secret values x 2 variants "
          f"= {args.field_mod * 2} runs in {args.outdir}")


if __name__ == "__main__":
    main()