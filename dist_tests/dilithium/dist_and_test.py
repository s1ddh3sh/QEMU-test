#!/usr/bin/env python3
"""
early_stop_sweep.py (Dilithium) — incrementally collect (or reuse
already-collected) correct/faulty trials for increasing secret values
sv = 0, 1, 2, ..., and STOP as soon as the requested test(s)
(ineffective and/or correction) have found at least one witness -- i.e.
an (s1, s2) pair with d1 != d2 (ineffective) or Delta(s1) != Delta(s2)
(correction), at ANY output position.

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
unchanged from collect_dist.py, and decode_words()/get_buffer()/
compute_delta() unchanged from ineffective_dilithium.py. None of those
files are modified by this script or need to be -- this script only
decides WHEN to stop asking collect_dist.py's machinery for more data.

Resumability / replay: if a secret value's correct_sv*.json/
faulty_sv*.json already exist under --outdir (e.g. from an earlier full
sweep), they are loaded from disk instead of re-launching QEMU. Pointing
this at an already-fully-collected dist_paired directory therefore
REPLAYS the existing data in increasing sv order and reports exactly how
many trials would have been needed had early stopping been used from
the start -- with zero new QEMU boots.

Expected directory layout (matching collect_dist.sh):
    dist_tests/dilithium/setup/collect_dist.py
    dist_tests/dilithium/ineffective_dilithium.py
    dist_tests/dilithium/correction_dilithium.py
    dist_tests/dilithium/early_stop_sweep.py   <- this file

Usage:
    python3 early_stop_sweep.py \
        --witness tests_dilithium/pqcrystals_dilithium2_ref_poly_add/qemu_witness.json \
        --active-lengths tests_dilithium/pqcrystals_dilithium2_ref_poly_add/active_lengths.json \
        --correct-elf correct.elf --faulty-elf faulty.elf \
        --func pqcrystals_dilithium2_ref_poly_add --field-mod 8380417 \
        --dilithium-mode 2 --secret-buf a --secret-pos 0 \
        --outdir tests_dilithium/pqcrystals_dilithium2_ref_poly_add/dist_paired \
        --out-buf c --active-len 1024 --out-word-size 4 --diff-mode mod-sub \
        --test both

    # Replay an already-fully-collected sweep with no new QEMU boots:
    python3 early_stop_sweep.py \
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

from setup.collect_dist import run_one, RunFailed         # noqa: E402  (unmodified)
from ineffective_dilithium import (                 # noqa: E402  (unmodified)
    decode_words,
    get_buffer,
    compute_delta,
)

DILITHIUM_Q = 8380417


def load_or_collect(sval, c_path, f_path, args):
    """Collect via run_one() ONLY for whichever of the two files is
    missing on disk, then load and return both parsed trial JSONs. This
    is what makes the script transparently resumable/replayable: point
    it at a directory that already has some or all correct_sv*/
    faulty_sv*.json files and it will boot QEMU only for the ones still
    missing.
    """
    for variant, elf_path, out_path in (
        ("correct", args.correct_elf, c_path),
        ("faulty", args.faulty_elf, f_path),
    ):
        if os.path.exists(out_path):
            continue
        run_one(elf_path, args.witness, args.active_lengths, args.func,
                args.field_mod, args.seed, variant, out_path, args.machine,
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
             "driver_dist.py), so any position within it (typically "
             "4*i for coefficient i) selects that coefficient.",
    )
    ap.add_argument("--seed", type=int, default=0)

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

    want_ineffective = args.test in ("ineffective", "both")
    want_correction = args.test in ("correction", "both")

    # Per position, only the DISTINCT eq/delta values seen so far (each
    # mapped to one witness sv) are kept -- a hit only needs ONE prior
    # value that disagrees with the new one, not the full history.
    ineffective_seen = [dict() for _ in range(active_len_words)]  # bool -> sv
    correction_seen = [dict() for _ in range(active_len_words)]   # value -> sv

    ineffective_hit = None  # (pos, sv_ineffective, sv_effective)
    correction_hit = None   # (pos, sv1, delta1, sv2, delta2)

    n_collected = 0
    n_reused = 0

    for sval in range(args.field_mod):
        c_path = os.path.join(args.outdir, f"correct_sv{sval:03d}.json")
        f_path = os.path.join(args.outdir, f"faulty_sv{sval:03d}.json")
        already_present = os.path.exists(c_path) and os.path.exists(f_path)
        try:
            c, fdata = load_or_collect(sval, c_path, f_path, args)
        except RunFailed as e:
            print(f"[!] sv={sval}: collection failed, skipping.\n{e}",
                  file=sys.stderr)
            continue
        if already_present:
            n_reused += 1
        else:
            n_collected += 1

        co = np.asarray(
            decode_words(get_buffer(c, args.out_buf), args.out_word_size),
            dtype=np.int64,
        )[:active_len_words]
        fo = np.asarray(
            decode_words(get_buffer(fdata, args.out_buf), args.out_word_size),
            dtype=np.int64,
        )[:active_len_words]

        # Diff-mode-independent: xor(a,b)==0 iff a==b, so a plain
        # elementwise equality check IS the ineffective test regardless
        # of --diff-mode (matching the note already in
        # ineffective_dilithium.py's and correction_dilithium.py's
        # docstrings that both modes agree exactly on whether y1==y2).
        eq = (co == fo)
        delta = compute_delta(co, fo, args.diff_mode, args.modulus)

        # Safety clamp: --active-len may exceed the OUTPUT buffer's real
        # decoded length -- co/fo are already truncated to
        # active_len_words above via [:active_len_words], so len(eq) is
        # the true usable position count for THIS trial.
        n_pos = min(active_len_words, len(eq))
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
                bucket = correction_seen[pos]
                dv = int(delta[pos])
                if bucket and dv not in bucket:
                    other_dv, other_sv = next(iter(bucket.items()))
                    correction_hit = (pos, other_sv, other_dv, sval, dv)
                    print(f"[+] CORRECTION hit at pos {pos}: "
                          f"s1={other_sv} (Delta={other_dv}) vs "
                          f"s2={sval} (Delta={dv})")
                bucket.setdefault(dv, sval)

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
            pos, sv1, d1, sv2, d2 = correction_hit
            print(f"[RESULT] correction test: DETECTED at pos {pos} "
                  f"(s1={sv1} Delta={d1}, s2={sv2} Delta={d2})")
        else:
            print("[RESULT] correction test: no disagreement found "
                  "in range swept")


if __name__ == "__main__":
    main()