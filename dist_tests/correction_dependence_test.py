#!/usr/bin/env python3
"""correction_dependence_test.py — tests whether delta==0 vs delta!=0
depends on the secret buffer's VALUE (full domain, not collapsed to a
zero/nonzero split), via a contingency chi-square test on a
(secret_domain_size x 2) table. Generalizes across fault mechanisms
that don't necessarily hinge on a "was it zero" boundary -- the only
domain-specific assumption is what delta==0 means (equal output ->
no observable divergence), which is generic across functions.

PATCHED:
  - reads secret_buf / out_buf from the "captured" section (where
    locals like s1/s2/w1/w0 actually live), falling back to "inputs"
    for driver-written pointer args (sk/rnd/m/etc).
  - decodes int32-coefficient buffers (4 little-endian bytes/entry)
    instead of indexing raw bytes, controlled by --secret-word-size /
    --out-word-size (default 4, matching int32_t coeffs[]; pass 1 for
    genuine byte buffers like sk/sig).
  - secret domain is no longer hardcoded to [0,16). --secret-min /
    --secret-max define the row range (e.g. -2..2 for Dilithium eta=2,
    or leave as auto-detected from the observed data with --auto-domain).
"""

import argparse
import glob
import json
import struct
import sys
import numpy as np
from scipy.stats import chi2_contingency, fisher_exact

DEFAULT_FIELD_MOD = 16


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
        # PATCHED: accept trials in any of the schemas this codebase
        # produces -- "captured"/"inputs"/"pre_transform"
        # (driver_internal_capture.py, used for Dilithium) or "outputs"
        # (older driver_dist.py schema, used for Mayo). Require at
        # least one so we still catch genuinely broken/empty trial files.
        schema_keys = ("captured", "inputs", "outputs", "pre_transform")
        if not any(k in c for k in schema_keys):
            raise KeyError(f"{cpath} has none of {schema_keys} -- corrupt or wrong-format trial file")
        if not any(k in f for k in schema_keys):
            raise KeyError(f"{fpath} has none of {schema_keys} -- corrupt or wrong-format trial file")
        trials.append((c, f))
    if not trials:
        raise RuntimeError(f"No usable trial pairs in {dist_dir}")
    return trials


def get_buffer(trial_record, buf_name):
    """Look up buf_name across every schema this codebase's trial files
    use, in order:
      - "pre_transform" -- driver_internal_capture.py's pre-transform
                            captures (e.g. s1_pre_ntt/s2_pre_ntt: the
                            RAW eta-bounded secret, captured before an
                            in-place transform like NTT mutates it)
      - "captured"      -- driver_internal_capture.py's locals as they
                            stand at function return (Dilithium:
                            s1/s2/w1/w0/y/z/t0/h/cp -- NOTE these are
                            POST-transform if the FUT applies one, e.g.
                            s1/s2 here are NTT-domain, not the raw key)
      - "inputs"        -- driver_internal_capture.py's driver-written
                            pointer args (Dilithium: sk/rnd/m/pre/sig)
      - "outputs"       -- the older driver_dist.py/calibrate.py schema
                            used by Mayo trials (e.g. buffer 's')
    Different collection scripts produced different trial-file shapes,
    so this checks all four rather than assuming one. Raises KeyError
    listing every section's keys if absent from all of them, instead of
    a bare KeyError on one guessed location.

    IMPORTANT: if a label exists in BOTH pre_transform (e.g.
    "s1_pre_ntt") and captured (e.g. "s1"), these are DIFFERENT names
    and both remain independently addressable -- pre_transform is
    checked first only so that if you ever reuse the same name in both
    sections, the raw pre-transform value wins. In practice always use
    distinct labels (as in the example spec) to avoid relying on this
    precedence at all.
    """
    pre_transform = trial_record.get("pre_transform", {})
    if buf_name in pre_transform and pre_transform[buf_name] is not None:
        return pre_transform[buf_name]
    captured = trial_record.get("captured", {})
    if buf_name in captured and captured[buf_name] is not None:
        return captured[buf_name]
    inputs = trial_record.get("inputs", {})
    if buf_name in inputs:
        return inputs[buf_name]
    outputs = trial_record.get("outputs", {})
    if buf_name in outputs:
        return outputs[buf_name]
    raise KeyError(
        f"'{buf_name}' not found in trial's pre_transform, captured, "
        f"inputs, or outputs. "
        f"pre_transform keys: {sorted(pre_transform.keys())}, "
        f"captured keys: {sorted(captured.keys())}, "
        f"inputs keys: {sorted(inputs.keys())}, "
        f"outputs keys: {sorted(outputs.keys())}"
    )


def decode_words(byte_list, word_size):
    """word_size=1 -> raw bytes as-is (unsigned 0-255, matches sk/sig/m).
    word_size=4 -> little-endian signed int32 per group of 4 bytes
    (matches int32_t coeffs[] buffers: s1, s2, y, z, t0, w1, w0, h, cp)."""
    if word_size == 1:
        return list(byte_list)
    if word_size == 4:
        if len(byte_list) % 4 != 0:
            raise ValueError(
                f"buffer length {len(byte_list)} not divisible by 4 -- "
                f"not a valid int32 array; pass --*-word-size 1 if this "
                f"buffer is actually raw bytes"
            )
        n = len(byte_list) // 4
        return list(struct.unpack(f"<{n}i", bytes(byte_list)))
    raise ValueError(f"unsupported word_size {word_size} (use 1 or 4)")


def compute_delta(c, f, out_buf, active_len, word_size):
    co = np.array(decode_words(get_buffer(c, out_buf), word_size))
    fo = np.array(decode_words(get_buffer(f, out_buf), word_size))
    if active_len is not None:
        co, fo = co[:active_len], fo[:active_len]
    return np.bitwise_xor(co.astype(np.int64), fo.astype(np.int64))


def build_table(trials, secret_buf, secret_pos, out_buf, active_len, delta_pos,
                 secret_min, secret_max, secret_word_size, out_word_size,
                 bucket_width=1):
    """
    Rows: secret value domain [secret_min, secret_max] (inclusive),
    offset internally so row 0 == secret_min, then optionally coarsened
    into buckets of `bucket_width` consecutive values each (row =
    (secret_val - secret_min) // bucket_width). Columns: delta==0 vs
    delta!=0 (the only thing binarized).

    bucket_width > 1 trades resolution for statistical power: with a
    domain far larger than the trial count (e.g. y's ~262144-value
    range), per-integer rows would almost never repeat across trials,
    making the test structurally powerless (see the s1-NTT-domain
    failure mode). Bucketing asks a coarser but still meaningful
    question -- does the secret's approximate value/band predict
    correction, rather than its exact value.
    """
    field_mod = secret_max - secret_min + 1
    n_buckets = (field_mod + bucket_width - 1) // bucket_width
    table = np.zeros((n_buckets, 2), dtype=int)  # col 0: delta==0, col 1: delta!=0
    for c, f in trials:
        secret_words = decode_words(get_buffer(c, secret_buf), secret_word_size)
        secret_val = secret_words[secret_pos]
        if not (secret_min <= secret_val <= secret_max):
            raise ValueError(
                f"secret value {secret_val} at position {secret_pos} in "
                f"buffer '{secret_buf}' is outside declared domain "
                f"[{secret_min}, {secret_max}]. Either the domain bounds "
                f"are wrong for this buffer (e.g. this is NTT-domain data, "
                f"not the raw eta-bounded secret), or the wrong buffer/"
                f"word-size was given."
            )
        row = (secret_val - secret_min) // bucket_width
        delta = compute_delta(c, f, out_buf, active_len, out_word_size)
        col = 0 if delta[delta_pos] == 0 else 1
        table[row, col] += 1
    return table


def detect_domain(trials, secret_buf, secret_word_size, n_positions):
    """Scan all trials/positions to find the observed min/max of the
    secret buffer, for --auto-domain. Useful when you don't already
    know the buffer's exact range (e.g. unsure if s1 is pre- or
    post-NTT)."""
    lo, hi = None, None
    for c, _ in trials:
        words = decode_words(get_buffer(c, secret_buf), secret_word_size)
        words = words[:n_positions]
        wmin, wmax = min(words), max(words)
        lo = wmin if lo is None else min(lo, wmin)
        hi = wmax if hi is None else max(hi, wmax)
    return lo, hi


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


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--dist-dir", required=True)
    ap.add_argument("--out-buf", default="s")
    ap.add_argument("--secret-buf", default="Ox")
    ap.add_argument("--active-len", type=int, default=78,
                     help="number of coefficient/byte positions to sweep "
                          "(coefficient count if word-size=4, byte count if word-size=1)")
    ap.add_argument("--secret-word-size", type=int, default=4, choices=[1, 4],
                     help="4 for int32 coefficient arrays (s1/s2/y/z/w1/w0/t0/h/cp), "
                          "1 for raw byte buffers (sk/sig/m/rnd/pre)")
    ap.add_argument("--out-word-size", type=int, default=4, choices=[1, 4],
                     help="same as --secret-word-size but for --out-buf")
    ap.add_argument("--secret-min", type=int, default=None,
                     help="minimum value of the secret domain, inclusive "
                          "(e.g. -2 for Dilithium eta=2). Required unless --auto-domain.")
    ap.add_argument("--secret-max", type=int, default=None,
                     help="maximum value of the secret domain, inclusive "
                          "(e.g. 2 for Dilithium eta=2). Required unless --auto-domain.")
    ap.add_argument("--auto-domain", action="store_true",
                     help="infer --secret-min/--secret-max from the observed "
                          "data instead of requiring them explicitly. Use "
                          "when unsure of the buffer's actual range (e.g. "
                          "unsure if a poly is pre- or post-NTT).")
    ap.add_argument("--secret-bucket-width", type=int, default=1,
                     help="coarsen the secret domain into buckets of this "
                          "many consecutive values each, trading resolution "
                          "for statistical power. Use for large-domain "
                          "buffers (e.g. y's ~262144-value range) where "
                          "per-integer rows would almost never repeat "
                          "across trials. Default 1 = no bucketing "
                          "(original per-value behavior).")
    ap.add_argument("--n-perm", type=int, default=20000,
                     help="permutations for the sparse-table fallback test")
    ap.add_argument("--no-permutation-fallback", action="store_true",
                     help="disable permutation fallback; report sparse tables as inconclusive instead")
    ap.add_argument("--verbose", action="store_true",
                     help="print every position's result, not just flagged ones")
    args = ap.parse_args()

    trials = load_trials(args.dist_dir)
    print(f"[i] loaded {len(trials)} trial pairs")

    if args.auto_domain:
        secret_min, secret_max = detect_domain(
            trials, args.secret_buf, args.secret_word_size, args.active_len
        )
        print(f"[i] auto-detected secret domain for '{args.secret_buf}': "
              f"[{secret_min}, {secret_max}]")
    else:
        if args.secret_min is None or args.secret_max is None:
            sys.exit(
                "error: --secret-min and --secret-max are required unless "
                "--auto-domain is passed. For Dilithium2 eta=2 secret polys "
                "(pre-NTT), that's --secret-min -2 --secret-max 2. If s1/s2 "
                "were captured post-NTT (check: are values full-range, e.g. "
                "in the millions, rather than -2..2?), use --auto-domain "
                "instead since the NTT-domain range isn't a small fixed constant."
            )
        secret_min, secret_max = args.secret_min, args.secret_max

    alpha_corrected = 0.05 / args.active_len
    rng = np.random.default_rng(0)

    results = []
    for pos in range(args.active_len):
        table = build_table(
            trials, args.secret_buf, pos, args.out_buf, args.active_len, pos,
            secret_min, secret_max, args.secret_word_size, args.out_word_size,
            bucket_width=args.secret_bucket_width,
        )
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
                bw = args.secret_bucket_width
                row_desc = (f"secret {secret_min}..{secret_max}" if bw == 1
                            else f"secret {secret_min}..{secret_max} bucketed "
                                 f"into width-{bw} bands")
                print(f"    table (rows={row_desc}, cols=[delta==0, delta!=0]):\n{r['table']}")