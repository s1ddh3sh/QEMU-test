#!/usr/bin/env python3
"""correction_dependence_test.py — tests whether delta==0 vs delta!=0
depends on the secret buffer's VALUE (full domain, not collapsed to a
zero/nonzero split), via a contingency chi-square test on a
(secret_domain_size x 2) table. Generalizes across fault mechanisms
that don't necessarily hinge on a "was it zero" boundary -- the only
domain-specific assumption is what delta==0 means (equal output ->
no observable divergence), which is generic across functions."""

import argparse
import glob
import json
import sys
import numpy as np
from scipy.stats import chi2_contingency, fisher_exact

FIELD_MOD = 16


def load_trials(dist_dir):
    trials = []
    correct_paths = sorted(glob.glob(f"{dist_dir}/correct_trial*.json"))
    if not correct_paths:
        raise FileNotFoundError(f"No files matching '{dist_dir}/correct_trial*.json'")
    for cpath in correct_paths:
        seed = cpath.split("correct_trial")[1].split(".json")[0]
        fpath = f"{dist_dir}/faulty_trial{seed}.json"
        try:
            c, f = json.load(open(cpath)), json.load(open(fpath))
        except FileNotFoundError:
            continue
        if "inputs" not in c or "inputs" not in f:
            raise KeyError(f"{cpath} missing 'inputs' -- re-run collection with the patched driver")
        trials.append((c, f))
    if not trials:
        raise RuntimeError(f"No usable trial pairs in {dist_dir}")
    return trials


def compute_delta(c, f, out_buf="s", active_len=None):
    co, fo = np.array(c["outputs"][out_buf]), np.array(f["outputs"][out_buf])
    if active_len is not None:
        co, fo = co[:active_len], fo[:active_len]
    return np.bitwise_xor(co, fo)


def build_table(trials, secret_buf, secret_pos, out_buf, active_len, delta_pos,
                 field_mod=FIELD_MOD):
    """
    Rows: full secret value domain [0, field_mod).
    Columns: delta==0 vs delta!=0 (the only thing binarized).
    """
    table = np.zeros((field_mod, 2), dtype=int)  # col 0: delta==0, col 1: delta!=0
    for c, f in trials:
        secret_val = c["inputs"][secret_buf][secret_pos]
        delta = compute_delta(c, f, out_buf, active_len)
        col = 0 if delta[delta_pos] == 0 else 1
        table[secret_val, col] += 1
    return table

def build_table(trials, secret_buf, secret_pos, out_buf, active_len, delta_pos,
                 field_mod=FIELD_MOD):
    """
    Rows: full secret value domain [0, field_mod).
    Columns: delta==0 vs delta!=0 (the only thing binarized).
    """
    table = np.zeros((field_mod, 2), dtype=int)  # col 0: delta==0, col 1: delta!=0
    for c, f in trials:
        secret_val = c["inputs"][secret_buf][secret_pos]
        delta = compute_delta(c, f, out_buf, active_len)
        col = 0 if delta[delta_pos] == 0 else 1
        table[secret_val, col] += 1
    return table


# ---------------------------------------------------------------------
# Exact / permutation-based test -- valid regardless of table sparsity,
# used as a fallback when chi2_contingency's asymptotic approximation
# doesn't apply (min expected cell count too low). A strong deterministic
# leak actually produces the SPARSEST tables (see note in dependence_test),
# so this fallback is what covers exactly the cases you most care about.
# ---------------------------------------------------------------------

def permutation_test_full_table(table, n_perm=20000, rng=None):
    """
    Exact-ish test for a (field_mod x 2) table, valid regardless of
    sparsity. Null: secret value and delta==0/!=0 are independent.
    Statistic: chi-square-like distance, with its null distribution
    estimated by permutation instead of the chi-square asymptotic
    approximation -- so no min-expected-count requirement.
    """
    rng = rng or np.random.default_rng()
    obs_rows, obs_cols = [], []
    for r in range(table.shape[0]):
        for c in range(2):
            obs_rows += [r] * table[r, c]
            obs_cols += [c] * table[r, c]
    obs_rows, obs_cols = np.array(obs_rows), np.array(obs_cols)

    def stat(rows, cols):
        t = np.zeros_like(table)
        for r, c in zip(rows, cols):
            t[r, c] += 1
        row_t = t.sum(axis=1, keepdims=True)
        col_t = t.sum(axis=0, keepdims=True)
        n = t.sum()
        expected = row_t * col_t / n
        with np.errstate(divide="ignore", invalid="ignore"):
            contrib = np.where(expected > 0, (t - expected) ** 2 / expected, 0)
        return contrib.sum()

    observed_stat = stat(obs_rows, obs_cols)
    count_ge = 0
    for _ in range(n_perm):
        perm_cols = rng.permutation(obs_cols)
        if stat(obs_rows, perm_cols) >= observed_stat:
            count_ge += 1
    p_value = (count_ge + 1) / (n_perm + 1)  # +1 avoids p=0
    return observed_stat, p_value





def dependence_test(table, alpha, min_cell_count=5, use_permutation_fallback=True,
                     n_perm=20000, rng=None):
    """
    Drops secret values that were never sampled (empty rows), then tests
    independence between secret value and delta==0/!=0.

    Three distinct outcomes are possible, deliberately not conflated:
      - "no divergence observed": delta is constant (always 0) across
        every trial at this position -- this position is simply outside
        the fault's effect. More data will NOT change this conclusion;
        it's a settled negative result, not an open question.
      - "secret-dependent" / "no dependence detected": a real two-sided
        test result, via chi-square when the table is dense enough, or
        via permutation testing (exact regardless of sparsity) otherwise.
      - "insufficient distinct secret values sampled": fewer than 2
        secret values appeared at all -- genuinely needs more trials.
    """
    row_ok = table.sum(axis=1) > 0
    filtered = table[row_ok]

    if filtered.shape[0] < 2:
        return None, None, "insufficient distinct secret values sampled to test"

    col0_total, col1_total = filtered[:, 0].sum(), filtered[:, 1].sum()
    if col1_total == 0:
        return None, None, (
            "no divergence observed: delta==0 on every trial at this "
            "position -- this position is outside the fault's effect. "
            "This is a settled negative result; collecting more trials "
            "will not change it."
        )
    if col0_total == 0:
        return None, None, (
            "delta is NEVER 0 at this position -- every trial diverges "
            "regardless of secret value. Likely a globally effective "
            "(non-secret-dependent) fault at this position, not a leak "
            "-- check Test 1 / R1-R3 style classification separately."
        )

    row_totals = filtered.sum(axis=1, keepdims=True)
    col_totals = filtered.sum(axis=0, keepdims=True)
    expected = (row_totals * col_totals) / filtered.sum()

    if expected.min() < min_cell_count:
        if not use_permutation_fallback:
            return None, None, (
                f"table too sparse for a reliable chi-square (min expected "
                f"cell count {expected.min():.2f} < {min_cell_count}); "
                f"need more trials for this position"
            )
        stat, p = permutation_test_full_table(filtered, n_perm=n_perm, rng=rng)
        verdict = "secret-dependent" if p < alpha else "no dependence detected"
        return stat, p, f"{verdict} (permutation test, chi2 asymptotics invalid here)"

    chi2, p, dof, _ = chi2_contingency(filtered)
    return chi2, p, ("secret-dependent" if p < alpha else "no dependence detected")



def scan_all_positions(trials, secret_buf, out_buf, active_len, n_positions, alpha):
    alpha_corrected = alpha / n_positions
    results = []
    for pos in range(n_positions):
        table = build_table(trials, secret_buf, pos, out_buf, active_len, pos)
        chi2, p, verdict = dependence_test(table, alpha_corrected)
        results.append({"position": pos, "chi2": chi2, "p": p, "verdict": verdict, "table": table})
    return results

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--dist-dir", required=True)
    ap.add_argument("--out-buf", default="s")
    ap.add_argument("--secret-buf", default="Ox")
    ap.add_argument("--active-len", type=int, default=78)
    ap.add_argument("--n-perm", type=int, default=20000,
                     help="permutations for the sparse-table fallback test")
    ap.add_argument("--no-permutation-fallback", action="store_true",
                     help="disable permutation fallback; report sparse tables as inconclusive instead")
    ap.add_argument("--verbose", action="store_true",
                     help="print every position's result, not just flagged ones")
    args = ap.parse_args()

    trials = load_trials(args.dist_dir)
    print(f"[i] loaded {len(trials)} trial pairs")

    alpha_corrected = 0.05 / args.active_len
    rng = np.random.default_rng(0)

    results = []
    for pos in range(args.active_len):
        table = build_table(trials, args.secret_buf, pos, args.out_buf, args.active_len, pos)
        chi2, p, verdict = dependence_test(
            table, alpha_corrected,
            use_permutation_fallback=not args.no_permutation_fallback,
            n_perm=args.n_perm, rng=rng,
        )
        results.append({"position": pos, "chi2": chi2, "p": p, "verdict": verdict, "table": table})

    for r in results:
        v = r["verdict"] or ""
        flagged = v.startswith("secret-dependent")
        settled_negative = "no divergence observed" in v or "outside the fault" in v
        if flagged or (not settled_negative) or args.verbose:
            print(f"pos {r['position']}: chi2={r['chi2']}, p={r['p']}, verdict={r['verdict']}")
            if flagged or args.verbose:
                print(f"    table (rows=secret 0..15, cols=[delta==0, delta!=0]):\n{r['table']}")