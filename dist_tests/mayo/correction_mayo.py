#!/usr/bin/env python3
"""
correction_dependence_test.py

Correction-dependence test for paired correct/faulty executions.

OLD / NORMAL TRIAL FORMAT
-------------------------

Each trial pair contains ONE Ox input:

    correct_trialXXXXXX.json
    faulty_trialXXXXXX.json

Example:

{
    "inputs": {
        "Vdec": [...],
        "Ox": [...]
    },
    "outputs": {
        "s": [...]
    }
}

For each trial:

    delta = s_correct XOR s_faulty

The test groups delta according to Ox:

    G[a] = { delta_i : Ox_i = a }

and tests, for every pair a != b:

    H0: dist(delta | Ox=a) == dist(delta | Ox=b)

    H1: dist(delta | Ox=a) != dist(delta | Ox=b)

This is the correction-dependence test.

For MAYO mat_add:

    s_correct = Vdec XOR Ox
    s_faulty  = Vdec

therefore:

    delta = Ox

so, ideally,

    dist(delta | Ox=a) = {a}

and every pair a != b should be distinguishable.

The code also supports the generalized trial schemas used by
the Dilithium collection code:

    pre_transform
    captured
    inputs
    outputs

For Dilithium, use e.g.:

    --secret-buf s1_pre_ntt
    --out-buf z
    --secret-word-size 4
    --out-word-size 4

For MAYO:

    --secret-buf Ox
    --out-buf s
    --secret-word-size 1
    --out-word-size 1
"""

import argparse
import glob
import json
import struct
import math
from collections import defaultdict

import numpy as np

from scipy.stats import chi2_contingency
from scipy.stats import ttest_ind


# ---------------------------------------------------------------------
# Utilities
# ---------------------------------------------------------------------

def hw(x):
    """Hamming weight of an integer."""
    x = int(x)
    if x < 0:
        # Two's-complement is not well-defined without a width.
        # For this test we normally use non-negative values.
        x &= 0xFFFFFFFF
    return x.bit_count()


def decode_words(values, word_size):
    """
    Decode a captured buffer.

    word_size = 1:
        raw unsigned bytes

    word_size = 4:
        little-endian signed int32 values
    """

    if word_size == 1:
        return list(values)

    if word_size == 4:
        if len(values) % 4 != 0:
            raise ValueError(
                f"buffer length {len(values)} is not divisible by 4; "
                f"use --*-word-size 1 for byte buffers"
            )

        n = len(values) // 4

        return list(
            struct.unpack(
                f"<{n}i",
                bytes(values)
            )
        )

    raise ValueError(
        f"unsupported word size {word_size}; use 1 or 4"
    )


# ---------------------------------------------------------------------
# Trial loading
# ---------------------------------------------------------------------

def load_trials(dist_dir):
    """
    Load paired:

        correct_trialXXXXXX.json
        faulty_trialXXXXXX.json

    This is the original collection format.
    """

    correct_paths = sorted(
        glob.glob(f"{dist_dir}/correct_trial*.json")
    )

    if not correct_paths:
        raise FileNotFoundError(
            f"No files matching '{dist_dir}/correct_trial*.json'"
        )

    trials = []

    for cpath in correct_paths:

        basename = cpath.split("correct_trial", 1)[1]
        seed = basename.split(".json", 1)[0]

        fpath = f"{dist_dir}/faulty_trial{seed}.json"

        try:
            with open(cpath) as f:
                correct = json.load(f)

            with open(fpath) as f:
                faulty = json.load(f)

        except FileNotFoundError:
            continue

        trials.append((correct, faulty))

    if not trials:
        raise RuntimeError(
            f"No usable correct/faulty trial pairs in {dist_dir}"
        )

    return trials


# ---------------------------------------------------------------------
# Buffer extraction
# ---------------------------------------------------------------------

def get_buffer(record, buf_name):
    """
    Look for a buffer in the schemas used by the project.

    Priority:

        pre_transform
        captured
        inputs
        outputs

    This keeps the code usable for both MAYO and Dilithium.
    """

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

    raise KeyError(
        f"Buffer '{buf_name}' not found.\n"
        f"pre_transform keys: {sorted(pre.keys())}\n"
        f"captured keys:      {sorted(captured.keys())}\n"
        f"inputs keys:        {sorted(inputs.keys())}\n"
        f"outputs keys:       {sorted(outputs.keys())}"
    )


# ---------------------------------------------------------------------
# Delta calculation
# ---------------------------------------------------------------------

def compute_delta(
    correct,
    faulty,
    out_buf,
    active_len,
    out_word_size
):
    """
    Compute:

        delta = correct_output XOR faulty_output
    """

    c = decode_words(
        get_buffer(correct, out_buf),
        out_word_size
    )

    f = decode_words(
        get_buffer(faulty, out_buf),
        out_word_size
    )

    c = np.asarray(c, dtype=np.int64)
    f = np.asarray(f, dtype=np.int64)

    if active_len is not None:
        c = c[:active_len]
        f = f[:active_len]

    return np.bitwise_xor(c, f)


# ---------------------------------------------------------------------
# Extract Ox and delta
# ---------------------------------------------------------------------

def get_secret_value(
    correct,
    secret_buf,
    position,
    secret_word_size
):
    """
    Read Ox[position] from the correct trial.

    Correct and faulty trials have identical inputs, so using
    the correct record is sufficient.
    """

    values = decode_words(
        get_buffer(correct, secret_buf),
        secret_word_size
    )

    if position >= len(values):
        raise IndexError(
            f"{secret_buf}[{position}] does not exist; "
            f"buffer contains {len(values)} words"
        )

    return int(values[position])


# ---------------------------------------------------------------------
# Build conditional distributions
# ---------------------------------------------------------------------

def collect_groups(
    trials,
    secret_buf,
    secret_pos,
    out_buf,
    out_pos,
    secret_word_size,
    out_word_size,
    active_len
):
    """
    Build:

        groups[Ox] = [delta values]

    One trial contributes exactly ONE observation.

    This is the important difference from the previous two-Ox
    collection scheme.
    """

    groups = defaultdict(list)

    for correct, faulty in trials:

        ox = get_secret_value(
            correct,
            secret_buf,
            secret_pos,
            secret_word_size
        )

        delta = compute_delta(
            correct,
            faulty,
            out_buf,
            active_len,
            out_word_size
        )

        groups[ox].append(
            int(delta[out_pos])
        )

    return groups


# ---------------------------------------------------------------------
# Pairwise chi-square test
# ---------------------------------------------------------------------

def pairwise_chi_square(
    groups,
    min_samples=2
):
    """
    Compare every pair:

        dist(delta | Ox=a)
        versus
        dist(delta | Ox=b)

    using a 2 x delta-domain contingency table.

    Returns one record per pair.
    """

    ox_values = sorted(
        ox for ox, vals in groups.items()
        if len(vals) >= min_samples
    )

    results = []

    for i in range(len(ox_values)):

        for j in range(i + 1, len(ox_values)):

            a = ox_values[i]
            b = ox_values[j]

            va = groups[a]
            vb = groups[b]

            delta_domain = sorted(
                set(va) | set(vb)
            )

            if len(delta_domain) < 2:
                # Both distributions are identical point masses.
                chi2 = 0.0
                p = 1.0

                results.append({
                    "ox_a": a,
                    "ox_b": b,
                    "chi2": chi2,
                    "p": p,
                    "n_a": len(va),
                    "n_b": len(vb),
                })

                continue

            index = {
                d: k
                for k, d in enumerate(delta_domain)
            }

            table = np.zeros(
                (2, len(delta_domain)),
                dtype=int
            )

            for d in va:
                table[0, index[d]] += 1

            for d in vb:
                table[1, index[d]] += 1

            try:
                chi2, p, _, _ = chi2_contingency(
                    table,
                    correction=False
                )

            except ValueError:
                chi2 = float("nan")
                p = 1.0

            results.append({
                "ox_a": a,
                "ox_b": b,
                "chi2": float(chi2),
                "p": float(p),
                "n_a": len(va),
                "n_b": len(vb),
                "table": table,
            })

    return results


# ---------------------------------------------------------------------
# Pairwise Welch t-test
# ---------------------------------------------------------------------

def pairwise_t_tests(
    groups,
    min_samples=2
):
    """
    Compare HW(delta) for every pair:

        HW(delta | Ox=a)
        versus
        HW(delta | Ox=b)

    using Welch's t-test.
    """

    ox_values = sorted(
        ox for ox, vals in groups.items()
        if len(vals) >= min_samples
    )

    results = []

    for i in range(len(ox_values)):

        for j in range(i + 1, len(ox_values)):

            a = ox_values[i]
            b = ox_values[j]

            hwa = np.asarray(
                [hw(x) for x in groups[a]],
                dtype=float
            )

            hwb = np.asarray(
                [hw(x) for x in groups[b]],
                dtype=float
            )

            result = ttest_ind(
                hwa,
                hwb,
                equal_var=False
            )

            results.append({
                "ox_a": a,
                "ox_b": b,
                "t": float(result.statistic),
                "p": float(result.pvalue),
                "mean_hw_a": float(np.mean(hwa)),
                "mean_hw_b": float(np.mean(hwb)),
                "difference":
                    float(np.mean(hwa) - np.mean(hwb)),
                "n_a": len(hwa),
                "n_b": len(hwb),
            })

    return results


# ---------------------------------------------------------------------
# Multiple comparison correction
# ---------------------------------------------------------------------

def bonferroni_alpha(alpha, n_tests):
    if n_tests <= 0:
        return alpha

    return alpha / n_tests


# ---------------------------------------------------------------------
# Diagnostics
# ---------------------------------------------------------------------

def diagnostic_delta_equals_secret(groups):
    """
    Diagnostic only.

    For MAYO mat_add:

        delta = Ox

    Therefore this should be 1.0 at the attacked position.

    It is NOT used as the statistical verdict.
    """

    total = 0
    equal = 0

    for ox, deltas in groups.items():

        for d in deltas:

            total += 1

            if d == ox:
                equal += 1

    if total == 0:
        return None

    return equal / total


# ---------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------

def main():

    ap = argparse.ArgumentParser()

    ap.add_argument(
        "--dist-dir",
        required=True
    )

    ap.add_argument(
        "--secret-buf",
        default="Ox",
        help="Input/correction buffer, e.g. Ox for MAYO or "
             "s1_pre_ntt for Dilithium."
    )

    ap.add_argument(
        "--out-buf",
        default="s"
    )

    ap.add_argument(
        "--active-len",
        type=int,
        required=True
    )

    ap.add_argument(
        "--secret-word-size",
        type=int,
        default=1,
        choices=[1, 4]
    )

    ap.add_argument(
        "--out-word-size",
        type=int,
        default=1,
        choices=[1, 4]
    )

    ap.add_argument(
        "--auto-domain",
        action="store_true",
        help="Use all observed secret values."
    )

    ap.add_argument(
        "--secret-min",
        type=int,
        default=None
    )

    ap.add_argument(
        "--secret-max",
        type=int,
        default=None
    )

    ap.add_argument(
        "--alpha",
        type=float,
        default=0.05
    )

    ap.add_argument(
        "--min-samples",
        type=int,
        default=2
    )

    ap.add_argument(
        "--verbose",
        action="store_true"
    )

    args = ap.parse_args()

    # -------------------------------------------------------------
    # Load trials
    # -------------------------------------------------------------

    trials = load_trials(args.dist_dir)

    print(
        f"[i] loaded {len(trials)} correct/faulty trial pairs"
    )

    # -------------------------------------------------------------
    # Determine secret domain
    # -------------------------------------------------------------

    observed_secret_values = set()

    for correct, _ in trials:

        values = decode_words(
            get_buffer(correct, args.secret_buf),
            args.secret_word_size
        )

        for pos in range(
            min(args.active_len, len(values))
        ):
            observed_secret_values.add(
                int(values[pos])
            )

    if args.auto_domain:

        domain = sorted(
            observed_secret_values
        )

        if not domain:
            raise RuntimeError(
                "No secret values observed."
            )

        print(
            f"[i] auto-detected secret domain: "
            f"{domain}"
        )

    else:

        if (
            args.secret_min is None
            or args.secret_max is None
        ):
            raise RuntimeError(
                "Specify --secret-min and --secret-max "
                "or use --auto-domain."
            )

        domain = list(
            range(
                args.secret_min,
                args.secret_max + 1
            )
        )

    # -------------------------------------------------------------
    # Analyze every position
    # -------------------------------------------------------------

    for pos in range(args.active_len):

        groups = collect_groups(
            trials,
            args.secret_buf,
            pos,
            args.out_buf,
            pos,
            args.secret_word_size,
            args.out_word_size,
            args.active_len
        )

        # Keep only requested domain
        groups = {
            ox: vals
            for ox, vals in groups.items()
            if ox in domain
        }

        # ---------------------------------------------------------
        # Pairwise chi-square
        # ---------------------------------------------------------

        chi_results = pairwise_chi_square(
            groups,
            min_samples=args.min_samples
        )

        # Number of pairwise comparisons
        n_tests = len(chi_results)

        corrected_alpha = bonferroni_alpha(
            args.alpha,
            n_tests
        )

        significant_chi = [
            r for r in chi_results
            if np.isfinite(r["p"])
            and r["p"] < corrected_alpha
        ]

        # strongest pair
        best_chi = None

        if chi_results:
            best_chi = min(
                chi_results,
                key=lambda r: r["p"]
            )

        # ---------------------------------------------------------
        # Pairwise t-tests
        # ---------------------------------------------------------

        t_results = pairwise_t_tests(
            groups,
            min_samples=args.min_samples
        )

        best_t = None

        if t_results:
            best_t = min(
                t_results,
                key=lambda r: r["p"]
            )

        n_t_tests = len(t_results)

        corrected_t_alpha = bonferroni_alpha(
            args.alpha,
            n_t_tests
        )

        significant_t = [
            r for r in t_results
            if np.isfinite(r["p"])
            and r["p"] < corrected_t_alpha
        ]

        # ---------------------------------------------------------
        # Verdict
        # ---------------------------------------------------------

        correction_detected = (
            len(significant_chi) > 0
            or len(significant_t) > 0
        )

        # ---------------------------------------------------------
        # Output
        # ---------------------------------------------------------

        print("=" * 75)
        print(f"pos {pos}")

        if correction_detected:

            print(
                "  [CORRECTION] "
                "secret/correction-dependent"
            )

        else:

            print(
                "  [CORRECTION] "
                "no correction dependence detected"
            )

        print(
            f"           observed Ox values: "
            f"{sorted(groups.keys())}"
        )

        print(
            f"           pairwise chi-square tests: "
            f"{n_tests}"
        )

        print(
            f"           Bonferroni alpha: "
            f"{corrected_alpha}"
        )

        print(
            f"           significant chi-square pairs: "
            f"{len(significant_chi)}/{n_tests}"
        )

        # ---------------------------------------------------------
        # Strongest chi-square pair
        # ---------------------------------------------------------

        if best_chi is not None:

            print(
                "  [BEST CHI-SQUARE] "
                f"Ox={best_chi['ox_a']} vs "
                f"Ox={best_chi['ox_b']}"
            )

            print(
                f"           chi2={best_chi['chi2']}, "
                f"p={best_chi['p']}"
            )

            print(
                f"           N="
                f"{best_chi['n_a']} vs "
                f"{best_chi['n_b']}"
            )

        else:

            print(
                "  [CHI-SQUARE] "
                "insufficient distinct Ox groups"
            )

        # ---------------------------------------------------------
        # T-test
        # ---------------------------------------------------------

        if best_t is not None:

            print(
                "  [T-TEST] "
                f"Ox={best_t['ox_a']} vs "
                f"Ox={best_t['ox_b']}"
            )

            print(
                f"           t={best_t['t']}, "
                f"p={best_t['p']}"
            )

            print(
                f"           Bonferroni alpha="
                f"{corrected_t_alpha}"
            )

            print(
                "           verdict="
                + (
                    "leakage detected"
                    if best_t["p"] < corrected_t_alpha
                    else "no leakage detected"
                )
            )

            print(
                f"           mean HW(delta) | "
                f"Ox={best_t['ox_a']} = "
                f"{best_t['mean_hw_a']}"
            )

            print(
                f"           mean HW(delta) | "
                f"Ox={best_t['ox_b']} = "
                f"{best_t['mean_hw_b']}"
            )

            print(
                f"           difference="
                f"{best_t['difference']}"
            )

        else:

            print(
                "  [T-TEST] "
                "insufficient samples"
            )

        # ---------------------------------------------------------
        # MAYO diagnostic
        # ---------------------------------------------------------

        direct_rate = diagnostic_delta_equals_secret(
            groups
        )

        if direct_rate is not None:

            print(
                "  [DIAGNOSTIC] "
                f"fraction delta == Ox = "
                f"{direct_rate:.6f}"
            )

        # ---------------------------------------------------------
        # Verbose conditional distributions
        # ---------------------------------------------------------

        if args.verbose:

            print(
                "  conditional distributions:"
            )

            for ox in sorted(groups):

                vals = groups[ox]

                counts = defaultdict(int)

                for d in vals:
                    counts[d] += 1

                print(
                    f"    Ox={ox}: "
                    f"N={len(vals)}, "
                    f"delta={dict(sorted(counts.items()))}"
                )

            print(
                "  pairwise chi-square results:"
            )

            for r in chi_results:

                print(
                    f"    Ox={r['ox_a']} vs "
                    f"Ox={r['ox_b']}: "
                    f"chi2={r['chi2']}, "
                    f"p={r['p']}"
                )

            print(
                "  pairwise t-test results:"
            )

            for r in t_results:

                print(
                    f"    Ox={r['ox_a']} vs "
                    f"Ox={r['ox_b']}: "
                    f"t={r['t']}, "
                    f"p={r['p']}, "
                    f"meanHW="
                    f"{r['mean_hw_a']} vs "
                    f"{r['mean_hw_b']}"
                )


if __name__ == "__main__":
    main()