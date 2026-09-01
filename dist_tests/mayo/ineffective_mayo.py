#!/usr/bin/env python3
"""
ineffective_dependence_test_mayo.py

Tests two different properties for every position.

TEST 1: Ineffective dependence
--------------------------------
Does delta == 0 / delta != 0 depend on the secret value?

    H0: secret and Ineffective/divergence are independent
    H1: secret and Ineffective/divergence are dependent

Uses:
    - chi-square test when the table is sufficiently dense
    - permutation test when the table is sparse

TEST 2: Leakage / magnitude dependence
---------------------------------------
Does the NUMERIC divergence depend on the secret?

For every trial:

    delta = correct_output XOR faulty_output

We compute:

    hw(delta) = Hamming weight of delta

and compare:

    hw(delta) | secret == 0

against:

    hw(delta) | secret != 0

using Welch's two-sample t-test.

Thus:

    H0:
        E[HW(delta) | secret == 0]
        =
        E[HW(delta) | secret != 0]

    H1:
        the two means differ.

The Ineffective test and leakage test answer different questions.
"""

import argparse
import glob
import json
import struct
import sys

import numpy as np

from scipy.stats import (
    chi2_contingency,
    fisher_exact,
    ttest_ind,
)


# ---------------------------------------------------------------------
# Trial loading
# ---------------------------------------------------------------------

def load_trials(dist_dir):
    trials = []

    correct_paths = sorted(
        glob.glob(f"{dist_dir}/correct_trial*.json")
    )

    if not correct_paths:
        raise FileNotFoundError(
            f"No files matching '{dist_dir}/correct_trial*.json'"
        )

    for cpath in correct_paths:
        seed = cpath.split("correct_trial")[1].split(".json")[0]
        fpath = f"{dist_dir}/faulty_trial{seed}.json"

        try:
            with open(cpath) as fc:
                c = json.load(fc)

            with open(fpath) as ff:
                f = json.load(ff)

        except FileNotFoundError:
            continue

        schema_keys = (
            "captured",
            "inputs",
            "outputs",
            "pre_transform",
        )

        if not any(k in c for k in schema_keys):
            raise KeyError(
                f"{cpath} has none of {schema_keys} "
                f"-- corrupt or wrong-format trial file"
            )

        if not any(k in f for k in schema_keys):
            raise KeyError(
                f"{fpath} has none of {schema_keys} "
                f"-- corrupt or wrong-format trial file"
            )

        trials.append((c, f))

    if not trials:
        raise RuntimeError(
            f"No usable trial pairs in {dist_dir}"
        )

    return trials


# ---------------------------------------------------------------------
# Buffer lookup
# ---------------------------------------------------------------------

def get_buffer(trial_record, buf_name):
    """
    Look up buf_name across all trial-file schemas.

    Priority:

        pre_transform
        captured
        inputs
        outputs
    """

    pre_transform = trial_record.get("pre_transform", {})

    if (
        buf_name in pre_transform
        and pre_transform[buf_name] is not None
    ):
        return pre_transform[buf_name]

    captured = trial_record.get("captured", {})

    if (
        buf_name in captured
        and captured[buf_name] is not None
    ):
        return captured[buf_name]

    inputs = trial_record.get("inputs", {})

    if buf_name in inputs:
        return inputs[buf_name]

    outputs = trial_record.get("outputs", {})

    if buf_name in outputs:
        return outputs[buf_name]

    raise KeyError(
        f"'{buf_name}' not found in trial's "
        f"pre_transform, captured, inputs, or outputs. "
        f"pre_transform keys: {sorted(pre_transform.keys())}, "
        f"captured keys: {sorted(captured.keys())}, "
        f"inputs keys: {sorted(inputs.keys())}, "
        f"outputs keys: {sorted(outputs.keys())}"
    )


# ---------------------------------------------------------------------
# Decode buffers
# ---------------------------------------------------------------------

def decode_words(byte_list, word_size):
    """
    word_size=1:
        raw bytes, unsigned 0..255

    word_size=4:
        signed little-endian int32 values.
    """

    if word_size == 1:
        return list(byte_list)

    if word_size == 4:
        if len(byte_list) % 4 != 0:
            raise ValueError(
                f"buffer length {len(byte_list)} not divisible by 4 "
                f"-- not a valid int32 array"
            )

        n = len(byte_list) // 4

        return list(
            struct.unpack(
                f"<{n}i",
                bytes(byte_list)
            )
        )

    raise ValueError(
        f"unsupported word_size {word_size}"
    )


# ---------------------------------------------------------------------
# Delta computation
# ---------------------------------------------------------------------

def compute_delta(
    c,
    f,
    out_buf,
    active_len,
    word_size
):
    """
    Compute word-wise XOR difference:

        delta = correct XOR faulty
    """

    co = np.array(
        decode_words(
            get_buffer(c, out_buf),
            word_size
        )
    )

    fo = np.array(
        decode_words(
            get_buffer(f, out_buf),
            word_size
        )
    )

    if active_len is not None:
        co = co[:active_len]
        fo = fo[:active_len]

    return np.bitwise_xor(
        co.astype(np.int64),
        fo.astype(np.int64)
    )


# ---------------------------------------------------------------------
# Hamming weight
# ---------------------------------------------------------------------

def popcount_int64(x):
    """
    Hamming weight of a 64-bit representation.

    Since our decoded words are int32 values, we mask to
    32 bits before counting.
    """

    x = int(x) & 0xffffffff

    return x.bit_count()


def delta_hamming_weights(delta):
    """
    Convert vector of XOR deltas to Hamming weights.
    """

    return np.array(
        [popcount_int64(x) for x in delta],
        dtype=float
    )


# ---------------------------------------------------------------------
# Build Ineffective-dependence table
# ---------------------------------------------------------------------

def build_table(
    trials,
    secret_buf,
    secret_pos,
    out_buf,
    active_len,
    delta_pos,
    secret_min,
    secret_max,
    secret_word_size,
    out_word_size,
    bucket_width=1
):
    """
    Rows:
        secret value/bucket

    Columns:
        delta == 0
        delta != 0
    """

    field_mod = secret_max - secret_min + 1

    n_buckets = (
        field_mod + bucket_width - 1
    ) // bucket_width

    table = np.zeros(
        (n_buckets, 2),
        dtype=int
    )

    for c, f in trials:

        secret_words = decode_words(
            get_buffer(c, secret_buf),
            secret_word_size
        )

        secret_val = secret_words[secret_pos]

        if not (
            secret_min
            <= secret_val
            <= secret_max
        ):
            raise ValueError(
                f"secret value {secret_val} at position "
                f"{secret_pos} in buffer '{secret_buf}' "
                f"is outside declared domain "
                f"[{secret_min}, {secret_max}]"
            )

        row = (
            secret_val - secret_min
        ) // bucket_width

        delta = compute_delta(
            c,
            f,
            out_buf,
            active_len,
            out_word_size
        )

        col = (
            0
            if delta[delta_pos] == 0
            else 1
        )

        table[row, col] += 1

    return table


# ---------------------------------------------------------------------
# Collect numeric leakage samples
# ---------------------------------------------------------------------

def collect_leakage_samples(
    trials,
    secret_buf,
    secret_pos,
    out_buf,
    active_len,
    delta_pos,
    secret_word_size,
    out_word_size
):
    """
    Return two arrays:

        group_zero
            HW(delta) for trials where secret == 0

        group_nonzero
            HW(delta) for trials where secret != 0

    This is the data used by the Welch t-test.
    """

    group_zero = []
    group_nonzero = []

    for c, f in trials:

        secret_words = decode_words(
            get_buffer(c, secret_buf),
            secret_word_size
        )

        secret_val = secret_words[secret_pos]

        delta = compute_delta(
            c,
            f,
            out_buf,
            active_len,
            out_word_size
        )

        hw = popcount_int64(
            delta[delta_pos]
        )

        if secret_val == 0:
            group_zero.append(hw)
        else:
            group_nonzero.append(hw)

    return (
        np.asarray(group_zero, dtype=float),
        np.asarray(group_nonzero, dtype=float)
    )


# ---------------------------------------------------------------------
# Welch t-test
# ---------------------------------------------------------------------

def leakage_t_test(
    group_zero,
    group_nonzero,
    alpha
):
    """
    Welch two-sample t-test.

    H0:
        mean(HW(delta) | secret == 0)
        =
        mean(HW(delta) | secret != 0)

    H1:
        means differ.
    """

    n0 = len(group_zero)
    n1 = len(group_nonzero)

    if n0 < 3 or n1 < 3:
        return {
            "t": None,
            "p": None,
            "mean_zero": (float(np.mean(group_zero)) if n0 > 0 else None),
            "mean_nonzero": (float(np.mean(group_nonzero)) if n1 > 0 else None),
            "n_zero": n0,
            "n_nonzero": n1,
            "verdict": "insufficient samples for Welch t-test",
        }

    mean0 = float(np.mean(group_zero))
    mean1 = float(np.mean(group_nonzero))

    var0 = float(np.var(group_zero, ddof=1))
    var1 = float(np.var(group_nonzero, ddof=1))

    # Guard against degenerate/zero-variance groups: Welch's denominator
    # sqrt(var0/n0 + var1/n1) can be exactly zero when both groups have
    # zero variance (e.g. every trial in both groups has an identical
    # HW(delta)), producing a spurious t=+-inf, p=0.0 that looks like
    # overwhelming significance but is really an undefined ratio, not a
    # genuine effect. scipy's "catastrophic cancellation" warning is the
    # same symptom surfacing from the moment calculation.
    denom = var0 / n0 + var1 / n1
    if denom <= 0 or not np.isfinite(denom):
        return {
            "t": None,
            "p": None,
            "mean_zero": mean0,
            "mean_nonzero": mean1,
            "var_zero": var0,
            "var_nonzero": var1,
            "n_zero": n0,
            "n_nonzero": n1,
            "mean_difference": mean0 - mean1,
            "verdict": "degenerate variance -- t-test undefined",
        }

    t_stat, p_value = ttest_ind(
        group_zero, group_nonzero, equal_var=False, alternative="two-sided"
    )

    if not np.isfinite(t_stat) or not np.isfinite(p_value):
        return {
            "t": None,
            "p": None,
            "mean_zero": mean0,
            "mean_nonzero": mean1,
            "var_zero": var0,
            "var_nonzero": var1,
            "n_zero": n0,
            "n_nonzero": n1,
            "mean_difference": mean0 - mean1,
            "verdict": "non-finite t-statistic -- discarded",
        }

    verdict = "leakage detected" if p_value < alpha else "no leakage detected"

    return {
        "t": float(t_stat),
        "p": float(p_value),
        "mean_zero": mean0,
        "mean_nonzero": mean1,
        "var_zero": var0,
        "var_nonzero": var1,
        "n_zero": n0,
        "n_nonzero": n1,
        "mean_difference": mean0 - mean1,
        "verdict": verdict,
    }

# ---------------------------------------------------------------------
# Automatically detect domain
# ---------------------------------------------------------------------

def detect_domain(
    trials,
    secret_buf,
    secret_word_size,
    n_positions
):
    lo = None
    hi = None

    for c, _ in trials:

        words = decode_words(
            get_buffer(c, secret_buf),
            secret_word_size
        )

        words = words[:n_positions]

        wmin = min(words)
        wmax = max(words)

        lo = (
            wmin
            if lo is None
            else min(lo, wmin)
        )

        hi = (
            wmax
            if hi is None
            else max(hi, wmax)
        )

    return lo, hi


# ---------------------------------------------------------------------
# Permutation test
# ---------------------------------------------------------------------

def permutation_test_full_table(
    table,
    n_perm=20000,
    rng=None
):
    """
    Permutation test for secret/dependence table.
    """

    rng = (
        rng
        if rng is not None
        else np.random.default_rng()
    )

    obs_rows = []
    obs_cols = []

    for r in range(table.shape[0]):

        for c in range(2):

            obs_rows += [
                r
            ] * table[r, c]

            obs_cols += [
                c
            ] * table[r, c]

    obs_rows = np.array(obs_rows)
    obs_cols = np.array(obs_cols)

    def stat(rows, cols):

        t = np.zeros_like(table)

        for r, c in zip(rows, cols):
            t[r, c] += 1

        row_t = t.sum(
            axis=1,
            keepdims=True
        )

        col_t = t.sum(
            axis=0,
            keepdims=True
        )

        n = t.sum()

        expected = (
            row_t * col_t / n
        )

        with np.errstate(
            divide="ignore",
            invalid="ignore"
        ):

            contrib = np.where(
                expected > 0,
                (t - expected) ** 2
                / expected,
                0
            )

        return contrib.sum()

    observed_stat = stat(
        obs_rows,
        obs_cols
    )

    count_ge = 0

    for _ in range(n_perm):

        perm_cols = rng.permutation(
            obs_cols
        )

        if (
            stat(obs_rows, perm_cols)
            >= observed_stat
        ):
            count_ge += 1

    p_value = (
        count_ge + 1
    ) / (
        n_perm + 1
    )

    return observed_stat, p_value


# ---------------------------------------------------------------------
# Ineffective dependence test
# ---------------------------------------------------------------------

def dependence_test(
    table,
    alpha,
    min_cell_count=5,
    use_permutation_fallback=True,
    n_perm=20000,
    rng=None
):
    """
    Test whether secret value predicts:

        delta == 0
        delta != 0
    """

    row_ok = (
        table.sum(axis=1) > 0
    )

    filtered = table[row_ok]

    if filtered.shape[0] < 2:

        return (
            None,
            None,
            "insufficient distinct secret values sampled"
        )

    col0_total = (
        filtered[:, 0].sum()
    )

    col1_total = (
        filtered[:, 1].sum()
    )

    if col1_total == 0:

        return (
            None,
            None,
            "no divergence observed: "
            "delta==0 on every trial at this position"
        )

    if col0_total == 0:

        return (
            None,
            None,
            "delta is NEVER 0 at this position"
        )

    row_totals = filtered.sum(
        axis=1,
        keepdims=True
    )

    col_totals = filtered.sum(
        axis=0,
        keepdims=True
    )

    expected = (
        row_totals
        * col_totals
        / filtered.sum()
    )

    if expected.min() < min_cell_count:

        if not use_permutation_fallback:

            return (
                None,
                None,
                "table too sparse for chi-square"
            )

        stat, p = (
            permutation_test_full_table(
                filtered,
                n_perm=n_perm,
                rng=rng
            )
        )

        verdict = (
            "secret-dependent"
            if p < alpha
            else "no dependence detected"
        )

        return (
            stat,
            p,
            f"{verdict} "
            "(permutation test)"
        )

    chi2, p, dof, _ = (
        chi2_contingency(filtered)
    )

    verdict = (
        "secret-dependent"
        if p < alpha
        else "no dependence detected"
    )

    return (
        chi2,
        p,
        verdict
    )


# ---------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------

if __name__ == "__main__":

    ap = argparse.ArgumentParser()

    ap.add_argument(
        "--dist-dir",
        required=True
    )

    ap.add_argument(
        "--out-buf",
        default="s"
    )

    ap.add_argument(
        "--secret-buf",
        default="Ox"
    )

    ap.add_argument(
        "--active-len",
        type=int,
        default=78
    )

    ap.add_argument(
        "--secret-word-size",
        type=int,
        default=4,
        choices=[1, 4]
    )

    ap.add_argument(
        "--out-word-size",
        type=int,
        default=4,
        choices=[1, 4]
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
        "--auto-domain",
        action="store_true"
    )

    ap.add_argument(
        "--secret-bucket-width",
        type=int,
        default=1
    )

    ap.add_argument(
        "--n-perm",
        type=int,
        default=20000
    )

    ap.add_argument(
        "--no-permutation-fallback",
        action="store_true"
    )

    ap.add_argument(
        "--alpha",
        type=float,
        default=0.05,
        help="base significance level"
    )

    ap.add_argument(
        "--verbose",
        action="store_true"
    )

    args = ap.parse_args()

    # -------------------------------------------------------------
    # Load trials
    # -------------------------------------------------------------

    trials = load_trials(
        args.dist_dir
    )

    print(
        f"[i] loaded {len(trials)} trial pairs"
    )

    # -------------------------------------------------------------
    # Secret domain
    # -------------------------------------------------------------

    if args.auto_domain:

        secret_min, secret_max = (
            detect_domain(
                trials,
                args.secret_buf,
                args.secret_word_size,
                args.active_len
            )
        )

        print(
            f"[i] auto-detected secret domain "
            f"for '{args.secret_buf}': "
            f"[{secret_min}, {secret_max}]"
        )

    else:

        if (
            args.secret_min is None
            or args.secret_max is None
        ):

            sys.exit(
                "error: --secret-min and --secret-max "
                "are required unless --auto-domain "
                "is passed"
            )

        secret_min = args.secret_min
        secret_max = args.secret_max

    # -------------------------------------------------------------
    # Multiple-testing Ineffective
    # -------------------------------------------------------------

    alpha_corrected = (
        args.alpha / args.active_len
    )

    print(
        f"[i] corrected alpha = "
        f"{alpha_corrected:.6g}"
    )

    rng = np.random.default_rng(0)

    # -------------------------------------------------------------
    # Results
    # -------------------------------------------------------------

    results = []
    sample_correct, _ = trials[0]

    out_len = len(decode_words(
        get_buffer(sample_correct, args.out_buf), args.out_word_size
    ))
    secret_len = len(decode_words(
        get_buffer(sample_correct, args.secret_buf), args.secret_word_size
    ))

    safe_len = min(args.active_len, out_len, secret_len)

    if safe_len < args.active_len:
        print(
            f"[!] --active-len={args.active_len} exceeds available buffer "
            f"length (out_buf '{args.out_buf}' has {out_len} words, "
            f"secret_buf '{args.secret_buf}' has {secret_len} words); "
            f"clamping position loop to {safe_len}."
        )

    for pos in range(safe_len):

        # =========================================================
        # TEST 1:
        # Secret dependence of Ineffective event
        # =========================================================

        table = build_table(
            trials,
            args.secret_buf,
            pos,
            args.out_buf,
            args.active_len,
            pos,
            secret_min,
            secret_max,
            args.secret_word_size,
            args.out_word_size,
            bucket_width=args.secret_bucket_width
        )

        chi2, chi_p, chi_verdict = (
            dependence_test(
                table,
                alpha_corrected,
                use_permutation_fallback=(
                    not args.no_permutation_fallback
                ),
                n_perm=args.n_perm,
                rng=rng
            )
        )

        # =========================================================
        # TEST 2:
        # Numeric leakage through divergence magnitude
        # =========================================================

        group_zero, group_nonzero = (
            collect_leakage_samples(
                trials,
                args.secret_buf,
                pos,
                args.out_buf,
                args.active_len,
                pos,
                args.secret_word_size,
                args.out_word_size
            )
        )

        t_result = leakage_t_test(
            group_zero,
            group_nonzero,
            alpha_corrected
        )

        result = {
            "position": pos,

            # Ineffective dependence
            "chi2": chi2,
            "chi_p": chi_p,
            "chi_verdict": chi_verdict,

            # leakage
            "t": t_result["t"],
            "t_p": t_result["p"],
            "mean_hw_secret_zero":
                t_result["mean_zero"],
            "mean_hw_secret_nonzero":
                t_result["mean_nonzero"],
            "mean_difference":
                t_result.get(
                    "mean_difference"
                ),
            "n_secret_zero":
                t_result["n_zero"],
            "n_secret_nonzero":
                t_result["n_nonzero"],
            "t_verdict":
                t_result["verdict"],

            "table": table
        }

        results.append(result)

    # -------------------------------------------------------------
    # Print results
    # -------------------------------------------------------------

    for r in results:

        chi_flagged = (
            isinstance(
                r["chi_verdict"],
                str
            )
            and r["chi_verdict"].startswith(
                "secret-dependent"
            )
        )

        t_flagged = (
            r["t_verdict"]
            == "leakage detected"
        )

        settled_negative = (
            "no divergence observed"
            in str(r["chi_verdict"])
        )

        if (
            args.verbose
            or chi_flagged
            or t_flagged
            or not settled_negative
        ):

            print()
            print(
                "=" * 75
            )

            print(
                f"pos {r['position']}"
            )

            # -----------------------------------------------------
            # Ineffective dependence
            # -----------------------------------------------------

            print(
                f"  [Ineffective] "
                f"chi2={r['chi2']}, "
                f"p={r['chi_p']}, "
                f"verdict={r['chi_verdict']}"
            )

            # -----------------------------------------------------
            # Leakage
            # -----------------------------------------------------

            print(
                f"  [T-TEST] "
                f"t={r['t']}, "
                f"p={r['t_p']}, "
                f"verdict={r['t_verdict']}"
            )

            print(
                f"           "
                f"mean HW(delta) | secret=0     = "
                f"{r['mean_hw_secret_zero']}"
            )

            print(
                f"           "
                f"mean HW(delta) | secret!=0    = "
                f"{r['mean_hw_secret_nonzero']}"
            )

            print(
                f"           "
                f"difference                    = "
                f"{r['mean_difference']}"
            )

            print(
                f"           "
                f"N(secret=0)={r['n_secret_zero']}, "
                f"N(secret!=0)={r['n_secret_nonzero']}"
            )

            # -----------------------------------------------------
            # Table
            # -----------------------------------------------------

            if chi_flagged or args.verbose:

                bw = args.secret_bucket_width

                row_desc = (
                    f"secret "
                    f"{secret_min}..{secret_max}"
                    if bw == 1
                    else
                    f"secret "
                    f"{secret_min}..{secret_max} "
                    f"bucketed into width-{bw} bands"
                )

                print(
                    f"\n  Ineffective table "
                    f"(rows={row_desc}, "
                    f"cols=[delta==0, delta!=0]):"
                )

                print(
                    r["table"]
                )

            print(
                "=" * 75
            )