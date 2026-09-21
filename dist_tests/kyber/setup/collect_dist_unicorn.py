#!/usr/bin/env python3
"""collect_dist_unicorn.py (kyber) — drop-in replacement for
collect_dist.py that runs every trial IN-PROCESS via the Unicorn
Cortex-M4 emulator (dist_tests/common/unicorn_runner.py) instead of
spawning a fresh qemu-system-arm + gdb-multiarch subprocess pair per
trial. Mirrors the Kyber collect_dist.py's CLI surface (sweep-only,
--word-size 1/2 override, --kyber-k) -- see that file's module
docstring for the sweep semantics; this file only documents what's
different here.

Output filenames/schema (correct_sv###.json / faulty_sv###.json)
identical to collect_dist.py's, so ineffective_kyber.py /
correction_kyber.py work unchanged against --dist-dir pointed here.
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "..")))

# distributions_unicorn.py reads GDB_DRIVER_KYBER_K at IMPORT time
# (mirroring driver_dist.py's own env-var-at-import-time behaviour) --
# pre-scan argv for --kyber-k and export it BEFORE that module import.
if "--kyber-k" in sys.argv:
    _i = sys.argv.index("--kyber-k")
    if _i + 1 < len(sys.argv):
        os.environ["GDB_DRIVER_KYBER_K"] = sys.argv[_i + 1]

from dist_tests.common.unicorn_runner import run_trial, TrialError
from dist_tests.kyber.setup.distributions_unicorn import (
    sample_for_distribution,
    apply_word_override_pure,
    infer_field_mod,
)


class RunFailed(Exception):
    """Raised when a single correct/faulty run doesn't produce output."""


def _make_kyber_override_hook(word_size):
    def hook(name, spec, vals, override_pos, override_val):
        # override_pos/override_val here are already in the caller's
        # (word_size-aware) units -- run_one below converts --secret-pos
        # (a word/coefficient index for word_size==2, a byte offset for
        # word_size==1) into the BYTE position unicorn_runner expects
        # before calling run_trial, so by the time this hook runs,
        # override_pos is a byte offset into vals and override_val is
        # the raw word_size-aware value to encode.
        return apply_word_override_pure(vals, override_pos // word_size if word_size == 2 else override_pos,
                                         override_val, word_size)
    return hook


def run_one(elf_path, witness_path, active_lengths_path, func, field_mod,
            seed, variant, out_path, machine, fixed_scalars, kyber_k,
            secret_buf, secret_pos, secret_val, word_size):
    with open(witness_path) as f:
        layout = json.load(f)["layout"]
    with open(active_lengths_path) as f:
        active_lengths = json.load(f)

    fixed_set = set(s for s in (fixed_scalars or "").split(",") if s)

    # unicorn_runner's override_pos is always a BYTE position (it does
    # `0 <= override_pos < width` against the plain byte-length buffer);
    # for word_size==2 secret_pos is a coefficient index, so convert to
    # a byte offset here, matching driver_dist.py's apply_word_override
    # byte_offset = word_pos * 2.
    byte_pos = secret_pos * word_size if secret_pos >= 0 else secret_pos

    try:
        result = run_trial(
            elf_path, layout, func, "collect", field_mod, seed, variant,
            fixed_set, sample_for_distribution, active_lengths,
            secret_buf, byte_pos, secret_val,
            also_override_hook=_make_kyber_override_hook(word_size),
        )
    except (TrialError, Exception) as e:
        raise RunFailed(
            f"{variant} run for {secret_buf}[{secret_pos}]={secret_val} "
            f"(word_size={word_size}, seed={seed}) raised: "
            f"{type(e).__name__}: {e}"
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

    print(f"[i] sweeping {args.secret_buf}[{args.secret_pos}] "
          f"(word_size={args.word_size}) over {args.field_mod} values, "
          f"background seed p={args.seed}, kyber_k={args.kyber_k} "
          f"[unicorn backend]")
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
                        args.fixed_scalars, args.kyber_k,
                        args.secret_buf, args.secret_pos, sval, args.word_size)
            except RunFailed as e:
                print(f"[!] FAILED: {variant} sval={sval}\n{e}", flush=True)
                failures.append((variant, sval, str(e)))

    if failures:
        print(f"\n[!] {len(failures)}/{args.field_mod * 2} runs failed.")
        raise SystemExit(1)

    print(f"[i] done. {args.field_mod} secret values x 2 variants "
          f"= {args.field_mod * 2} runs in {args.outdir}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--witness", required=True)
    ap.add_argument("--active-lengths", required=True)
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument(
        "--field-mod", type=int, default=None,
        help="number of values to sweep --secret-pos through. Default: "
             "auto-derived from --secret-buf's own declared distribution "
             "(see infer_field_mod() in distributions_unicorn.py).",
    )
    ap.add_argument("--kyber-k", type=int, default=3, choices=(2, 3, 4))
    ap.add_argument("--outdir", required=True)
    ap.add_argument("--machine", default="mps2-an386",
                     help="ignored -- accepted only for CLI compatibility.")
    ap.add_argument("--fixed-scalars", default="")
    ap.add_argument("--secret-buf", required=True)
    ap.add_argument("--secret-pos", type=int, required=True)
    ap.add_argument("--word-size", type=int, default=2, choices=(1, 2))
    ap.add_argument("--seed", type=int, default=0)
    args = ap.parse_args()

    os.environ["GDB_DRIVER_KYBER_K"] = str(args.kyber_k)
    run_sweep(args)


if __name__ == "__main__":
    main()
