#!/usr/bin/env python3
"""
collect_distribution.py — runs N trials against both correct.elf and
faulty.elf, using active_lengths.json to fill only the input-sensitive
prefix of each buffer. Same seed used for both variants of a given
trial so they see identical inputs.

Usage:
    python3 collect_distribution.py --witness results/compute_P3/qemu_witness.json \
        --active-lengths results/compute_P3/active_lengths.json \
        --correct-elf correct.elf --faulty-elf faulty.elf \
        --func compute_P3 --field-mod 16 -n 400 --outdir results/compute_P3/dist
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


def run_collect_trial(elf_path, witness_path, active_lengths_path, func,
                       field_mod, trial_seed, variant, out_dir, machine):
    qemu_proc = launch_qemu(elf_path, machine)
    env = os.environ.copy()
    env.update({
        "GDB_DRIVER_ELF": elf_path,
        "GDB_DRIVER_WITNESS": witness_path,
        "GDB_DRIVER_FUNC": func,
        "GDB_DRIVER_MODE": "collect",
        "GDB_DRIVER_FIELD_MOD": str(field_mod),
        "GDB_DRIVER_ACTIVE_LENGTHS": active_lengths_path,
        "GDB_DRIVER_TRIAL_SEED": str(trial_seed),
        "GDB_DRIVER_VARIANT": variant,
        "GDB_DRIVER_OUTDIR": out_dir,
    })
    subprocess.run(
        ["gdb-multiarch", "-nx", "-batch", "-x", "driver_dist.py"],
        env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    qemu_proc.terminate()
    qemu_proc.wait(timeout=5)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--witness", required=True)
    ap.add_argument("--active-lengths", required=True)
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument("--field-mod", type=int, default=16)
    ap.add_argument("-n", type=int, default=400)
    ap.add_argument("--outdir", required=True)
    ap.add_argument("--machine", default="mps2-an386")
    args = ap.parse_args()

    for i in range(args.n):
        seed = i
        print(f"=== trial {i} (seed={seed}) ===")
        run_collect_trial(args.correct_elf, args.witness, args.active_lengths,
                           args.func, args.field_mod, seed, "correct",
                           args.outdir, args.machine)
        run_collect_trial(args.faulty_elf, args.witness, args.active_lengths,
                           args.func, args.field_mod, seed, "faulty",
                           args.outdir, args.machine)

    print(f"[i] done. {args.n} trial pairs in {args.outdir}")


if __name__ == "__main__":
    main()