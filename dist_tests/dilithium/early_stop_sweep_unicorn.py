#!/usr/bin/env python3
"""
early_stop_sweep_unicorn.py (Dilithium, Unicorn backend) — incrementally
collect (or reuse already-collected) correct/faulty trials for increasing
secret values sv = 0, 1, 2, ..., and STOP as soon as the requested test(s)
(ineffective and/or correction) have found at least one witness -- i.e.
an (s1, s2) pair with d1 != d2 (ineffective) or, for correction, an s for
which  y1 = y2 xor alpha  holds for ALL swept public backgrounds p (see
--seeds), at ANY output position.

This is the SAME orchestrator as dist_and_test.py, with exactly one
substantive change: it collects trials via collect_dist_unicorn.py's
run_one() (the in-process Unicorn/DWARF Cortex-M4 emulator driver,
dist_tests/common/unicorn_runner.py) instead of collect_dist.py's
run_one() (which spawns a fresh qemu-system-arm + gdb-multiarch
subprocess pair per trial) -- no qemu-system-arm/gdb-multiarch install
is required to run this script.

Rationale: both ineffective_dilithium.py and correction_dilithium.py
only answer an EXISTENCE question -- "does there exist a disagreeing
pair?" -- and then, if verbose, characterize how many such pairs exist.
Once ANY disagreeing pair is found, the yes/no answer is already
settled; collecting and comparing the remaining secret values cannot
change it. See the Kyber version's docstring for the general argument;
this differs only in three Dilithium-specific ways:

  1. --field-mod defaults to Q = 8380417, not 256/3329 -- a Dilithium
     coefficient is int32_t and, since collect_dist.py's/driver_dist.py's
     override now writes the FULL 4-byte coefficient (not just its low
     byte -- see driver_dist.py's is_coeff_shaped override fix), a
     genuine full-domain sweep needs the whole Q values, not a byte's
     worth of them.
  2. --dilithium-mode (2/3/5) replaces Kyber's --kyber-k.
  3. There is no --secret-word-size flag: unlike the Kyber driver
     (which needed an explicit GDB_DRIVER_OVERRIDE_WORD_SIZE), the
     Dilithium driver auto-detects whether the secret buffer is
     coefficient-shaped from its own declared "distribution" and writes
     the full word automatically -- nothing to pass through here.

This is a thin orchestrator, NOT a reimplementation: it imports run_one()
unchanged from collect_dist_unicorn.py, and decode_words()/get_buffer()/
compute_delta() unchanged from ineffective_dilithium.py. None of those
files are modified by this script or need to be -- this script only
decides WHEN to stop asking collect_dist_unicorn.py's machinery for more
data.

Resumability / replay: if a secret value's correct_sv*.json/
faulty_sv*.json already exist under --outdir (e.g. from an earlier full
sweep), they are loaded from disk instead of re-running a trial.
Pointing this at an already-fully-collected dist_paired directory
therefore REPLAYS the existing data in increasing sv order and reports
exactly how many trials would have been needed had early stopping been
used from the start -- with zero new trials run.

Expected directory layout (matching collect_dist_unicorn.sh):
    dist_tests/dilithium/setup/collect_dist_unicorn.py
    dist_tests/dilithium/ineffective_dilithium.py
    dist_tests/dilithium/correction_dilithium.py
    dist_tests/dilithium/early_stop_sweep_unicorn.py   <- this file

Usage:
    python3 early_stop_sweep_unicorn.py \
        --witness tests_dilithium/pqcrystals_dilithium2_ref_poly_add/qemu_witness.json \
        --active-lengths tests_dilithium/pqcrystals_dilithium2_ref_poly_add/active_lengths.json \
        --correct-elf correct.elf --faulty-elf faulty.elf \
        --func pqcrystals_dilithium2_ref_poly_add --field-mod 8380417 \
        --dilithium-mode 2 --secret-buf a --secret-pos 0 \
        --outdir tests_dilithium/pqcrystals_dilithium2_ref_poly_add/dist_paired \
        --out-buf c --active-len 1024 --out-word-size 4 --diff-mode mod-sub \
        --test both

    # Replay an already-fully-collected sweep with no new trials run:
    python3 early_stop_sweep_unicorn.py \
        --witness ... --active-lengths ... \
        --correct-elf correct.elf --faulty-elf faulty.elf \
        --func pqcrystals_dilithium2_ref_poly_add --field-mod 8380417 \
        --secret-buf a --secret-pos 0 \
        --outdir tests_dilithium/pqcrystals_dilithium2_ref_poly_add/dist_paired \
        --out-buf c --active-len 1024 --out-word-size 4 --test both
"""

import argparse
import json
import os
import sys

import numpy as np

_SETUP_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "setup")
if _SETUP_DIR not in sys.path:
    sys.path.insert(0, _SETUP_DIR)
if os.path.dirname(os.path.abspath(__file__)) not in sys.path:
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from setup.collect_dist_unicorn import run_one, RunFailed  # noqa: E402  (unmodified, in-process Unicorn backend)
from ineffective_dilithium import (                 # noqa: E402  (unmodified)
    decode_words,
    get_buffer,
    compute_delta,
)

DILITHIUM_Q = 8380417


def load_or_collect(sval, c_path, f_path, args, seed):
    """Collect via run_one() ONLY for whichever of the two files is
    missing on disk, then load and return both parsed trial JSONs. This
    is what makes the script transparently resumable/replayable: point
    it at a directory that already has some or all correct_sv*/
    faulty_sv*.json files and it will run a trial only for the ones
    still missing.
    """
    for variant, elf_path, out_path in (
        ("correct", args.correct_elf, c_path),
        ("faulty", args.faulty_elf, f_path),
    ):
        # A zero-byte or truncated file (left behind by an interrupted
        # prior run, or a concurrent writer, killed mid-write) must NOT
        # be treated as "already collected" -- os.path.exists() alone
        # can't tell a complete file from a stub, and json.load() on a
        # stub crashes the whole sweep instead of just re-collecting it.
        if os.path.exists(out_path) and os.path.getsize(out_path) > 0:
            continue
        run_one(elf_path, args.witness, args.active_lengths, args.func,
                args.field_mod, seed, variant, out_path, args.machine,
                args.fixed_scalars, args.dilithium_mode,
                args.secret_buf, args.secret_pos, sval)
    with open(c_path) as f:
        c = json.load(f)
    with open(f_path) as f:
        fdata = json.load(f)
    return c, fdata


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--witness", required=True)
    ap.add_argument("--active-lengths", required=True)
    ap.add_argument("--correct-elf", required=True)
    ap.add_argument("--faulty-elf", required=True)
    ap.add_argument("--func", required=True)
    ap.add_argument(
        "--field-mod", type=int, default=DILITHIUM_Q,
        help="upper bound of the sv sweep (exclusive) -- only reached in "
             "the worst case where no hit is ever found. Default: "
             "%(default)s (Dilithium Q, a full coefficient-domain sweep).",
    )
    ap.add_argument(
        "--dilithium-mode", type=int, default=2, choices=(2, 3, 5),
        help="Dilithium parameter set, used to pick K/L/ETA/TAU/GAMMA1/"
             "GAMMA2/OMEGA for distribution-aware background sampling "
             "(default: %(default)s). trace.h only emits PRINT_ARGS "
             "under DILITHIUM_MODE == 2, so witnesses are normally "
             "mode-2.",
    )
    ap.add_argument("--outdir", required=True)
    ap.add_argument("--machine", default="mps2-an386")
    ap.add_argument("--fixed-scalars", default="")
    ap.add_argument("--secret-buf", required=True)
    ap.add_argument(
        "--secret-pos", type=int, required=True,
        help="BYTE position within secret-buf to sweep. For a "
             "coefficient-shaped buffer the WHOLE 4-byte coefficient "
             "containing this position is overridden (see "
             "driver_dist.py/collect_dist_unicorn.py), so any position "
             "within it (typically 4*i for coefficient i) selects that "
             "coefficient.",
    )
    ap.add_argument("--seed", type=int, default=0)
    ap.add_argument(
        "--seeds", type=int, nargs="+", default=None,
        help="public-background seeds p used by the CORRECTION test "
             "(exists alpha != 0, s: for all p, y1 = y2 xor alpha). Default: "
             "just --seed, which makes 'for all p' vacuous -- pass >= 2. "
             "The first seed (or --seed if --seeds is omitted) is also "
             "the one used by the ineffective test and stores its files "
             "directly in --outdir; every other seed p stores its files "
             "in --outdir/seed<p>/.",
    )

    ap.add_argument("--out-buf", required=True)
    ap.add_argument(
        "--active-len", type=int, required=True,
        help="active length in BYTES, converted internally via "
             "--out-word-size (matches ineffective_dilithium.py's "
             "convention)",
    )
    ap.add_argument("--out-word-size", type=int, default=1, choices=[1, 2, 4],
                     help="1: raw bytes (byte-string buffers). 4: signed "
                          "int32 (Dilithium poly.coeffs -- most R_q "
                          "buffers -- and a scalar 'return' anchor). "
                          "Default: %(default)s")
    ap.add_argument(
        "--diff-mode", choices=["xor", "mod-sub"], default="xor",
        help="used only for the CORRECTION test's value comparison -- "
             "the ineffective test's delta==0 check is diff-mode-"
             "independent",
    )
    ap.add_argument("--modulus", type=int, default=DILITHIUM_Q,
                     help="modulus for --diff-mode mod-sub (default: "
                          "%(default)s = Dilithium Q)")

    ap.add_argument(
        "--test", choices=["ineffective", "correction", "both"],
        default="both",
    )
    ap.add_argument(
        "--require", choices=["any", "all"], default="all",
        help="with --test both: stop as soon as ANY requested test "
             "finds a hit ('any'), or wait until EVERY requested test "
             "has found at least one hit ('all', default, so a single "
             "sweep answers both questions)",
    )
    args = ap.parse_args()

    os.makedirs(args.outdir, exist_ok=True)
    active_len_words = args.active_len // args.out_word_size
    seeds = args.seeds if args.seeds else [args.seed]
    primary_seed = seeds[0]
    if args.test != "ineffective" and len(seeds) < 2:
        print("[!] --seeds has fewer than 2 public backgrounds: 'for all p' "
              "is vacuous, so every s trivially satisfies the correction "
              "test.", file=sys.stderr)

    want_ineffective = args.test in ("ineffective", "both")
    want_correction = args.test in ("correction", "both")

    # Ineffective test: per position, only the DISTINCT eq values seen so
    # far (each mapped to one witness sv) are kept.
    ineffective_seen = [dict() for _ in range(active_len_words)]  # bool -> sv

    ineffective_hit = None  # (pos, sv_ineffective, sv_effective)
    correction_hit = None   # (pos, sv, alpha)

    n_collected = 0
    n_reused = 0

    for sval in range(args.field_mod):
        trials = {}   # seed -> (co, fo)
        already_present = True
        failed = False
        for p in seeds:
            pdir = args.outdir if p == primary_seed else \
                os.path.join(args.outdir, f"seed{p}")
            os.makedirs(pdir, exist_ok=True)
            c_path = os.path.join(pdir, f"correct_sv{sval:03d}.json")
            f_path = os.path.join(pdir, f"faulty_sv{sval:03d}.json")
            already_present &= os.path.exists(c_path) and os.path.exists(f_path)
            try:
                c, fdata = load_or_collect(sval, c_path, f_path, args, p)
            except RunFailed as e:
                print(f"[!] sv={sval} seed={p}: collection failed, "
                      f"skipping sv.\n{e}", file=sys.stderr)
                failed = True
                break
            trials[p] = tuple(
                np.asarray(
                    decode_words(get_buffer(d, args.out_buf),
                                 args.out_word_size),
                    dtype=np.int64,
                )[:active_len_words]
                for d in (c, fdata)
            )
        if failed:
            continue
        if already_present:
            n_reused += 1
        else:
            n_collected += 1

        co, fo = trials[primary_seed]

        # Diff-mode-independent: xor(a,b)==0 iff a==b, so a plain
        # elementwise equality check IS the ineffective test regardless
        # of --diff-mode (matching the note already in
        # ineffective_dilithium.py's and correction_dilithium.py's
        # docstrings that both modes agree exactly on whether y1==y2).
        eq = (co == fo)
        deltas = [compute_delta(trials[p][0], trials[p][1], args.diff_mode,
                                args.modulus) for p in seeds]

        # Safety clamp: --active-len may exceed the OUTPUT buffer's real
        # decoded length -- co/fo are already truncated to
        # active_len_words above via [:active_len_words], so len(eq) is
        # the true usable position count for THIS trial.
        n_pos = min([active_len_words, len(eq)] + [len(d) for d in deltas])
        if n_pos < active_len_words and sval == 0:
            print(
                f"[!] --active-len ({active_len_words} words) exceeds "
                f"output buffer '{args.out_buf}''s actual decoded length "
                f"({n_pos} words); clamping position range to {n_pos}.",
                file=sys.stderr,
            )

        for pos in range(n_pos):
            if want_ineffective and ineffective_hit is None:
                bucket = ineffective_seen[pos]
                e = bool(eq[pos])
                bucket.setdefault(e, sval)
                if True in bucket and False in bucket:
                    ineffective_hit = (pos, bucket[True], bucket[False])
                    print(f"[+] INEFFECTIVE hit at pos {pos}: "
                          f"s1={bucket[True]} (d1=True, ineffective) vs "
                          f"s2={bucket[False]} (d2=False, effective)")

            if want_correction and correction_hit is None:
                # exists alpha, s: for all p, y1 = y2 xor alpha, i.e.
                # Delta_p(s) is the same value alpha for every public p.
                alpha = int(deltas[0][pos])
                # alpha != 0: alpha == 0 means y1 == y2 (position
                # unaffected by the fault) -- a false positive.
                if alpha != 0 and all(int(d[pos]) == alpha for d in deltas):
                    correction_hit = (pos, sval, alpha)
                    print(f"[+] CORRECTION hit at pos {pos}: "
                          f"s={sval}, alpha={alpha} constant across "
                          f"{len(seeds)} public backgrounds (seeds={seeds})")

        found = []
        if want_ineffective:
            found.append(ineffective_hit is not None)
        if want_correction:
            found.append(correction_hit is not None)
        stop = any(found) if args.require == "any" else all(found)
        if stop:
            print(f"[i] stopping sweep at sv={sval}: "
                  f"{sval + 1} secret values examined "
                  f"({n_collected} newly collected, {n_reused} reused from "
                  f"disk), out of a possible {args.field_mod} -- "
                  f"{100 * (sval + 1) / args.field_mod:.4f}% of the full "
                  f"sweep.")
            break
    else:
        print(f"[i] swept the full range 0..{args.field_mod - 1} "
              f"({n_collected} newly collected, {n_reused} reused from "
              f"disk) without satisfying --require={args.require} for "
              f"--test={args.test}")

    print()
    if want_ineffective:
        if ineffective_hit:
            pos, sv_in, sv_eff = ineffective_hit
            print(f"[RESULT] ineffective test: DETECTED at pos {pos} "
                  f"(s1={sv_in} ineffective, s2={sv_eff} effective)")
        else:
            print("[RESULT] ineffective test: no disagreement found "
                  "in range swept")
    if want_correction:
        if correction_hit:
            pos, sv, alpha = correction_hit
            print(f"[RESULT] correction test: SATISFIED at pos {pos} "
                  f"(s={sv}, alpha={alpha}: y1 = y2 xor alpha for all "
                  f"{len(seeds)} swept p)")
        else:
            print("[RESULT] correction test: no (s, alpha) with constant "
                  "Delta across p found in range swept")


if __name__ == "__main__":
    main()
