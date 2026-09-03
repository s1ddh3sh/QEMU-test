#!/usr/bin/env python3
"""
ineffective_kyber.py (single-background mode)

Reports d1, d2 for every (s1, s2) pair against the ONE shared background p
collected by collect_dist.py/driver_dist.py, per the algorithm:

    y1 = f_correct(s1, p),  y2 = f_faulty(s1, p),  delta1 = y1 xor y2
    y3 = f_correct(s2, p),  y4 = f_faulty(s2, p),  delta2 = y3 xor y4
    d1 = (delta1 == 0),     d2 = (delta2 == 0)

This is DESCRIPTIVE, not a hypothesis test -- with a single p, there is
only one (d1, d2) observation per pair, which is not enough data for a
p-value. It reports, per output position, how many of the ordered
(s1, s2) pairs show d1 != d2 (a "disagreement": whether the fault is
silently absorbed differs between s1 and s2, for this one background).

Kyber-specific notes (vs. the generic/mayo version this was adapted
from):

  - Trial JSON schema. driver_dist.py's collect mode writes exactly
    {"inputs": {...}, "outputs": {...}} -- there is no "pre_transform"
    or "captured" section. An also_input (in-place) buffer's PRE-call
    snapshot lives under "<name>_pre" inside "inputs"; its POST-call
    value lives under "<name>" inside "outputs". Pass --out-buf
    "<name>_pre" explicitly if you want the pre-call snapshot instead
    of the real result.

  - --out-word-size 2 (signed int16, little-endian) is the natural unit
    for Kyber's R_q polynomial buffers (poly.coeffs is int16_t[]) --
    NOT 4. Raw byte-string buffers (ciphertext, message, shared secret,
    public/secret key) should use --out-word-size 1.

  - --active-len is in BYTES, matching calibrate.py's active_lengths.json
    units (byte-level binary search) -- it is converted to a word count
    internally (active_len // out_word_size) before indexing the
    decoded array. Passing a raw byte count straight through as a word
    count (the earlier version's behavior) silently over- or
    under-reads whenever out_word_size != 1.

  - --diff-mode: "xor" (default, matches the generic algorithm above --
    fine for byte strings, and for equality-checking on R_q coefficients
    too, since xor(a,b)==0 iff a==b regardless of domain) or "mod-sub"
    ((y1 - y2) mod --modulus, default modulus 3329 = KYBER_Q) --
    algebraically appropriate when you want delta itself to mean
    something as an R_q coefficient difference rather than a raw bit
    pattern. For a pure ineffectiveness (equality) check either mode
    gives identical d1/d2, since both are exactly zero iff y1==y2.

  - sv filename padding. collect_dist.py's field_mod default is 256
    (vs. mayo's small field), so correct_sv*.json/faulty_sv*.json use
    3-digit zero-padding (sv000..sv255) instead of 2. This version
    reads the digit string straight out of each correct_sv match
    instead of re-formatting it with a hardcoded width, so it works
    regardless of the padding collect_dist.py used.

Usage:
    python3 ineffective_kyber.py \
        --dist-dir tests_kyber/poly_ntt/dist_paired \
        --out-buf r --active-len 512 --out-word-size 2

    python3 ineffective_kyber.py \
        --dist-dir tests_kyber/pqcrystals_kyber768_ref_dec/dist_paired \
        --out-buf return --active-len 4 --out-word-size 4
"""

import argparse
import glob
import json
import os
import re
import struct

import numpy as np


def decode_words(values, word_size):
    """values is a flat list of raw bytes (0-255) read straight out of
    target memory. Groups them into word_size-byte little-endian words,
    signed for word_size in {2, 4} to match poly.coeffs (int16_t) / a
    scalar return anchor (int32_t); word_size=1 is the raw bytes
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
    """Returns d[sv] = numpy bool array of length active_len_bytes //
    out_word_size (i.e. in WORDS, not bytes)."""
    active_len_words = active_len_bytes // out_word_size

    d = {}
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

        delta = compute_delta(co, fo, diff_mode, modulus)
        d[sv] = (delta == 0)

    return d


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
                          "2: signed int16 (Kyber poly.coeffs -- most "
                          "R_q buffers). 4: signed int32 (a scalar "
                          "'return' anchor). Default: %(default)s")
    ap.add_argument(
        "--diff-mode", choices=["xor", "mod-sub"], default="xor",
        help="'xor': bitwise delta (default; correct for byte strings, "
             "and for pure equality-checking on any domain). 'mod-sub': "
             "(y1 - y2) mod --modulus, for R_q coefficient buffers where "
             "the delta VALUE should be interpreted mod q. Only affects "
             "which delta==0 check is used here -- both modes agree on "
             "whether y1==y2.",
    )
    ap.add_argument("--modulus", type=int, default=3329,
                     help="modulus for --diff-mode mod-sub (default: "
                          "%(default)s = KYBER_Q)")
    ap.add_argument("--verbose", action="store_true")
    args = ap.parse_args()

    d = load_sweep(args.dist_dir, args.out_buf, args.active_len,
                    args.out_word_size, args.diff_mode, args.modulus)
    secret_values = sorted(d.keys())
    if len(secret_values) < 2:
        raise RuntimeError(f"only {len(secret_values)} secret values found in {args.dist_dir}")

    print(f"[i] loaded {len(secret_values)} secret values (single shared background p)")

    # Safety clamp: --active-len (bytes) converts to a WORD count via
    # --out-word-size, which can still exceed the OUTPUT buffer's true
    # word count (e.g. --out-buf is shorter than the SECRET buffer that
    # active-len was calibrated against). load_sweep() already truncates
    # each array to whatever the output buffer actually decodes to --
    # use THAT length, not the raw converted --active-len, to bound the
    # position loop.
    active_len_words = args.active_len // args.out_word_size
    out_len = min(len(v) for v in d.values())
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
            d1 = bool(d[s1][pos])
            d2 = bool(d[s2][pos])
            if d1 != d2:
                disagree.append((s1, s2, d1, d2))

        if args.verbose or disagree:
            print("=" * 75)
            print(f"pos {pos}: {len(disagree)}/{len(pairs)} pairs disagree "
                  f"(d1 != d2)")
            if disagree:
                for s1, s2, d1, d2 in disagree[:10]:
                    print(f"    s1={s1} (d1={d1}) vs s2={s2} (d2={d2})")
                if len(disagree) > 10:
                    print(f"    ... and {len(disagree) - 10} more")
            print("=" * 75)


if __name__ == "__main__":
    main()