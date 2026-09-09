#!/usr/bin/env python3
"""
correction_dilithium.py (single-background mode)

Correction-fault query, paired-sweep design:

    y1 = f_correct(s, p),  y2 = f_faulty(s, p),  Delta(s) = y1 xor y2

    H0: exists alpha such that Delta(s) = alpha for every s
        (a single, secret-independent additive correction -- no leakage)
    H1: Delta(s1) != Delta(s2) for some pair (s1, s2)
        (the divergence value itself depends on the secret -- correction
        fault detected)

For a single shared background p, this is DESCRIPTIVE, not a hypothesis
test (one observation per pair, no p-value) -- it reports, per output
position, how many of the ordered (s1, s2) pairs show Delta(s1) !=
Delta(s2).

Dilithium-specific notes (vs. the Kyber version this was adapted from):

  - --out-word-size 4 (signed int32, little-endian) is the natural unit
    for Dilithium's R_q polynomial buffers -- poly.coeffs is int32_t[N],
    NOT Kyber's int16_t[N]. Raw byte-string buffers (signature, pk, sk,
    message, seeds, packed polynomials) use --out-word-size 1.

  - --modulus defaults to 8380417 (= Dilithium Q), not 3329. This one
    matters more here than in the ineffective test: Delta is compared as
    a VALUE, so the modulus is load-bearing, and a leftover Kyber 3329
    would fold genuinely distinct Dilithium coefficient differences into
    the same residue and hide real disagreements.

  - Trial JSON schema is unchanged: driver_dist.py's collect mode writes
    exactly {"inputs": {...}, "outputs": {...}}. An also_input (in-place)
    buffer's PRE-call snapshot lives under "<name>_pre" inside "inputs";
    its POST-call value lives under "<name>" inside "outputs". Pass
    --out-buf "<name>_pre" explicitly if you want the pre-call snapshot.

  - --active-len is in BYTES, matching calibrate.py's active_lengths.json
    units, converted internally to a word count (active_len //
    out_word_size) before indexing the decoded array.

  - --diff-mode: "xor" (treating a correction fault as a GF(2)-additive
    bit-flip corruption; appropriate for byte-string outputs) or
    "mod-sub" ((y1 - y2) mod --modulus -- the algebraically natural
    correction-fault model for a poly/polyvec buffer). These are NOT
    interchangeable here the way they are in ineffective_dilithium.py:
    Delta(s) is reported and compared as an actual VALUE, so which
    operation defines Delta materially changes what counts as "the same
    alpha for every s". Pick mod-sub for R_q coefficient buffers, xor
    for byte strings.

  - sv filename padding is read straight out of each correct_sv match
    rather than re-formatted at a hardcoded width.

Usage:
    python3 correction_dilithium.py \
        --dist-dir tests_dilithium/pqcrystals_dilithium2_ref_poly_add/dist_paired \
        --out-buf c --active-len 1024 --out-word-size 4 --diff-mode mod-sub

    python3 correction_dilithium.py \
        --dist-dir tests_dilithium/pqcrystals_dilithium2_ref_pack_sig/dist_paired \
        --out-buf sig --active-len 2420 --out-word-size 1
"""

import argparse
import glob
import json
import os
import re
import struct

import numpy as np

DILITHIUM_Q = 8380417


def decode_words(values, word_size):
    """values is a flat list of raw bytes (0-255) read straight out of
    target memory. Groups them into word_size-byte little-endian words,
    signed for word_size in {2, 4} to match poly.coeffs (int32_t for
    Dilithium) / a scalar return anchor; word_size=1 is the raw bytes
    unchanged (used for byte-string buffers)."""
    if word_size == 1:
        return list(values)
    if word_size == 2:
        n = len(values) // 2
        return list(struct.unpack(f"<{n}h", bytes(values[:n * 2])))
    if word_size == 4:
        n = len(values) // 4
        return list(struct.unpack(f"<{n}i", bytes(values[:n * 4])))
    raise ValueError(f"unsupported word size {word_size}")


def get_buffer(record, buf_name):
    """record is one trial's {"inputs": {...}, "outputs": {...}} JSON
    object, exactly as driver_dist.py's run_collect() writes it. Checks
    "outputs" first (the normal case: comparing the real post-call
    result), falling back to "inputs" (needed for e.g. "<name>_pre",
    an also_input buffer's pre-call snapshot)."""
    outputs = record.get("outputs", {})
    if buf_name in outputs:
        return outputs[buf_name]
    inputs = record.get("inputs", {})
    if buf_name in inputs:
        return inputs[buf_name]
    raise KeyError(f"'{buf_name}' not found (inputs={sorted(inputs.keys())}, "
                   f"outputs={sorted(outputs.keys())})")


_FNAME_RE = re.compile(r"correct_sv(\d+)\.json")


def compute_delta(co, fo, diff_mode, modulus):
    if diff_mode == "xor":
        return np.bitwise_xor(co, fo)
    if diff_mode == "mod-sub":
        return np.mod(co - fo, modulus)
    raise ValueError(f"unknown diff-mode {diff_mode!r}")


def load_sweep(dist_dir, out_buf, active_len_bytes, out_word_size,
                diff_mode, modulus):
    """
    Returns delta[sv] = numpy int64 array of length active_len_bytes //
    out_word_size (i.e. in WORDS, not bytes) -- the raw Delta(s) values,
    NOT booleans, unlike ineffective_dilithium.py's d[sv].
    """
    active_len_words = active_len_bytes // out_word_size

    delta = {}
    for cpath in sorted(glob.glob(f"{dist_dir}/correct_sv*.json")):
        basename = os.path.basename(cpath)
        m = _FNAME_RE.search(basename)
        if not m:
            continue
        sv_str = m.group(1)  # preserve original zero-padding width
        sv = int(sv_str)
        fpath = f"{dist_dir}/faulty_sv{sv_str}.json"
        if not os.path.exists(fpath):
            raise FileNotFoundError(
                f"found {cpath} but no matching {fpath} -- collect_dist.py "
                f"may have failed partway through this sweep value."
            )

        with open(cpath) as f:
            c = json.load(f)
        with open(fpath) as f:
            fdata = json.load(f)

        co = np.asarray(decode_words(get_buffer(c, out_buf), out_word_size),
                         dtype=np.int64)[:active_len_words]
        fo = np.asarray(decode_words(get_buffer(fdata, out_buf), out_word_size),
                         dtype=np.int64)[:active_len_words]

        delta[sv] = compute_delta(co, fo, diff_mode, modulus)

    return delta


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dist-dir", required=True)
    ap.add_argument("--out-buf", required=True)
    ap.add_argument(
        "--active-len", type=int, required=True,
        help="active length in BYTES (matches active_lengths.json / "
             "calibrate.py's units) -- converted internally to a word "
             "count via --out-word-size",
    )
    ap.add_argument("--out-word-size", type=int, default=1, choices=[1, 2, 4],
                     help="1: raw bytes (byte-string buffers). "
                          "4: signed int32 (Dilithium poly.coeffs -- most "
                          "R_q buffers -- and a scalar 'return' anchor). "
                          "2 is kept for completeness but is almost never "
                          "right for Dilithium. Default: %(default)s")
    ap.add_argument(
        "--diff-mode", choices=["xor", "mod-sub"], default="xor",
        help="'xor': Delta(s) = y1 xor y2 (default; matches the "
             "documented algorithm, appropriate for byte-string "
             "buffers). 'mod-sub': Delta(s) = (y1 - y2) mod --modulus, "
             "appropriate for R_q coefficient buffers -- see module "
             "docstring, these are NOT interchangeable for this script "
             "since Delta is compared as a value, not just against zero.",
    )
    ap.add_argument("--modulus", type=int, default=DILITHIUM_Q,
                     help="modulus for --diff-mode mod-sub (default: "
                          "%(default)s = Dilithium Q)")
    ap.add_argument("--verbose", action="store_true")
    args = ap.parse_args()

    delta = load_sweep(args.dist_dir, args.out_buf, args.active_len,
                        args.out_word_size, args.diff_mode, args.modulus)
    secret_values = sorted(delta.keys())
    if len(secret_values) < 2:
        raise RuntimeError(f"only {len(secret_values)} secret values found in {args.dist_dir}")

    print(f"[i] loaded {len(secret_values)} secret values (single shared background p)")

    # Safety clamp: --active-len (bytes) converts to a WORD count via
    # --out-word-size, which can still exceed the OUTPUT buffer's true
    # word count. load_sweep() already truncates each delta array to
    # whatever the output buffer actually decodes to -- use THAT
    # length, not the raw converted --active-len, to bound the position
    # loop.
    active_len_words = args.active_len // args.out_word_size
    out_len = min(len(v) for v in delta.values())
    safe_len = min(active_len_words, out_len)
    if safe_len < active_len_words:
        print(
            f"[!] --active-len={args.active_len} bytes ({active_len_words} "
            f"words at word-size {args.out_word_size}) exceeds output "
            f"buffer '{args.out_buf}''s actual length ({out_len} words); "
            f"clamping position loop to {safe_len}."
        )

    pairs = [(a, b) for a in secret_values for b in secret_values if a != b]
    print(f"[i] {len(pairs)} ordered (s1,s2) pairs "
          f"({len(secret_values)}*{len(secret_values)-1})")

    for pos in range(safe_len):
        disagree = []
        for s1, s2 in pairs:
            d1 = int(delta[s1][pos])
            d2 = int(delta[s2][pos])
            if d1 != d2:
                disagree.append((s1, s2, d1, d2))

        if args.verbose or disagree:
            print("=" * 75)
            print(f"pos {pos}: {len(disagree)}/{len(pairs)} pairs disagree "
                  f"(Delta(s1) != Delta(s2))")
            if disagree:
                for s1, s2, d1, d2 in disagree[:10]:
                    print(f"    s1={s1} (Delta={d1}) vs s2={s2} (Delta={d2})")
                if len(disagree) > 10:
                    print(f"    ... and {len(disagree) - 10} more")
            print("=" * 75)


if __name__ == "__main__":
    main()