#!/usr/bin/env python3
"""ineffective_secret_dependence_test.py — tests whether P(faulty == correct)
depends on the secret's VALUE (full domain, not collapsed to a zero/nonzero
split), via a contingency test on a (secret_domain_size x 2) table. This is
R4 from the ineffective-fault procedure, generalized the same way as
correction_dependence_test.py: no assumption that "zero" is the relevant
secret boundary -- that's discovered from the data, not hardcoded."""

import argparse
import glob
import json
import sys
import numpy as np
from scipy.stats import chi2_contingency

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


def is_ineffective(c, f, out_buf="s", active_len=None):
    co = np.array(c["outputs"][out_buf])
    fo = np.array(f["outputs"][out_buf])
    if active_len is not None:
        co, fo = co[:active_len], fo[:active_len]
    return bool(np.array_equal(co, fo))


def build_table(trials, secret_buf, secret_pos, out_buf, active_len,
                 field_mod=FIELD_MOD):
    """
    Rows: full secret value domain [0, field_mod).
    Columns: [ineffective (faulty==correct), effective (faulty!=correct)].
    """
    table = np.zeros((field_mod, 2), dtype=int)
    for c, f in trials:
        secret_val = c["inputs"][secret_buf][secret_pos]
        ineff = is_ineffective(c, f, out_buf, active_len)
        col = 0 if ineff else 1
        table[secret_val, col] += 1
    return table


# ---------------------------------------------------------------------
# Exact / permutation-based test -- valid regardless of table sparsity.
# Same rationale as correction_dependence_test.py: a strong, clean
# dependence produces the sparsest tables, so this is what covers
# exactly the cases you most care about, not an edge case.
# ---------------------------------------------------------------------

def permutation_test_full_table(table, n_perm=20000, rng=None):
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
    p_value = (count_ge + 1) / (n_perm + 1)
    return observed_stat, p_value


def dependence_test(table, alpha, min_cell_count=5, use_permutation_fallback=True,
                     n_perm=20000, rng=None):
    """
    Three distinct outcomes, deliberately not conflated:
      - "always ineffective" / "always effective": the fault's
        effectiveness never varies at this position across any trial --
        this position is either fully masked or fully exposed regardless
        of secret value. Settled result; more data won't change it.
      - "secret-dependent" / "no dependence detected": a real test
        result, via chi-square when dense enough, permutation otherwise.
      - "insufficient distinct secret values sampled": needs more trials.
    """
    row_ok = table.sum(axis=1) > 0
    filtered = table[row_ok]

    if filtered.shape[0] < 2:
        return None, None, "insufficient distinct secret values sampled to test"

    ineff_total, eff_total = filtered[:, 0].sum(), filtered[:, 1].sum()
    if eff_total == 0:
        return None, None, (
            "always ineffective: faulty==correct on every trial at this "
            "position, regardless of secret value -- settled result, not "
            "an open question. (This position may simply be outside the "
            "fault's effect, or the fault is unconditionally masked here.)"
        )
    if ineff_total == 0:
        return None, None, (
            "always effective: faulty!=correct on every trial at this "
            "position, regardless of secret value -- settled result. "
            "Likely a plain DFA-effective site (see R1/R3), not a "
            "SIFA-style secret-dependent leak."
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


def scan_all_positions(trials, secret_buf, out_buf, active_len, n_positions, alpha,
                        use_permutation_fallback=True, n_perm=20000, rng=None):
    alpha_corrected = alpha / n_positions
    results = []
    for pos in range(n_positions):
        table = build_table(trials, secret_buf, pos, out_buf, active_len)
        chi2, p, verdict = dependence_test(
            table, alpha_corrected,
            use_permutation_fallback=use_permutation_fallback,
            n_perm=n_perm, rng=rng,
        )
        results.append({"position": pos, "chi2": chi2, "p": p, "verdict": verdict, "table": table})
    return results


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--dist-dir", required=True)
    ap.add_argument("--out-buf", default="s")
    ap.add_argument("--secret-buf", default="Vdec")
    ap.add_argument("--active-len", type=int, default=78)
    ap.add_argument("--n-perm", type=int, default=20000,
                     help="permutations for the sparse-table fallback test")
    ap.add_argument("--no-permutation-fallback", action="store_true",
                     help="disable permutation fallback; report sparse tables as inconclusive instead")
    ap.add_argument("--verbose", action="store_true",
                     help="print every position's result, not just flagged/interesting ones")
    args = ap.parse_args()

    trials = load_trials(args.dist_dir)
    print(f"[i] loaded {len(trials)} trial pairs")

    rng = np.random.default_rng(0)
    results = scan_all_positions(
        trials, args.secret_buf, args.out_buf, args.active_len, args.active_len,
        alpha=0.05, use_permutation_fallback=not args.no_permutation_fallback,
        n_perm=args.n_perm, rng=rng,
    )

    for r in results:
        v = r["verdict"] or ""
        flagged = v.startswith("secret-dependent")
        settled = v.startswith("always ineffective") or v.startswith("always effective")
        if flagged or (not settled) or args.verbose:
            print(f"pos {r['position']}: chi2={r['chi2']}, p={r['p']}, verdict={r['verdict']}")
            if flagged or args.verbose:
                print(f"    table (rows=secret 0..15, cols=[ineffective, effective]):\n{r['table']}")