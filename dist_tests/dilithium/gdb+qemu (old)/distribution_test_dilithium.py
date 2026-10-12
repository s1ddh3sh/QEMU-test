#!/usr/bin/env python3
"""
dist_test.py — two-sample distribution test over correct_trial*.json /
faulty_trial*.json populations produced by `collect_dist.py --mode
trials`.

This does NOT do exact-match (ineffective test) or repair-distance
(correction test) comparison. It asks a different question: does the
DISTRIBUTION of some feature of the output differ between the
correct-ELF population and the faulty-ELF population, when every input
(secrets, nonce, message, ...) is freshly randomized per trial? A fault
that always changes SOME bit of the output (so ineffective-fault
testing sees "always different") and always produces a value with no
small repair distance (so correction testing sees "unrepairable") can
still be a severe leak if the SHAPE of the output moves -- e.g. a
missing "+y" term collapses the output's magnitude by orders of
magnitude. That shift is exactly what this script looks for.

--------------------------------------------------------------------
IMPORTANT: what buffer are you actually testing?
--------------------------------------------------------------------
Everything below operates on an array of signed int32 Dilithium
coefficients. There are TWO different ways a witness output ends up
looking like that, and picking the wrong one silently produces
garbage statistics instead of an error:

  --decode raw_int32  (default, original behaviour)
      The output buffer IS already a flat array of int32_t
      coefficients, little-endian, 4 bytes each -- e.g. an intermediate
      "z" (polyvecl) buffer that was instrumented/dumped BEFORE
      packing. Use this when the witness's "length" for the buffer is
      exactly (num_polys * 256 * 4).

  --decode dilithium_sig_z
      The output buffer is the FINAL PACKED SIGNATURE ("sig" in
      pack_sig()'s layout: CTILDEBYTES=32 bytes of c~, followed by
      L polynomials of z each bit-packed to POLYZ_PACKEDBYTES bytes
      [576 for GAMMA1=2^17 (mode 2), 640 for GAMMA1=2^19 (modes 3/5)],
      followed by the packed hint). A packed z is NOT a byte-aligned
      int32 array -- it's 18 or 20 bits per coefficient with no byte
      boundary alignment -- so treating it as raw_int32 does not
      merely misalign the data, it doesn't parse as anything
      meaningful at all: reinterpreting ~2400 mostly-packed-looking
      bytes as int32 gives values uniformly scattered across the WHOLE
      32-bit range, and since every trial has ~600 such values, the
      per-trial max magnitude converges to very close to 2^31
      regardless of whether the run was faulted or not -- explaining
      why a raw_int32 pass over a packed "sig" buffer reports
      IDENTICAL median/mean/min/max for both populations and a
      trivial p=1.0: it isn't "no leak", it's not measuring z at all.
      This mode extracts the z-packed region and bit-unpacks it using
      the actual pqcrystals polyz_unpack algorithm (round-tripped
      against the reference packing scheme -- see the module-level
      polyz_pack_* helpers used only for that self-check) before
      running the same statistics used for raw_int32. It also
      truncates the buffer to CRYPTO_BYTES first, since witnesses that
      reuse "sig"'s backing memory as scratch space during signing
      (e.g. to hold the packed w1 while c~ is hashed) can allocate a
      buffer larger than the real signature -- any bytes beyond
      CRYPTO_BYTES are leftover scratch/padding, not part of the
      signature, and must not be fed into the unpacker.

Two independent feature families are implemented, matching the two
fault classes discussed for Dilithium signing:

  1. sup-norm  (--feature supnorm, default)
     feature(trial) = max_i |z[i]|  over every recovered coefficient
     (flattened across all L polynomials).

     Rationale: an honest z = y + c*s1 has coefficients roughly uniform
     over (-(GAMMA1-BETA), GAMMA1-BETA) (huge, e.g. +-131007 for mode
     2). A fault that drops the "+y" term (e.g. skipping
     polyvecl_add(&z, &z, &y)) leaves z = c*s1, whose coefficients are
     bounded by +-TAU*ETA (e.g. +-78 for mode 2) -- a ~1600x collapse
     in range. This is the test for the "whole term dropped" class of
     fault (safe-error zeroing, ineffective-fault-style skips that
     still verify-fail obviously, the polyvecl_add skip from this
     thread).

     Test: two-sample Kolmogorov-Smirnov (scipy.stats.ks_2samp) and
     Mann-Whitney U (scipy.stats.mannwhitneyu) on the per-trial
     sup-norm values, correct-population vs faulty-population. Both
     are distribution-shape tests that need no normality assumption --
     appropriate since z's marginal is triangular/uniform-ish, not
     Gaussian.

  2. pairwise-band  (--feature pairwise, requires --num-polys > 1)
     For each trial, group the recovered coefficients into L
     polynomials of N coefficients each and compute, for every
     unordered pair (i, i') of polynomials and every coefficient index
     j:
         small(i,i',j) = 1  if  (z[i,j] - z[i',j]) mod± q  in
                               [-2*TAU*ETA, 2*TAU*ETA]
                       = 0  otherwise
     feature(trial) = sum over all (i,i',j) of small(i,i',j)
                       (count out of nz = N*L*(L-1)/2 coordinates)

     Rationale: this is exactly the statistic behind the ElGhamrawy et
     al. countermeasure (Algorithm 2 in the paper) turned into a
     detector instead of a per-signature accept/reject gate. If
     y[i] == y[i'] for some pair (the equal-nonce / instruction-skip-
     in-ExpandMask fault), Delta_z = c*(s1[i]-s1[i']) for that pair,
     which lands in the small band with near-certainty across all N
     coordinates. An honest Delta_z = Delta_y + c*(s1[i]-s1[i']) is
     dominated by the huge Delta_y term and lands in that same band
     only with small background probability p0 (~1e-3, computed from
     TAU/ETA/GAMMA1). This is the test for the "two masks forced equal"
     class of fault (ElGhamrawy et al.'s nonce-increment skip), which
     the sup-norm test above CANNOT see, because the overall magnitude
     of z is untouched -- only the cross-polynomial difference
     collapses.

     Two verdicts are reported for this feature:
       a) per-trial count distribution: KS / Mann-Whitney on the
          per-trial small-coordinate counts, correct vs faulty.
       b) aggregated two-proportion test: pool every (i,i',j)
          coordinate-level small/not-small outcome across ALL trials
          within a population (nz * num_trials Bernoulli draws total)
          and run a two-proportion z-test comparing the pooled
          correct-population proportion to the pooled faulty-
          population proportion. Usually far more sensitive than (a)
          when num_trials is small.

Both features can be requested together (--feature both, default),
since they catch disjoint fault classes and are cheap to compute from
the same trial dump.

Requires: numpy, scipy  (pip install numpy scipy)

Usage (raw int32 buffer, e.g. an instrumented pre-pack z):
    python3 dist_test.py \
        --dir tests_dilithium/pqcrystals_dilithium2_ref_poly_add/dist_trials \
        --out-buf z --decode raw_int32 --dilithium-mode 2 --num-polys 4 \
        --feature both --alpha 1e-4

Usage (final packed signature buffer "sig"):
    python3 dist_test.py \
        --dir tests_dilithium/pqcrystals_dilithium2_ref_signature_internal/dist_trials \
        --out-buf sig --decode dilithium_sig_z --dilithium-mode 2 \
        --feature both --alpha 1e-4
"""

import argparse
import glob
import json
import math
import os
import sys

import numpy as np
from scipy.stats import ks_2samp, mannwhitneyu, norm

DILITHIUM_Q = 8380417
COEFF_BYTES = 4
DILITHIUM_N = 256
CTILDEBYTES = 32  # c~ length in pack_sig(), fixed across mode 2/3/5 in round-3 ref impl

# mode -> (K, L, ETA, TAU, BETA, GAMMA1, GAMMA2, OMEGA)
_MODE_PARAMS = {
    2: (4, 4, 2, 39, 78, 1 << 17, (DILITHIUM_Q - 1) // 88, 80),
    3: (6, 5, 4, 49, 196, 1 << 19, (DILITHIUM_Q - 1) // 32, 55),
    5: (8, 7, 2, 60, 120, 1 << 19, (DILITHIUM_Q - 1) // 32, 75),
}

# mode -> (CRYPTO_BYTES, POLYZ_PACKEDBYTES). Signature layout is
# c~ [CTILDEBYTES] || z [L * POLYZ_PACKEDBYTES] || h [OMEGA + K], and
# these two numbers cross-check against that sum for each mode:
#   mode2: 32 + 4*576 + 84 = 2420
#   mode3: 32 + 5*640 + 61 = 3293
#   mode5: 32 + 7*640 + 83 = 4595
_SIG_PARAMS = {
    2: (2420, 576),
    3: (3293, 640),
    5: (4595, 640),
}


# ---------------------------------------------------------------------------
# Decoding: raw_int32 (buffer IS a flat int32 coefficient array)
# ---------------------------------------------------------------------------

def bytes_to_int32_coeffs(byte_list):
    """Little-endian two's-complement int32_t decode, for a buffer
    that is genuinely a byte-aligned array of poly.coeffs (int32_t)."""
    n = len(byte_list) // COEFF_BYTES
    coeffs = np.empty(n, dtype=np.int64)
    for i in range(n):
        b0, b1, b2, b3 = byte_list[4 * i:4 * i + 4]
        val = b0 | (b1 << 8) | (b2 << 16) | (b3 << 24)
        if val & 0x80000000:
            val -= 0x100000000
        coeffs[i] = val
    return coeffs


# ---------------------------------------------------------------------------
# Decoding: dilithium_sig_z (buffer is the FINAL PACKED SIGNATURE --
# bit-unpack the z region using the real pqcrystals polyz_unpack).
# ---------------------------------------------------------------------------

def _polyz_unpack_18bit(a):
    """GAMMA1 == 2^17 (mode 2): 9 packed bytes -> 4 coefficients, 18
    bits each. Mirrors the reference polyz_unpack bit-for-bit; the
    inverse (polyz_pack) has been round-trip-tested against this."""
    GAMMA1 = 1 << 17
    n = (len(a) // 9) * 4
    coeffs = np.empty(n, dtype=np.int64)
    for i in range(len(a) // 9):
        b = a[9 * i:9 * i + 9]
        t0 = (b[0] | (b[1] << 8) | (b[2] << 16)) & 0x3FFFF
        t1 = ((b[2] >> 2) | (b[3] << 6) | (b[4] << 14)) & 0x3FFFF
        t2 = ((b[4] >> 4) | (b[5] << 4) | (b[6] << 12)) & 0x3FFFF
        t3 = ((b[6] >> 6) | (b[7] << 2) | (b[8] << 10)) & 0x3FFFF
        coeffs[4 * i + 0] = GAMMA1 - t0
        coeffs[4 * i + 1] = GAMMA1 - t1
        coeffs[4 * i + 2] = GAMMA1 - t2
        coeffs[4 * i + 3] = GAMMA1 - t3
    return coeffs


def _polyz_unpack_20bit(a):
    """GAMMA1 == 2^19 (modes 3/5): 5 packed bytes -> 2 coefficients, 20
    bits each. Mirrors the reference polyz_unpack bit-for-bit."""
    GAMMA1 = 1 << 19
    n = (len(a) // 5) * 2
    coeffs = np.empty(n, dtype=np.int64)
    for i in range(len(a) // 5):
        b = a[5 * i:5 * i + 5]
        t0 = (b[0] | (b[1] << 8) | (b[2] << 16)) & 0xFFFFF
        t1 = ((b[2] >> 4) | (b[3] << 4) | (b[4] << 12)) & 0xFFFFF
        coeffs[2 * i + 0] = GAMMA1 - t0
        coeffs[2 * i + 1] = GAMMA1 - t1
    return coeffs


def unpack_z_from_packed_sig(sig_bytes, dilithium_mode):
    """Extracts and bit-unpacks the z region of a final packed
    Dilithium signature (pack_sig() layout: c~ || z || h). Truncates to
    CRYPTO_BYTES first -- any bytes beyond that are scratch/padding in
    an over-sized buffer, not part of the real signature. Returns a
    flat array of L*256 signed coefficients (already in their true
    range, no further byte-decoding needed)."""
    K, L, ETA, TAU, BETA, GAMMA1, GAMMA2, OMEGA = _MODE_PARAMS[dilithium_mode]
    crypto_bytes, polyz_packedbytes = _SIG_PARAMS[dilithium_mode]

    if len(sig_bytes) < crypto_bytes:
        raise ValueError(
            f"sig buffer is only {len(sig_bytes)} bytes, need at least "
            f"CRYPTO_BYTES={crypto_bytes} for mode {dilithium_mode} to "
            f"contain a full signature -- wrong --dilithium-mode, or "
            f"--out-buf points at the wrong buffer?"
        )
    sig = sig_bytes[:crypto_bytes]

    z_region_len = L * polyz_packedbytes
    z_region = sig[CTILDEBYTES:CTILDEBYTES + z_region_len]
    if len(z_region) != z_region_len:
        raise ValueError(
            f"expected {z_region_len} bytes of packed z at offset "
            f"{CTILDEBYTES}, got {len(z_region)} -- CRYPTO_BYTES/"
            f"POLYZ_PACKEDBYTES table may not match this build."
        )

    unpack_fn = _polyz_unpack_18bit if GAMMA1 == (1 << 17) else _polyz_unpack_20bit
    polys = []
    for i in range(L):
        chunk = z_region[i * polyz_packedbytes:(i + 1) * polyz_packedbytes]
        polys.append(unpack_fn(chunk))
    return np.concatenate(polys)


# ---------------------------------------------------------------------------
# Shared trial loading / decoding
# ---------------------------------------------------------------------------

def load_trials(trial_dir, variant, out_buf):
    """Loads every {variant}_trial*.json in trial_dir, returns a list of
    raw output byte-lists for out_buf. Raises if a trial is missing the
    requested buffer -- a silently-skipped trial would quietly shrink
    the population and understate the test's real power."""
    paths = sorted(glob.glob(os.path.join(trial_dir, f"{variant}_trial*.json")))
    if not paths:
        raise SystemExit(
            f"[!] no {variant}_trial*.json files found in {trial_dir} -- "
            f"did you run collect_dist.py --mode trials on this dir?"
        )
    out = []
    for p in paths:
        with open(p) as f:
            trial = json.load(f)
        outputs = trial.get("outputs", {})
        if out_buf not in outputs:
            raise SystemExit(
                f"[!] {p} has no output buffer named {out_buf!r}. "
                f"Available output buffers: {sorted(outputs.keys())}. "
                f"Check --out-buf against qemu_witness.json's layout."
            )
        out.append(outputs[out_buf])
    return out


def decode_trials(raw_trials, decode, dilithium_mode):
    """Decodes every trial's raw byte list into a flat int64 coefficient
    array, using the selected decode strategy. This is the ONLY place
    that needs to know about raw_int32 vs dilithium_sig_z -- everything
    downstream just sees numpy coefficient arrays."""
    if decode == "raw_int32":
        return [bytes_to_int32_coeffs(raw) for raw in raw_trials]
    elif decode == "dilithium_sig_z":
        return [unpack_z_from_packed_sig(raw, dilithium_mode) for raw in raw_trials]
    else:
        raise ValueError(f"unknown decode mode: {decode!r}")


def mod_pm(x, q):
    """Vectorized z mod± q: result in (-q/2, q/2]."""
    r = np.mod(x, q)
    r = np.where(r > q // 2, r - q, r)
    return r


# ---------------------------------------------------------------------------
# Feature 1: sup-norm
# ---------------------------------------------------------------------------

def supnorm_features(coeff_arrays, q):
    """feature(trial) = max_i |coeffs[i] mod± q|, over the whole
    decoded coefficient array (all polynomials concatenated)."""
    feats = []
    for coeffs in coeff_arrays:
        feats.append(int(np.max(np.abs(mod_pm(coeffs, q)))))
    return np.array(feats, dtype=np.int64)


def run_supnorm_test(correct_coeffs, faulty_coeffs, q, alpha):
    c_feat = supnorm_features(correct_coeffs, q)
    f_feat = supnorm_features(faulty_coeffs, q)

    ks_stat, ks_p = ks_2samp(c_feat, f_feat)
    mwu_stat, mwu_p = mannwhitneyu(c_feat, f_feat, alternative="two-sided")

    print("\n=== sup-norm test: max|z| per trial ===")
    print(f"  correct: N={len(c_feat)}  median={np.median(c_feat):.0f}  "
          f"mean={np.mean(c_feat):.1f}  min={c_feat.min()}  max={c_feat.max()}")
    print(f"  faulty:  N={len(f_feat)}  median={np.median(f_feat):.0f}  "
          f"mean={np.mean(f_feat):.1f}  min={f_feat.min()}  max={f_feat.max()}")
    print(f"  KS:            statistic={ks_stat:.4f}  p={ks_p:.3e}")
    print(f"  Mann-Whitney:  statistic={mwu_stat:.1f}  p={mwu_p:.3e}")

    flagged = (ks_p < alpha) or (mwu_p < alpha)
    print(f"  VERDICT: {'LEAK (distributions differ)' if flagged else 'no significant difference'} "
          f"at alpha={alpha:.0e}")
    return flagged, {"ks_p": ks_p, "mwu_p": mwu_p,
                      "correct_median": float(np.median(c_feat)),
                      "faulty_median": float(np.median(f_feat))}


# ---------------------------------------------------------------------------
# Feature 2: pairwise band-count (ElGhamrawy-style Delta_z statistic)
# ---------------------------------------------------------------------------

def pairwise_band_counts(coeff_arrays, q, num_polys, tau, eta):
    """Per trial, returns (small_count, total_coords) where total_coords
    = N * L*(L-1)/2 and small_count is the number of (i,i',j) triples
    with (z[i,j]-z[i',j]) mod± q inside [-2*tau*eta, 2*tau*eta]."""
    band = 2 * tau * eta
    per_trial_counts = []
    total_coords = None
    for coeffs in coeff_arrays:
        if len(coeffs) % num_polys != 0:
            raise ValueError(
                f"decoded coefficient array has length {len(coeffs)}, not "
                f"divisible by --num-polys={num_polys}. If you're testing "
                f"--decode dilithium_sig_z, --num-polys should be L for "
                f"the chosen --dilithium-mode (4/5/7) and is inferred "
                f"automatically unless overridden -- check you didn't "
                f"pass an explicit --num-polys that doesn't match."
            )
        n = len(coeffs) // num_polys
        polys = coeffs.reshape(num_polys, n)
        small = 0
        pairs = 0
        for i in range(num_polys):
            for ip in range(i + 1, num_polys):
                diff = mod_pm(polys[i] - polys[ip], q)
                small += int(np.sum(np.abs(diff) <= band))
                pairs += n
        per_trial_counts.append(small)
        total_coords = pairs
    return np.array(per_trial_counts, dtype=np.int64), total_coords


def two_proportion_ztest(count1, n1, count2, n2):
    p1 = count1 / n1
    p2 = count2 / n2
    p_pool = (count1 + count2) / (n1 + n2)
    se = math.sqrt(p_pool * (1 - p_pool) * (1 / n1 + 1 / n2))
    if se == 0:
        return float("inf") if p1 != p2 else 0.0, 0.0 if p1 != p2 else 1.0, p1, p2
    z = (p1 - p2) / se
    p_value = 2 * (1 - norm.cdf(abs(z)))
    return z, p_value, p1, p2


def run_pairwise_test(correct_coeffs, faulty_coeffs, q, num_polys, tau, eta, alpha):
    c_counts, nz = pairwise_band_counts(correct_coeffs, q, num_polys, tau, eta)
    f_counts, _ = pairwise_band_counts(faulty_coeffs, q, num_polys, tau, eta)

    print(f"\n=== pairwise-band test: |z[i]-z[i']| in [-2*tau*eta, 2*tau*eta] ===")
    print(f"  band = +-{2 * tau * eta}, coordinates per trial nz={nz}")

    # (a) per-trial count distribution
    ks_stat, ks_p = ks_2samp(c_counts, f_counts)
    mwu_stat, mwu_p = mannwhitneyu(c_counts, f_counts, alternative="two-sided")
    print(f"  per-trial counts -- correct: median={np.median(c_counts):.0f}/{nz}  "
          f"faulty: median={np.median(f_counts):.0f}/{nz}")
    print(f"  per-trial KS:            statistic={ks_stat:.4f}  p={ks_p:.3e}")
    print(f"  per-trial Mann-Whitney:  statistic={mwu_stat:.1f}  p={mwu_p:.3e}")

    # (b) aggregated two-proportion test, pooling every coordinate as a
    # Bernoulli draw -- far more sensitive than (a) at small N.
    c_total = int(np.sum(c_counts))
    f_total = int(np.sum(f_counts))
    n1 = nz * len(c_counts)
    n2 = nz * len(f_counts)
    z, p_value, p1, p2 = two_proportion_ztest(c_total, n1, f_total, n2)
    print(f"  aggregated proportions -- correct: {p1:.6f} ({c_total}/{n1})  "
          f"faulty: {p2:.6f} ({f_total}/{n2})")
    print(f"  two-proportion z-test:   z={z:.2f}  p={p_value:.3e}")

    flagged = (ks_p < alpha) or (mwu_p < alpha) or (p_value < alpha)
    print(f"  VERDICT: {'LEAK (distributions differ)' if flagged else 'no significant difference'} "
          f"at alpha={alpha:.0e}")
    return flagged, {"ks_p": ks_p, "mwu_p": mwu_p, "prop_p": p_value,
                      "correct_prop": p1, "faulty_prop": p2}


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dir", required=True,
                     help="directory containing correct_trial*.json / "
                          "faulty_trial*.json from collect_dist.py --mode trials")
    ap.add_argument("--out-buf", required=True,
                     help="name of the output buffer to test, as it "
                          "appears in qemu_witness.json's layout / the "
                          "trial JSON's 'outputs' dict (e.g. 'z' or 'sig')")
    ap.add_argument("--decode", choices=("raw_int32", "dilithium_sig_z"),
                     default="raw_int32",
                     help="'raw_int32' (default): out-buf IS a flat "
                          "byte-aligned int32 coefficient array (e.g. an "
                          "instrumented pre-pack z). 'dilithium_sig_z': "
                          "out-buf is the FINAL PACKED SIGNATURE -- bit-"
                          "unpack its z region first. See module "
                          "docstring; picking the wrong one silently "
                          "produces meaningless (not obviously broken) "
                          "statistics rather than an error.")
    ap.add_argument("--dilithium-mode", type=int, default=2, choices=(2, 3, 5))
    ap.add_argument("--num-polys", type=int, default=None,
                     help="number of polynomials the decoded coefficient "
                          "array is a concatenation of (e.g. L=4 for z at "
                          "mode 2). Required for --feature pairwise/both; "
                          "ignored for --feature supnorm. Defaults to L "
                          "for the chosen --dilithium-mode if not given "
                          "-- correct for both --decode modes.")
    ap.add_argument("--feature", choices=("supnorm", "pairwise", "both"),
                     default="both")
    ap.add_argument("--alpha", type=float, default=1e-4,
                     help="p-value threshold for flagging a leak "
                          "(default: %(default)s). Lower this (e.g. 1e-6) "
                          "if you're running many sites and want to "
                          "control false-positive rate across the sweep.")
    args = ap.parse_args()

    K, L, ETA, TAU, BETA, GAMMA1, GAMMA2, OMEGA = _MODE_PARAMS[args.dilithium_mode]
    num_polys = args.num_polys if args.num_polys is not None else L

    correct_raw = load_trials(args.dir, "correct", args.out_buf)
    faulty_raw = load_trials(args.dir, "faulty", args.out_buf)

    if len(correct_raw) != len(faulty_raw):
        print(f"[!] warning: {len(correct_raw)} correct trials vs "
              f"{len(faulty_raw)} faulty trials -- unequal populations "
              f"still work for these tests, but check for silently "
              f"dropped trials before trusting the result.")

    print(f"[i] loaded {len(correct_raw)} correct / {len(faulty_raw)} faulty "
          f"trials from {args.dir}, out-buf={args.out_buf!r}, "
          f"decode={args.decode!r}, DILITHIUM_MODE={args.dilithium_mode} "
          f"(ETA={ETA}, TAU={TAU}, GAMMA1={GAMMA1})")
    if args.decode == "dilithium_sig_z":
        crypto_bytes, polyz_packedbytes = _SIG_PARAMS[args.dilithium_mode]
        print(f"[i] treating {args.out_buf!r} as a packed signature: "
              f"truncating to CRYPTO_BYTES={crypto_bytes}, extracting "
              f"{num_polys}*{polyz_packedbytes} packed z bytes at offset "
              f"CTILDEBYTES={CTILDEBYTES}, bit-unpacking to "
              f"{num_polys}*{DILITHIUM_N} signed coefficients.")

    correct_coeffs = decode_trials(correct_raw, args.decode, args.dilithium_mode)
    faulty_coeffs = decode_trials(faulty_raw, args.decode, args.dilithium_mode)

    any_flagged = False

    if args.feature in ("supnorm", "both"):
        flagged, _ = run_supnorm_test(correct_coeffs, faulty_coeffs, DILITHIUM_Q, args.alpha)
        any_flagged = any_flagged or flagged

    if args.feature in ("pairwise", "both"):
        if num_polys < 2:
            print(f"\n[!] skipping pairwise-band test: --num-polys={num_polys} "
                  f"< 2, no polynomial pairs to compare.")
        else:
            flagged, _ = run_pairwise_test(correct_coeffs, faulty_coeffs, DILITHIUM_Q,
                                            num_polys, TAU, ETA, args.alpha)
            any_flagged = any_flagged or flagged

    print(f"\n[i] overall: {'LEAK DETECTED' if any_flagged else 'no leak detected'}")
    sys.exit(1 if any_flagged else 0)


if __name__ == "__main__":
    main()