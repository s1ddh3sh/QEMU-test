#!/usr/bin/env python3
"""
calibrate.py — determines the empirically "active" (input-sensitive)
prefix length of each input buffer, by binary search against the
correct.elf's output. Writes active_lengths.json for use by the N-trial
collection step.

Assumption (worth checking if a buffer's calibrated length looks wrong):
the FUT reads a CONTIGUOUS PREFIX of each input buffer -- i.e. sensitivity
to input bytes is monotonic in prefix length. This holds for straightforward
m/n-bounded loops (mat_add, lincomb) but can fail for non-contiguous access
patterns (e.g. strided or pointer-chain access). If a buffer's active
length calibrates to something implausible, fall back to a block-scan
(partition into chunks, probe each independently) instead of prefix binary
search -- not implemented here, flagged as a known limitation.

Usage:
    python3 calibrate.py --witness results/mat_add/qemu_witness.json \
        --elf correct.elf --field-mod 16 --machine mps2-an386
"""

import argparse
import json
import os
import subprocess
import tempfile
import time

SKIP_CALIBRATION_BELOW = 2048  # buffers <= this size: just use full
                                 # length directly, calibration overhead
                                 # isn't worth it for small buffers


def launch_qemu(elf_path, machine, gdb_port=1234):
    proc = subprocess.Popen(
        ["qemu-system-arm", "-M", machine, "-kernel", elf_path,
         "-nographic", "-semihosting", "-S", "-gdb", f"tcp::{gdb_port}"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    time.sleep(0.3)  # let the gdbstub port open
    return proc


def run_probe(elf_path, witness_path, func, field_mod, buf_name,
               probe_len, seed, machine):
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as tf:
        probe_out = tf.name

    qemu_proc = launch_qemu(elf_path, machine)
    env = os.environ.copy()
    env.update({
        "GDB_DRIVER_ELF": elf_path,
        "GDB_DRIVER_WITNESS": witness_path,
        "GDB_DRIVER_FUNC": func,
        "GDB_DRIVER_MODE": "probe",
        "GDB_DRIVER_FIELD_MOD": str(field_mod),
        "GDB_DRIVER_PROBE_BUF": buf_name,
        "GDB_DRIVER_PROBE_LEN": str(probe_len),
        "GDB_DRIVER_PROBE_SEED": str(seed),
        "GDB_DRIVER_PROBE_OUT": probe_out,
    })
    subprocess.run(
        ["gdb-multiarch", "-nx", "-batch", "-x", "driver_dist.py"],
        env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    qemu_proc.terminate()
    qemu_proc.wait(timeout=5)

    with open(probe_out) as f:
        result = json.load(f)
    os.unlink(probe_out)
    return result


def calibrate_buffer(elf_path, witness_path, func, field_mod, buf_name,
                      full_length, machine, n_repeats=3, base_seed=0):
    """
    Binary search the minimal prefix length L such that:
      - probing with length L produces output DIFFERENT from the all-zero
        baseline (i.e. some byte in [0, L) matters), and
      - probing with length L-1 (or the last confirmed-inactive length)
        produces output IDENTICAL to baseline.

    Uses n_repeats different seeds per candidate length to guard against
    a single unlucky random draw (e.g. randomly landing on the value 0,
    which wouldn't change output even at a truly active position).
    """
    baseline = run_probe(elf_path, witness_path, func, field_mod,
                          buf_name, 0, base_seed, machine)

    def differs_from_baseline(length):
        for r in range(n_repeats):
            result = run_probe(elf_path, witness_path, func, field_mod,
                                buf_name, length, base_seed + 1000 + r, machine)
            if result != baseline:
                return True
        return False

    # exponential search for an upper bound where sensitivity is confirmed
    lo, hi = 0, 1
    while hi < full_length and not differs_from_baseline(hi):
        lo = hi
        hi = min(hi * 2, full_length)

    if not differs_from_baseline(hi):
        # never observed any sensitivity at all, even at full_length --
        # this buffer may be entirely unused, OR the monotonic-prefix
        # assumption doesn't hold (see module docstring). Report full
        # length conservatively rather than 0, and flag for review.
        print(f"[!] {buf_name}: no sensitivity detected up to full length "
              f"{full_length} -- prefix-monotonicity assumption may not "
              f"hold, or buffer is genuinely unused. Using full length.")
        return full_length

    # binary search within (lo, hi]
    while hi - lo > 1:
        mid = (lo + hi) // 2
        if differs_from_baseline(mid):
            hi = mid
        else:
            lo = mid

    return hi


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--witness", required=True)
    ap.add_argument("--elf", required=True, help="correct.elf")
    ap.add_argument("--field-mod", type=int, default=16)
    ap.add_argument("--machine", default="mps2-an386")
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    with open(args.witness) as f:
        spec = json.load(f)
    layout = spec["layout"]
    func = spec["function"]

    active_lengths = {}
    for name, s in layout.items():
        if s.get("role") != "input":
            continue
        full_len = s["length"]
        if full_len <= SKIP_CALIBRATION_BELOW:
            active_lengths[name] = full_len
            print(f"[i] {name}: length {full_len} <= threshold, skipping calibration")
            continue

        print(f"[i] calibrating {name} (full length {full_len})...")
        active_len = calibrate_buffer(args.elf, args.witness, func,
                                       args.field_mod, name, full_len,
                                       args.machine)
        active_lengths[name] = active_len
        print(f"[i] {name}: active length = {active_len} / {full_len}")

    out_path = args.out or os.path.join(os.path.dirname(args.witness), "active_lengths.json")
    with open(out_path, "w") as f:
        json.dump(active_lengths, f, indent=2)
    print(f"[+] wrote {out_path}")
    print(json.dumps(active_lengths, indent=2))


if __name__ == "__main__":
    main()