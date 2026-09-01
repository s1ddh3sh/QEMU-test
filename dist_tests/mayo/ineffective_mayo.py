#!/usr/bin/env python3
"""
ineffective_paired_test.py (single-background mode)

Reports d1, d2 for every (s1, s2) pair against the ONE shared background p
collected by collect_paired_sweep.py, per your algorithm:

    y1 = f_correct(s1, p),  y2 = f_faulty(s1, p),  delta1 = y1 xor y2
    y3 = f_correct(s2, p),  y4 = f_faulty(s2, p),  delta2 = y3 xor y4
    d1 = (delta1 == 0),     d2 = (delta2 == 0)

This is DESCRIPTIVE, not a hypothesis test -- with a single p, there is
only one (d1, d2) observation per pair, which is not enough data for a
p-value. It reports, per output position, how many of the 256 ordered
(s1, s2) pairs show d1 != d2 (a "disagreement": whether the fault is
silently absorbed differs between s1 and s2, for this one background).

Usage:
    python3 ineffective_paired_test.py \
        --dist-dir tests_mayo/m_vec_add/dist_paired \
        --out-buf acc --active-len 40 --out-word-size 1
"""

import argparse
import glob
import json
import re
import struct
import os
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
    """Returns d[sv] = numpy bool array of length active_len."""
    d = {}
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
        delta = np.bitwise_xor(co, fo)

        d[sv] = (delta == 0)

    return d
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dist-dir", required=True)
    ap.add_argument("--out-buf", required=True)
    ap.add_argument("--active-len", type=int, required=True)
    ap.add_argument("--out-word-size", type=int, default=1, choices=[1, 4])
    ap.add_argument("--verbose", action="store_true")
    args = ap.parse_args()

    d = load_sweep(args.dist_dir, args.out_buf, args.active_len, args.out_word_size)
    secret_values = sorted(d.keys())
    if len(secret_values) < 2:
        raise RuntimeError(f"only {len(secret_values)} secret values found in {args.dist_dir}")

    print(f"[i] loaded {len(secret_values)} secret values (single shared background p)")

    # Safety clamp: --active-len is normally derived from the SECRET
    # buffer's calibrated length, which can exceed the OUTPUT buffer's
    # true length whenever secret_buf and out_buf are different natural
    # sizes (e.g. secret_buf is an input matrix, out_buf is a shorter
    # result). load_sweep() already silently truncates each delta array
    # to whatever the output buffer actually contains, so use THAT
    # length -- not the raw --active-len -- to bound the position loop.
    out_len = min(len(v) for v in d.values())
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