#!/usr/bin/env python3

"""
correction_dependence_test.py

Correction-dependence test for paired correct/faulty executions.

Each trial now contains TWO executions:

    execution 1:
        inputs:
            Vdec
            Ox1
        outputs:
            s1_correct
            s1_faulty

    execution 2:
        inputs:
            Vdec
            Ox2
        outputs:
            s2_correct
            s2_faulty

For every output position i:

    delta1[i] = s1_correct[i] XOR s1_faulty[i]
    delta2[i] = s2_correct[i] XOR s2_faulty[i]

The test does NOT ask:

    dist(delta1) != dist(delta2)

because Ox1 and Ox2 may have the same distribution.

Instead it tests whether delta depends on Ox:

    dist(delta | Ox=a) != dist(delta | Ox=b)

for different Ox values a and b.

For the MAYO mat_add attack:

    s_correct = Vdec XOR Ox
    s_faulty  = Vdec

therefore:

    delta = Ox

and the test should strongly detect dependence.

A Welch t-test is also performed on the HW(delta) distributions
between different Ox groups.

The implementation supports both:

    secret-buf Ox

for the new two-Ox trial format, and the previous single-secret
format if only one Ox is present.
"""

import argparse
import glob
import json
import math
import os
from collections import defaultdict

import numpy as np

try:
    from scipy.stats import chi2_contingency
    from scipy.stats import ttest_ind
except ImportError:
    chi2_contingency = None
    ttest_ind = None


# ----------------------------------------------------------------------
# Utility functions
# ----------------------------------------------------------------------

def hw(x):
    """Hamming weight."""
    return int(x).bit_count()


def xor_delta(a, b):
    return int(a) ^ int(b)


def load_trials(dist_dir):
    """
    Load paired trials.

    New expected format:

        {
          "inputs": {
              "Vdec": [...],
              "Ox1": [...],
              "Ox2": [...]
          },
          "outputs": {
              "s1": [...],
              "s2": [...]
          }
        }

    OR, depending on the collection implementation:

        {
          "inputs": {
              "Vdec": [...],
              "Ox1": [...],
              "Ox2": [...]
          },
          "outputs": {
              "s1_correct": [...],
              "s1_faulty": [...],
              "s2_correct": [...],
              "s2_faulty": [...]
          }
        }

    The function also accepts the older four-file-per-trial layout:

        correct_trialXXXXXX_1.json
        faulty_trialXXXXXX_1.json
        correct_trialXXXXXX_2.json
        faulty_trialXXXXXX_2.json

    where possible.
    """

    files = sorted(glob.glob(os.path.join(dist_dir, "*.json")))

    # --------------------------------------------------------------
    # First try the new single-file trial format.
    # --------------------------------------------------------------

    combined = []

    for path in files:
        try:
            with open(path) as f:
                d = json.load(f)
        except Exception:
            continue

        if not isinstance(d, dict):
            continue

        if "inputs" not in d or "outputs" not in d:
            continue

        inputs = d["inputs"]
        outputs = d["outputs"]

        # New combined format
        if (
            "Ox1" in inputs
            and "Ox2" in inputs
            and (
                (
                    "s1_correct" in outputs
                    and "s1_faulty" in outputs
                    and "s2_correct" in outputs
                    and "s2_faulty" in outputs
                )
                or (
                    "s1" in outputs
                    and "s2" in outputs
                    and "s1_correct" in outputs
                )
            )
        ):
            combined.append(d)

    if combined:
        print(f"[i] loaded {len(combined)} combined two-Ox trials")
        return combined

    raise RuntimeError(
        "No combined two-Ox trials found.\n"
        "Expected each trial to contain Ox1 and Ox2 and the corresponding "
        "correct/faulty outputs."
    )


# ----------------------------------------------------------------------
# Extract the four values from one trial
# ----------------------------------------------------------------------

def extract_trial(trial, pos):
    """
    Return:

        ox1
        ox2
        delta1
        delta2

    for one position.
    """

    inputs = trial["inputs"]
    outputs = trial["outputs"]

    ox1 = int(inputs["Ox1"][pos])
    ox2 = int(inputs["Ox2"][pos])

    # --------------------------------------------------------------
    # Format A:
    #
    # outputs:
    #   s1_correct
    #   s1_faulty
    #   s2_correct
    #   s2_faulty
    # --------------------------------------------------------------

    if (
        "s1_correct" in outputs
        and "s1_faulty" in outputs
        and "s2_correct" in outputs
        and "s2_faulty" in outputs
    ):
        s1c = int(outputs["s1_correct"][pos])
        s1f = int(outputs["s1_faulty"][pos])

        s2c = int(outputs["s2_correct"][pos])
        s2f = int(outputs["s2_faulty"][pos])

    # --------------------------------------------------------------
    # Format B:
    #
    # outputs:
    #   s1 = correct output
    #   s2 = faulty output
    #
    # This format is only used if the collection code explicitly
    # stores the four outputs in another representation.
    # --------------------------------------------------------------

    else:
        raise RuntimeError(
            "Trial does not contain "
            "s1_correct/s1_faulty/s2_correct/s2_faulty."
        )

    delta1 = xor_delta(s1c, s1f)
    delta2 = xor_delta(s2c, s2f)

    return ox1, ox2, delta1, delta2


# ----------------------------------------------------------------------
# Build conditional observations
# ----------------------------------------------------------------------

def collect_position_data(trials, pos):
    """
    For a position, create:

        groups[Ox] = [all observed delta values associated with Ox]

    Both Ox1/delta1 and Ox2/delta2 are added independently.

    Thus one trial contributes up to TWO observations:

        Ox1 -> delta1
        Ox2 -> delta2
    """

    groups = defaultdict(list)

    for trial in trials:
        ox1, ox2, d1, d2 = extract_trial(trial, pos)

        groups[ox1].append(d1)
        groups[ox2].append(d2)

    return groups


# ----------------------------------------------------------------------
# Chi-square test
# ----------------------------------------------------------------------

def correction_chi_square(groups, domain):
    """
    Test whether delta distribution changes with Ox.

    Rows:
        Ox values

    Columns:
        possible delta values

    H0:
        delta distribution is independent of Ox.

    H1:
        delta distribution depends on Ox.
    """

    table = []

    used_values = []

    for ox in domain:
        vals = groups.get(ox, [])

        if len(vals) == 0:
            continue

        used_values.append(ox)

    if len(used_values) < 2:
        return None, None, None

    # Determine observed delta domain.
    delta_values = sorted(
        set(
            d
            for ox in used_values
            for d in groups[ox]
        )
    )

    if len(delta_values) < 2:
        return None, None, None

    delta_index = {
        d: j for j, d in enumerate(delta_values)
    }

    for ox in used_values:
        row = [0] * len(delta_values)

        for d in groups[ox]:
            row[delta_index[d]] += 1

        table.append(row)

    table = np.asarray(table, dtype=np.int64)

    if table.shape[0] < 2 or table.shape[1] < 2:
        return None, None, table

    if chi2_contingency is None:
        return None, None, table

    chi2, p, _, _ = chi2_contingency(
        table,
        correction=False
    )

    return chi2, p, table


# ----------------------------------------------------------------------
# Pairwise Welch t-test
# ----------------------------------------------------------------------

def correction_ttest(groups, min_samples=2):
    """
    Find the strongest pair of Ox values using Welch's t-test.

    We compare HW(delta):

        HW(delta | Ox=a)

    against

        HW(delta | Ox=b)

    for all sufficiently populated pairs.

    The returned pair is the pair with the smallest p-value.
    """

    if ttest_ind is None:
        return None

    usable = {}

    for ox, vals in groups.items():

        if len(vals) < min_samples:
            continue

        hws = np.asarray(
            [hw(v) for v in vals],
            dtype=float
        )

        if len(hws) >= min_samples:
            usable[ox] = hws

    if len(usable) < 2:
        return None

    best = None

    ox_values = sorted(usable)

    for i in range(len(ox_values)):
        for j in range(i + 1, len(ox_values)):

            ox_a = ox_values[i]
            ox_b = ox_values[j]

            a = usable[ox_a]
            b = usable[ox_b]

            # Welch's t-test
            result = ttest_ind(
                a,
                b,
                equal_var=False
            )

            t = float(result.statistic)
            p = float(result.pvalue)

            mean_a = float(np.mean(a))
            mean_b = float(np.mean(b))

            candidate = {
                "ox_a": ox_a,
                "ox_b": ox_b,
                "t": t,
                "p": p,
                "mean_hw_a": mean_a,
                "mean_hw_b": mean_b,
                "difference": mean_a - mean_b,
                "n_a": len(a),
                "n_b": len(b),
            }

            if best is None or p < best["p"]:
                best = candidate

    return best


# ----------------------------------------------------------------------
# Direct correction check
# ----------------------------------------------------------------------

def direct_delta_dependence(groups):
    """
    Useful deterministic diagnostic.

    If:

        delta = Ox

    then every observation satisfies:

        delta == Ox

    We DO NOT use this as the statistical verdict.

    It is only printed as a diagnostic so that we can verify the
    expected attack structure.
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


# ----------------------------------------------------------------------
# Verdict
# ----------------------------------------------------------------------

def make_verdict(
    chi2,
    p_chi,
    ttest_result,
    alpha,
):
    """
    Statistical verdict.

    Correction dependence is established if either:

        chi-square rejects independence

    OR

        the strongest pairwise Welch t-test rejects equal HW means.

    The chi-square result is the primary correction-dependence test.
    """

    if p_chi is not None and p_chi < alpha:
        return "secret/correction-dependent (chi-square)"

    if (
        ttest_result is not None
        and ttest_result["p"] < alpha
    ):
        return "correction-dependent (t-test)"

    if p_chi is None and ttest_result is None:
        return "insufficient data"

    return "no correction dependence detected"


# ----------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------

def main():

    ap = argparse.ArgumentParser()

    ap.add_argument(
        "--dist-dir",
        required=True
    )

    ap.add_argument(
        "--secret-buf",
        default="Ox",
        help="Correction/input buffer name. "
             "The two-Ox format uses Ox1 and Ox2."
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
        default=1
    )

    ap.add_argument(
        "--out-word-size",
        type=int,
        default=1
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
        "--secret-bucket-width",
        type=int,
        default=1
    )

    ap.add_argument(
        "--auto-domain",
        action="store_true"
    )

    ap.add_argument(
        "--alpha",
        type=float,
        default=None
    )

    ap.add_argument(
        "--verbose",
        action="store_true"
    )

    args = ap.parse_args()

    # --------------------------------------------------------------
    # Load trials
    # --------------------------------------------------------------

    trials = load_trials(args.dist_dir)

    # --------------------------------------------------------------
    # Determine domain
    # --------------------------------------------------------------

    all_ox = []

    for trial in trials:
        inputs = trial["inputs"]

        all_ox.extend(
            int(x) for x in inputs["Ox1"]
        )

        all_ox.extend(
            int(x) for x in inputs["Ox2"]
        )

    if not all_ox:
        raise RuntimeError(
            "No Ox1/Ox2 values found."
        )

    if args.auto_domain:
        domain = sorted(set(all_ox))

        print(
            f"[i] auto-detected correction domain: "
            f"[{domain[0]}, {domain[-1]}]"
        )

    else:

        if args.secret_min is None or args.secret_max is None:
            raise RuntimeError(
                "Specify --secret-min/--secret-max "
                "or use --auto-domain."
            )

        domain = list(
            range(
                args.secret_min,
                args.secret_max + 1,
                args.secret_bucket_width
            )
        )

    # --------------------------------------------------------------
    # Correct alpha for multiple positions
    # --------------------------------------------------------------

    if args.alpha is None:
        alpha = 0.05 / args.active_len
    else:
        alpha = args.alpha

    print(
        f"[i] corrected alpha = {alpha}"
    )

    # --------------------------------------------------------------
    # Analyze every position
    # --------------------------------------------------------------

    for pos in range(args.active_len):

        groups = collect_position_data(
            trials,
            pos
        )

        chi2, p_chi, table = correction_chi_square(
            groups,
            domain
        )

        tresult = correction_ttest(
            groups
        )

        verdict = make_verdict(
            chi2,
            p_chi,
            tresult,
            alpha
        )

        direct_rate = direct_delta_dependence(
            groups
        )

        print("=" * 75)
        print(f"pos {pos}")

        if chi2 is None:
            print(
                "  [CORRECTION] "
                "chi2=None, p=None"
            )
        else:
            print(
                f"  [CORRECTION] "
                f"chi2={chi2}, "
                f"p={p_chi}, "
                f"verdict={verdict}"
            )

        # ----------------------------------------------------------
        # T-test
        # ----------------------------------------------------------

        if tresult is None:

            print(
                "  [T-TEST] insufficient samples "
                "for pairwise Welch t-test"
            )

        else:

            print(
                "  [T-TEST] "
                f"Ox={tresult['ox_a']} vs "
                f"Ox={tresult['ox_b']}"
            )

            print(
                f"           t={tresult['t']}, "
                f"p={tresult['p']}, "
                f"verdict="
                f"{'leakage detected' if tresult['p'] < alpha else 'no leakage detected'}"
            )

            print(
                f"           mean HW(delta) | "
                f"Ox={tresult['ox_a']} = "
                f"{tresult['mean_hw_a']}"
            )

            print(
                f"           mean HW(delta) | "
                f"Ox={tresult['ox_b']} = "
                f"{tresult['mean_hw_b']}"
            )

            print(
                f"           difference = "
                f"{tresult['difference']}"
            )

            print(
                f"           N(Ox={tresult['ox_a']})="
                f"{tresult['n_a']}, "
                f"N(Ox={tresult['ox_b']})="
                f"{tresult['n_b']}"
            )

        # ----------------------------------------------------------
        # Diagnostic
        # ----------------------------------------------------------

        if direct_rate is not None:

            print(
                f"  [DIAGNOSTIC] "
                f"fraction delta == Ox = "
                f"{direct_rate:.6f}"
            )

        # ----------------------------------------------------------
        # Print conditional distribution
        # ----------------------------------------------------------

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

            if table is not None:

                print(
                    "  chi-square table "
                    "(rows=Ox, cols=delta):"
                )

                print(table)


if __name__ == "__main__":
    main()