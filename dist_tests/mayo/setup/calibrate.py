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

SKIP_CALIBRATION_BELOW = 128  # buffers <= this size: just use full
                                 # length directly, calibration overhead
                                 # isn't worth it for small buffers


def launch_qemu(elf_path, machine, gdb_port=1234):
    proc = subprocess.Popen(
        ["qemu-system-arm", "-M", machine, "-kernel", elf_path,
         "-nographic", "-semihosting", "-S", "-gdb", f"tcp::{gdb_port}"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    time.sleep(0.3)
    return proc


_DRIVER_SCRIPT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "driver_dist.py")

def run_probe(elf_path, witness_path, func, field_mod, buf_name,
               probe_len, seed, co_seed, machine):
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
        "GDB_DRIVER_CO_SEED": str(co_seed),
        "GDB_DRIVER_PROBE_OUT": probe_out,
    })
    result = subprocess.run(
        ["gdb-multiarch", "-nx", "-batch", "-x", _DRIVER_SCRIPT],
        env=env, capture_output=True, text=True,
    )
    qemu_proc.terminate()
    qemu_proc.wait(timeout=5)

    if not os.path.exists(probe_out) or os.path.getsize(probe_out) == 0:
        raise RuntimeError(
            f"probe (buf={buf_name}, len={probe_len}, seed={seed}) produced "
            f"no output.\n--- gdb stdout ---\n{result.stdout}\n"
            f"--- gdb stderr ---\n{result.stderr}"
        )

    with open(probe_out) as f:
        result_json = json.load(f)
    os.unlink(probe_out)
    return result_json

def calibrate_buffer(elf_path, witness_path, func, field_mod, buf_name,
                      full_length, machine, n_repeats=3, base_seed=0):
    """
    Find the minimal prefix length L such that zeroing everything from
    index L onward still reproduces the SAME output as using the full
    buffer -- i.e. the point past which additional bytes no longer
    influence the FUT. This is different from "does prefix L differ
    from an all-zero input", which is trivially true for L=1 whenever
    byte 0 matters at all, and does not measure how far sensitivity
    extends.
    """
    co_seed = base_seed

    # Reference: probe with the FULL buffer active (probe_len=full_length).
    # Held fixed -- every candidate L is compared against this, not zero.
    reference = run_probe(elf_path, witness_path, func, field_mod,
                           buf_name, full_length, base_seed, co_seed, machine)

    def matches_reference(length):
        for r in range(n_repeats):
            result = run_probe(elf_path, witness_path, func, field_mod,
                                buf_name, length, base_seed, co_seed, machine)
            # NOTE: same probe_seed as reference each time -- only the
            # zeroed suffix differs between `length` and `full_length`,
            # so a mismatch means some byte >= length genuinely mattered.
            if result != reference:
                return False
        return True

    if matches_reference(0):
        # Not sensitive to ANY byte of this buffer at all.
        print(f"[!] {buf_name}: output identical to full-buffer reference "
              f"even with prefix length 0 -- buffer may be unused.")
        return 0

    # Exponential growth: find an upper bound where output already
    # matches the full-buffer reference.
    lo, hi = 0, 1
    while hi < full_length and not matches_reference(hi):
        lo = hi
        hi = min(hi * 2, full_length)

    if not matches_reference(hi):
        return full_length

    # Binary search within (lo, hi] for the minimal L that matches.
    while hi - lo > 1:
        mid = (lo + hi) // 2
        if matches_reference(mid):
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