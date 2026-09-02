#!/usr/bin/env python3
"""
collect_dist.py — sweeps a chosen secret position through every
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
    python3 collect_dist.py --witness .../qemu_witness.json \
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


class RunFailed(Exception):
    """Raised when a single correct/faulty run doesn't produce output."""


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
    try:
        # CHANGED: capture output and enforce a timeout instead of
        # DEVNULL-ing everything -- previously any gdb/driver error
        # (address resolution failure, target crash, python traceback
        # inside driver_dist.py, etc.) was completely invisible, and the
        # caller had no way to know a run had failed at all.
        result = subprocess.run(
            ["gdb-multiarch", "-nx", "-batch", "-x", _DRIVER_SCRIPT],
            env=env, capture_output=True, text=True, timeout=60,
        )
    finally:
        qemu_proc.terminate()
        try:
            qemu_proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            qemu_proc.kill()
            qemu_proc.wait(timeout=5)

    produced = os.path.join(os.path.dirname(out_path), f"{variant}_trial{seed:06d}.json")

    # CHANGED: this used to be a silent no-op ("if exists: rename, else:
    # nothing") -- a failed run and a successful one printed the exact
    # same "s={sval}: correct + faulty" progress line from the caller,
    # with zero indication anything had gone wrong. Now it's a hard
    # error with gdb's actual output attached, since that's the only
    # place the real failure reason (a Python traceback from
    # driver_dist.py, a gdb.MemoryError, a crashed target, etc) exists.
    if not os.path.exists(produced):
        raise RunFailed(
            f"{variant} run for {secret_buf}[{secret_pos}]={secret_val} "
            f"(seed={seed}) produced no output file (expected {produced}).\n"
            f"gdb exit code: {result.returncode}\n"
            f"--- gdb stdout ---\n{result.stdout}\n"
            f"--- gdb stderr ---\n{result.stderr}"
        )
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

    failures = []
    for sval in range(args.field_mod):
        c_path = os.path.join(args.outdir, f"correct_sv{sval:02d}.json")
        f_path = os.path.join(args.outdir, f"faulty_sv{sval:02d}.json")
        print(f"  s={sval}: correct + faulty", flush=True)
        for variant, elf_path, out_path in (
            ("correct", args.correct_elf, c_path),
            ("faulty", args.faulty_elf, f_path),
        ):
            try:
                run_one(elf_path, args.witness, args.active_lengths, args.func,
                        args.field_mod, args.seed, variant, out_path, args.machine,
                        args.fixed_scalars, args.secret_buf, args.secret_pos, sval)
            except RunFailed as e:
                # CHANGED: don't let one failed run silently vanish and
                # don't abort the whole sweep on the first failure either
                # -- report EVERY failure so the pattern (all of them?
                # just one sval? just one variant?) is visible, which is
                # itself useful diagnostic signal.
                print(f"[!] FAILED: {variant} sval={sval}\n{e}", flush=True)
                failures.append((variant, sval, str(e)))

    if failures:
        print(
            f"\n[!] {len(failures)}/{args.field_mod * 2} runs failed to "
            f"produce output. NO correct_sv*.json / faulty_sv*.json files "
            f"exist for the failed (variant, sval) pairs -- see the "
            f"per-failure gdb output above for the real cause (common "
            f"culprits: the secret-buf/secret-pos override hitting an "
            f"address that overlaps/aliases a different buffer due to a "
            f"qemu_witness.json layout bug, or the target crashing "
            f"outright). Fix the underlying issue and re-run -- do not "
            f"trust an empty dist_paired dir silently."
        )
        raise SystemExit(1)

    print(f"[i] done. {args.field_mod} secret values x 2 variants "
          f"= {args.field_mod * 2} runs in {args.outdir}")


if __name__ == "__main__":
    main()