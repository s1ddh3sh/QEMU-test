#!/usr/bin/env python3
"""
collect_dist.py — sweeps a chosen secret position through every
value in [0, field_mod), running both correct.elf and faulty.elf at each
value, with ONE shared background input p held fixed across the entire
sweep (same trial_seed for every run).

Every OTHER input buffer/scalar is filled from its declared
"distribution" in qemu_witness.json (see driver_dist.py's
sample_for_distribution()) rather than a flat uniform fill, so the
background stays a realistic Kyber-shaped input.

The swept position can be either:

  - byte-oriented:
        --word-size 1

    secret-pos means a byte offset.

  - word/coefficient-oriented:
        --word-size 2

    secret-pos means an element/coefficient index, and the driver
    writes the complete 16-bit little-endian word.

For Kyber polynomial buffers such as:

    int16_t coeffs[256];

use:

    --word-size 2
    --field-mod 3329

so that:

    --secret-pos 0

means coeffs[0], and the sweep is:

    coeffs[0] = 0
    coeffs[0] = 1
    ...
    coeffs[0] = 3328

The background remains fixed across the complete sweep.

Cost:

    field_mod * 2 QEMU boots

For example:

    3329 * 2 = 6658 executions

This does NOT produce a statistical test (no p-values) -- it's a raw,
descriptive comparison for a single background p.

For a real hypothesis test across multiple backgrounds, run this with
--seed set to different values and test the resulting per-seed
distributions downstream.

Usage for a Kyber int16_t polynomial coefficient:

    python3 collect_dist.py \
        --witness tests_kyber/poly_ntt/qemu_witness.json \
        --active-lengths tests_kyber/poly_ntt/active_lengths.json \
        --correct-elf correct.elf \
        --faulty-elf faulty.elf \
        --func poly_ntt \
        --field-mod 3329 \
        --kyber-k 3 \
        --secret-buf r \
        --secret-pos 0 \
        --word-size 2 \
        --outdir tests_kyber/poly_ntt/dist_paired
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
        [
            "qemu-system-arm",
            "-M",
            machine,
            "-kernel",
            elf_path,
            "-nographic",
            "-semihosting",
            "-S",
            "-gdb",
            f"tcp::{gdb_port}",
        ],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    time.sleep(0.3)
    return proc


_DRIVER_SCRIPT = os.path.join(
    os.path.dirname(os.path.abspath(__file__)),
    "driver_dist.py",
)


def run_one(
    elf_path,
    witness_path,
    active_lengths_path,
    func,
    field_mod,
    seed,
    variant,
    out_path,
    machine,
    fixed_scalars,
    kyber_k,
    secret_buf,
    secret_pos,
    secret_val,
    word_size,
):
    """
    Run one correct/faulty execution.

    secret_pos is interpreted according to word_size:

        word_size == 1:
            secret_pos = byte offset

        word_size == 2:
            secret_pos = 16-bit word / Kyber coefficient index
    """

    qemu_proc = launch_qemu(elf_path, machine)

    env = os.environ.copy()

    env.update(
        {
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
            "GDB_DRIVER_KYBER_K": str(kyber_k),

            # Paired sweep override.
            "GDB_DRIVER_OVERRIDE_BUF": secret_buf,
            "GDB_DRIVER_OVERRIDE_POS": str(secret_pos),
            "GDB_DRIVER_OVERRIDE_VAL": str(secret_val),

            # NEW:
            # 1 = byte-oriented override
            # 2 = int16_t / word-oriented override
            "GDB_DRIVER_OVERRIDE_WORD_SIZE": str(word_size),
        }
    )

    try:
        # Capture output and enforce a timeout instead of DEVNULL-ing
        # everything. Any gdb/driver error needs to remain visible.
        result = subprocess.run(
            [
                "gdb-multiarch",
                "-nx",
                "-batch",
                "-x",
                _DRIVER_SCRIPT,
            ],
            env=env,
            capture_output=True,
            text=True,
            timeout=60,
        )

    finally:
        qemu_proc.terminate()

        try:
            qemu_proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            qemu_proc.kill()
            qemu_proc.wait(timeout=5)

    produced = os.path.join(
        os.path.dirname(out_path),
        f"{variant}_trial{seed:06d}.json",
    )

    # A failed run and a successful one must not look identical.
    if not os.path.exists(produced):
        raise RunFailed(
            f"{variant} run for "
            f"{secret_buf}[{secret_pos}]={secret_val} "
            f"(word_size={word_size}, seed={seed}) "
            f"produced no output file "
            f"(expected {produced}).\n"
            f"gdb exit code: {result.returncode}\n"
            f"--- gdb stdout ---\n"
            f"{result.stdout}\n"
            f"--- gdb stderr ---\n"
            f"{result.stderr}"
        )

    os.replace(produced, out_path)


def main():
    ap = argparse.ArgumentParser()

    ap.add_argument(
        "--witness",
        required=True,
    )

    ap.add_argument(
        "--active-lengths",
        required=True,
    )

    ap.add_argument(
        "--correct-elf",
        required=True,
    )

    ap.add_argument(
        "--faulty-elf",
        required=True,
    )

    ap.add_argument(
        "--func",
        required=True,
    )

    ap.add_argument(
        "--field-mod",
        type=int,
        default=256,
        help=(
            "number of values to sweep the secret element through. "
            "For Kyber int16_t polynomial coefficients in R_q, use "
            "3329 for [0,q). This is the VALUE domain and is separate "
            "from --word-size, which specifies the storage width."
        ),
    )

    ap.add_argument(
        "--kyber-k",
        type=int,
        default=3,
        choices=(2, 3, 4),
        help=(
            "Kyber security parameter K, used only to pick the correct "
            "KYBER_ETA1 for 'centered binomial distribution, eta1' "
            "background sampling (default: %(default)s)"
        ),
    )

    ap.add_argument(
        "--outdir",
        required=True,
    )

    ap.add_argument(
        "--machine",
        default="mps2-an386",
    )

    ap.add_argument(
        "--fixed-scalars",
        default="",
    )

    ap.add_argument(
        "--secret-buf",
        required=True,
        help=(
            "buffer/scalar whose position is swept. For a Kyber "
            "int16_t polynomial, this is typically the polynomial "
            "buffer such as r."
        ),
    )

    ap.add_argument(
        "--secret-pos",
        type=int,
        required=True,
        help=(
            "position to sweep. With --word-size 1 this is a byte "
            "offset. With --word-size 2 this is a 16-bit word/"
            "coefficient index."
        ),
    )

    ap.add_argument(
        "--word-size",
        type=int,
        default=2,
        choices=(1, 2),
        help=(
            "storage width of the swept element in bytes. "
            "Use 2 for Kyber int16_t polynomial coefficients. "
            "Use 1 for the original byte-oriented behavior. "
            "Default: %(default)s"
        ),
    )

    ap.add_argument(
        "--seed",
        type=int,
        default=0,
        help=(
            "single shared background seed p for every run"
        ),
    )

    args = ap.parse_args()

    # ------------------------------------------------------------------
    # Basic validation
    # ------------------------------------------------------------------

    if args.field_mod <= 0:
        ap.error("--field-mod must be positive")

    if args.secret_pos < 0:
        ap.error("--secret-pos must be non-negative")

    if args.word_size not in (1, 2):
        ap.error("--word-size must be 1 or 2")

    os.makedirs(args.outdir, exist_ok=True)

    # ------------------------------------------------------------------
    # Description
    # ------------------------------------------------------------------

    if args.word_size == 2:
        position_description = (
            f"coefficient/word {args.secret_pos} "
            f"(bytes {2 * args.secret_pos}.."
            f"{2 * args.secret_pos + 1})"
        )
    else:
        position_description = (
            f"byte {args.secret_pos}"
        )

    print(
        f"[i] sweeping {args.secret_buf}[{args.secret_pos}] "
        f"as {position_description} over "
        f"{args.field_mod} values, "
        f"background seed p={args.seed}, "
        f"K={args.kyber_k}, "
        f"word_size={args.word_size}"
    )

    print(
        f"[i] total executions: "
        f"{args.field_mod} * 2 = "
        f"{args.field_mod * 2}"
    )

    # ------------------------------------------------------------------
    # Sweep
    # ------------------------------------------------------------------

    failures = []

    for sval in range(args.field_mod):

        c_path = os.path.join(
            args.outdir,
            f"correct_sv{sval:03d}.json",
        )

        f_path = os.path.join(
            args.outdir,
            f"faulty_sv{sval:03d}.json",
        )

        print(
            f"  {args.secret_buf}[{args.secret_pos}]={sval}: "
            f"correct + faulty",
            flush=True,
        )

        for variant, elf_path, out_path in (
            (
                "correct",
                args.correct_elf,
                c_path,
            ),
            (
                "faulty",
                args.faulty_elf,
                f_path,
            ),
        ):

            try:

                run_one(
                    elf_path,
                    args.witness,
                    args.active_lengths,
                    args.func,
                    args.field_mod,
                    args.seed,
                    variant,
                    out_path,
                    args.machine,
                    args.fixed_scalars,
                    args.kyber_k,
                    args.secret_buf,
                    args.secret_pos,
                    sval,
                    args.word_size,
                )

            except RunFailed as e:

                print(
                    f"[!] FAILED: "
                    f"{variant} "
                    f"{args.secret_buf}[{args.secret_pos}]={sval}\n"
                    f"{e}",
                    flush=True,
                )

                failures.append(
                    (
                        variant,
                        sval,
                        str(e),
                    )
                )

    # ------------------------------------------------------------------
    # Final status
    # ------------------------------------------------------------------

    if failures:

        print(
            f"\n[!] {len(failures)}/"
            f"{args.field_mod * 2} runs failed to "
            f"produce output."
        )

        print(
            "NO correct_sv*.json / faulty_sv*.json files "
            "exist for the failed (variant, sval) pairs. "
            "See the per-failure gdb output above for the "
            "real cause."
        )

        print(
            "Common culprits include:"
        )

        print(
            "  - secret-buf/secret-pos hitting an address "
            "that overlaps or aliases another buffer"
        )

        print(
            "  - incorrect qemu_witness.json layout"
        )

        print(
            "  - word-size not matching the actual target type"
        )

        print(
            "  - target crashing outright"
        )

        raise SystemExit(1)

    print(
        f"[i] done. "
        f"{args.field_mod} secret values x 2 variants "
        f"= {args.field_mod * 2} runs "
        f"in {args.outdir}"
    )


if __name__ == "__main__":
    main()