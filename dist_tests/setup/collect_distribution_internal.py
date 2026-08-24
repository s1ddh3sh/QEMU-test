#!/usr/bin/env python3
"""collect_distribution_internal.py — N-trial collection using
driver_internal_capture.py. The SAME capture_witness.json (derived
once from correct.elf's .ll) drives both correct.elf and faulty.elf --
this script is where the two ELFs are first both needed."""

import argparse
import os
import subprocess
import time

TRIAL_TIMEOUT_SEC = 30


def launch_qemu(elf_path, machine, gdb_port=1234):
    proc = subprocess.Popen(
        ["qemu-system-arm", "-M", machine, "-kernel", elf_path,
         "-nographic", "-semihosting", "-S", "-gdb", f"tcp::{gdb_port}"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    time.sleep(0.3)
    return proc


def run_collect_trial(elf_path, capture_witness_path, func, trial_seed,
                       variant, out_dir, machine, debug=False):
    qemu_proc = launch_qemu(elf_path, machine)
    env = os.environ.copy()
    env.update({
        "GDB_DRIVER_ELF": elf_path,
        "GDB_DRIVER_CAPTURE_WITNESS": capture_witness_path,
        "GDB_DRIVER_FUNC": func,
        "GDB_DRIVER_TRIAL_SEED": str(trial_seed),
        "GDB_DRIVER_VARIANT": variant,
        "GDB_DRIVER_OUTDIR": out_dir,
    })
    expected_out = os.path.join(out_dir, f"{variant}_trial{trial_seed:06d}.json")
    stdout_target = None if debug else subprocess.DEVNULL
    stderr_target = None if debug else subprocess.DEVNULL

    driver_script = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                  "driver_internal_capture.py")

    result = None
    try:
        result = subprocess.run(
            ["gdb-multiarch", "-nx", "-batch", "-x", driver_script],
            env=env, stdout=stdout_target, stderr=stderr_target,
            timeout=TRIAL_TIMEOUT_SEC,
        )
    except subprocess.TimeoutExpired:
        print(f"[!] trial seed={trial_seed} variant={variant} HUNG "
              f"(>{TRIAL_TIMEOUT_SEC}s) -- killed, no output written")
        return False
    finally:
        qemu_proc.terminate()
        try:
            qemu_proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            qemu_proc.kill()
            qemu_proc.wait()

    if not os.path.exists(expected_out):
        rc = result.returncode if result is not None else "N/A"
        print(f"[!] trial seed={trial_seed} variant={variant} produced NO "
              f"output file at {expected_out} -- gdb exit code {rc}. "
              f"Re-run with --debug to see gdb's actual output.")
        return False
    return True


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--capture-witness", required=True)
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument("-n", type=int, default=400)
    ap.add_argument("--outdir", required=True)
    ap.add_argument("--machine", default="mps2-an386")
    ap.add_argument("--debug", action="store_true",
                     help="show gdb/qemu stdout+stderr instead of suppressing it")
    args = ap.parse_args()

    os.makedirs(args.outdir, exist_ok=True)

    n_ok = 0
    for i in range(args.n):
        print(f"=== trial {i} ===")
        ok_c = run_collect_trial(args.correct_elf, args.capture_witness, args.func,
                                  i, "correct", args.outdir, args.machine, args.debug)
        ok_f = run_collect_trial(args.faulty_elf, args.capture_witness, args.func,
                                  i, "faulty", args.outdir, args.machine, args.debug)
        if ok_c and ok_f:
            n_ok += 1

    print(f"[i] done. {n_ok}/{args.n} trial pairs successfully written to {args.outdir}")


if __name__ == "__main__":
    main()