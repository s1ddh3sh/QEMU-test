#!/usr/bin/env python3
"""
correction_paired_test.py (single-background mode)

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

Usage:
    python3 correction_paired_test.py \
        --dist-dir tests_mayo/mat_add/dist_paired \
        --out-buf s --active-len 78 --out-word-size 1
"""

import argparse
import glob
import json
import os
import re
import struct

import numpy as np


def decode_words(values, word_size):
    if word_size == 1:
        return list(values)
    if word_size == 4:
        n = len(values) // 4
        return list(struct.unpack(f"<{n}i", bytes(values)))
    raise ValueError(f"unsupported word size {word_size}")


def get_buffer(record, buf_name):
    pre = record.get("pre_transform", {})
    if buf_name in pre and pre[buf_name] is not None:
        return pre[buf_name]
    captured = record.get("captured", {})
    if buf_name in captured and captured[buf_name] is not None:
        return captured[buf_name]
    inputs = record.get("inputs", {})
    if buf_name in inputs:
        return inputs[buf_name]
    outputs = record.get("outputs", {})
    if buf_name in outputs:
        return outputs[buf_name]
    raise KeyError(f"'{buf_name}' not found (inputs={sorted(inputs.keys())}, "
                   f"outputs={sorted(outputs.keys())})")


_FNAME_RE = re.compile(r"correct_sv(\d+)\.json")


def load_sweep(dist_dir, out_buf, active_len, out_word_size):
    """
    Returns delta[sv] = numpy int64 array of length min(active_len,
    len(out_buf)) -- the raw Delta(s) values, NOT booleans, unlike
    ineffective_paired_test.py's d[sv].
    """
    delta = {}
    for cpath in sorted(glob.glob(f"{dist_dir}/correct_sv*.json")):
        basename = os.path.basename(cpath)
        m = _FNAME_RE.search(basename)
        if not m:
            continue
        sv = int(m.group(1))
        fpath = f"{dist_dir}/faulty_sv{sv:02d}.json"

        with open(cpath) as f:
            c = json.load(f)
        with open(fpath) as f:
            fdata = json.load(f)

        co = np.asarray(decode_words(get_buffer(c, out_buf), out_word_size), dtype=np.int64)
        fo = np.asarray(decode_words(get_buffer(fdata, out_buf), out_word_size), dtype=np.int64)
        co = co[:active_len]
        fo = fo[:active_len]

        delta[sv] = np.bitwise_xor(co, fo)

    return delta


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dist-dir", required=True)
    ap.add_argument("--out-buf", required=True)
    ap.add_argument("--active-len", type=int, required=True)
    ap.add_argument("--out-word-size", type=int, default=1, choices=[1, 4])
    ap.add_argument("--verbose", action="store_true")
    args = ap.parse_args()

    delta = load_sweep(args.dist_dir, args.out_buf, args.active_len, args.out_word_size)
    secret_values = sorted(delta.keys())
    if len(secret_values) < 2:
        raise RuntimeError(f"only {len(secret_values)} secret values found in {args.dist_dir}")

    print(f"[i] loaded {len(secret_values)} secret values (single shared background p)")

    # Safety clamp: --active-len is normally derived from the SECRET
    # buffer's calibrated length, which can exceed the OUTPUT buffer's
    # true length. load_sweep() already truncates each delta array to
    # whatever the output buffer actually contains -- use THAT length,
    # not the raw --active-len, to bound the position loop.
    out_len = min(len(v) for v in delta.values())
    safe_len = min(args.active_len, out_len)
    if safe_len < args.active_len:
        print(
            f"[!] --active-len={args.active_len} exceeds the output buffer "
            f"'{args.out_buf}''s actual length ({out_len}); clamping "
            f"position loop to {safe_len}."
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