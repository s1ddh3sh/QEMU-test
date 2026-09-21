#!/usr/bin/env python3
"""collect_dist_unicorn.py (dilithium) — drop-in replacement for
collect_dist.py that runs every trial IN-PROCESS via the Unicorn
Cortex-M4 emulator (dist_tests/common/unicorn_runner.py) instead of
spawning a fresh qemu-system-arm + gdb-multiarch subprocess pair per
trial. Same CLI surface, same --mode sweep/--mode trials orchestration,
same output filenames/schema (correct_sv###.json / faulty_sv###.json,
correct_trial######.json / faulty_trial######.json) -- ineffective_
dilithium.py / correction_dilithium.py can point --dist-dir at this
script's output unchanged.

See collect_dist.py's module docstring for the full description of
sweep vs trials mode; this file only documents what's DIFFERENT here.
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..")))

# distributions_unicorn.py reads GDB_DRIVER_DILITHIUM_MODE at IMPORT time
# (ported verbatim from driver_dist.py, which does the same under gdb) --
# so --dilithium-mode must be pre-scanned from argv and exported BEFORE
# that module is imported below, not after argparse runs in main().
if "--dilithium-mode" in sys.argv:
    _i = sys.argv.index("--dilithium-mode")
    if _i + 1 < len(sys.argv):
        os.environ["GDB_DRIVER_DILITHIUM_MODE"] = sys.argv[_i + 1]

from dist_tests.common.unicorn_runner import run_trial, TrialError
from dist_tests.dilithium.setup.distributions_unicorn import (
    sample_for_distribution,
    _is_coeff_shaped,
    _int32_le,
    COEFF_BYTES,
    infer_field_mod,
)


class RunFailed(Exception):
    """Raised when a single correct/faulty run doesn't produce output."""


def _dilithium_override_hook(name, spec, vals, override_pos, override_val):
    """Mirrors driver_dist.py's whole-coefficient override for a
    coefficient-shaped distribution: the WHOLE 4-byte int32_t
    coefficient containing override_pos is overwritten with
    override_val's two's-complement little-endian encoding, not just
    the single byte at override_pos. Returns None (meaning: use the
    plain single-byte override) for a non-coefficient-shaped buffer."""
    if not _is_coeff_shaped(spec.get("distribution")):
        return None
    coeff_base = (override_pos // COEFF_BYTES) * COEFF_BYTES
    vals[coeff_base:coeff_base + COEFF_BYTES] = _int32_le(override_val)
    return vals


def run_one(elf_path, witness_path, active_lengths_path, func, field_mod,
            seed, variant, out_path, machine, fixed_scalars, dilithium_mode,
            secret_buf, secret_pos, secret_val):
    with open(witness_path) as f:
        layout = json.load(f)["layout"]
    with open(active_lengths_path) as f:
        active_lengths = json.load(f)

    fixed_set = set(s for s in (fixed_scalars or "").split(",") if s)

    try:
        result = run_trial(
            elf_path, layout, func, "collect", field_mod, seed, variant,
            fixed_set, sample_for_distribution, active_lengths,
            secret_buf, secret_pos, secret_val,
            also_override_hook=_dilithium_override_hook,
        )
    except (TrialError, Exception) as e:
        raise RunFailed(
            f"{variant} run for {secret_buf}[{secret_pos}]={secret_val} "
            f"(seed={seed}) raised: {type(e).__name__}: {e}"
        ) from e

    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "w") as f:
        json.dump(result, f)


def run_sweep(args):
    os.makedirs(args.outdir, exist_ok=True)

    if args.field_mod is None:
        with open(args.witness) as f:
            layout = json.load(f)["layout"]
        dist_name = layout.get(args.secret_buf, {}).get("distribution")
        args.field_mod = infer_field_mod(dist_name)
        print(f"[i] auto-derived field-mod={args.field_mod} from "
              f"secret-buf '{args.secret_buf}'s distribution "
              f"{dist_name!r}")
    else:
        print(f"[i] using explicit --field-mod={args.field_mod} "
              f"(override, not auto-derived)")

    print(f"[i] sweeping {args.secret_buf}[{args.secret_pos}] over "
          f"{args.field_mod} values, background seed p={args.seed} "
          f"(shared across the whole sweep), DILITHIUM_MODE="
          f"{args.dilithium_mode} [unicorn backend]")
    print(f"[i] total in-process trials: {args.field_mod} * 2 = {args.field_mod * 2}")

    failures = []
    for sval in range(args.field_mod):
        c_path = os.path.join(args.outdir, f"correct_sv{sval:03d}.json")
        f_path = os.path.join(args.outdir, f"faulty_sv{sval:03d}.json")
        if sval % 25 == 0:
            print(f"  s={sval}: correct + faulty", flush=True)
        for variant, elf_path, out_path in (
            ("correct", args.correct_elf, c_path),
            ("faulty", args.faulty_elf, f_path),
        ):
            try:
                run_one(elf_path, args.witness, args.active_lengths, args.func,
                        args.field_mod, args.seed, variant, out_path, args.machine,
                        args.fixed_scalars, args.dilithium_mode,
                        args.secret_buf, args.secret_pos, sval)
            except RunFailed as e:
                print(f"[!] FAILED: {variant} sval={sval}\n{e}", flush=True)
                failures.append((variant, sval, str(e)))

    if failures:
        print(f"\n[!] {len(failures)}/{args.field_mod * 2} runs failed.")
        raise SystemExit(1)

    print(f"[i] done. {args.field_mod} secret values x 2 variants "
          f"= {args.field_mod * 2} runs in {args.outdir}")


def run_trials(args):
    os.makedirs(args.outdir, exist_ok=True)

    # No single "secret buf" exists in trials mode (every input buffer is
    # randomized), so there is nothing to derive a distribution-specific
    # field-mod FROM -- field_mod here is only ever the general fallback
    # fill range for buffers with no declared distribution. Leave it at
    # the pre-existing default (256) when not explicitly passed.
    if args.field_mod is None:
        args.field_mod = 256

    print(f"[i] collecting {args.num_trials} independent trial pairs "
          f"(correct vs faulty), base seed={args.seed}, "
          f"DILITHIUM_MODE={args.dilithium_mode} [unicorn backend]")
    print(f"[i] total in-process trials: {args.num_trials} * 2 = {args.num_trials * 2}")

    failures = []
    for t in range(args.num_trials):
        seed = args.seed + t
        c_path = os.path.join(args.outdir, f"correct_trial{t:06d}.json")
        f_path = os.path.join(args.outdir, f"faulty_trial{t:06d}.json")
        if t % 25 == 0:
            print(f"  trial {t}: correct + faulty (seed={seed})", flush=True)
        for variant, elf_path, out_path in (
            ("correct", args.correct_elf, c_path),
            ("faulty", args.faulty_elf, f_path),
        ):
            try:
                run_one(elf_path, args.witness, args.active_lengths, args.func,
                        args.field_mod, seed, variant, out_path, args.machine,
                        args.fixed_scalars, args.dilithium_mode,
                        secret_buf="", secret_pos=-1, secret_val=-1)
            except RunFailed as e:
                print(f"[!] FAILED: {variant} trial={t}\n{e}", flush=True)
                failures.append((variant, t, str(e)))

    if failures:
        print(f"\n[!] {len(failures)}/{args.num_trials * 2} runs failed.")
        raise SystemExit(1)

    print(f"[i] done. {args.num_trials} trials x 2 variants "
          f"= {args.num_trials * 2} runs in {args.outdir}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--mode", choices=("sweep", "trials"), default="sweep")
    ap.add_argument("--witness", required=True)
    ap.add_argument("--active-lengths", required=True)
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument(
        "--field-mod", type=int, default=None,
        help="number of values to sweep --secret-pos through (sweep "
             "mode) / fallback fill range for undeclared distributions "
             "(trials mode). Default: auto-derived in sweep mode from "
             "--secret-buf's own declared distribution (see "
             "infer_field_mod() in distributions_unicorn.py); 256 in "
             "trials mode.",
    )
    ap.add_argument("--dilithium-mode", type=int, default=2, choices=(2, 3, 5))
    ap.add_argument("--outdir", required=True)
    ap.add_argument("--machine", default="mps2-an386",
                     help="ignored -- accepted only for CLI compatibility "
                          "with collect_dist.py (no real QEMU machine is "
                          "launched by this backend).")
    ap.add_argument("--fixed-scalars", default="")
    ap.add_argument("--secret-buf", default=None)
    ap.add_argument("--secret-pos", type=int, default=None)
    ap.add_argument("--seed", type=int, default=0)
    ap.add_argument("--num-trials", type=int, default=200)
    args = ap.parse_args()

    os.environ["GDB_DRIVER_DILITHIUM_MODE"] = str(args.dilithium_mode)

    if args.mode == "sweep":
        if args.secret_buf is None or args.secret_pos is None:
            ap.error("--mode sweep requires --secret-buf and --secret-pos")
        run_sweep(args)
    else:
        run_trials(args)


if __name__ == "__main__":
    main()
