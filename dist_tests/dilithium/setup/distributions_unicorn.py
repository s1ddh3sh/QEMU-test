#!/usr/bin/env python3
"""distributions_unicorn.py (dilithium) — pure-Python distribution-aware
sampling helpers, ported VERBATIM from dist_tests/dilithium/setup/driver_dist.py
(same file, lines defining DILITHIUM_Q..._is_coeff_shaped). These functions
have zero gdb dependency in the original either -- this is a straight
copy-paste so the Unicorn-based collector (collect_dist_unicorn.py) can use
the identical sampling logic without importing the gdb-batch-mode driver
module (which fails to import outside gdb's embedded Python).

Do not hand-edit the sampling math here without also updating
driver_dist.py, and vice versa -- they must stay behaviourally identical
for the real-QEMU and Unicorn backends to produce comparable trial
populations.
"""

import os
import re


def random_fill(rng, field_mod, length):
    return [rng.randrange(field_mod) for _ in range(length)]


DILITHIUM_Q = 8380417
DILITHIUM_N = 256
DILITHIUM_D = 13

# mode -> (K, L, ETA, TAU, BETA, GAMMA1, GAMMA2, OMEGA)
_MODE_PARAMS = {
    2: (4, 4, 2, 39, 78, 1 << 17, (DILITHIUM_Q - 1) // 88, 80),
    3: (6, 5, 4, 49, 196, 1 << 19, (DILITHIUM_Q - 1) // 32, 55),
    5: (8, 7, 2, 60, 120, 1 << 19, (DILITHIUM_Q - 1) // 32, 75),
}

DILITHIUM_MODE = int(os.environ.get("GDB_DRIVER_DILITHIUM_MODE", "2"))
if DILITHIUM_MODE not in _MODE_PARAMS:
    print(f"[!] unknown DILITHIUM_MODE {DILITHIUM_MODE}, falling back to 2")
    DILITHIUM_MODE = 2

(DIL_K, DIL_L, ETA, TAU, BETA, GAMMA1, GAMMA2, OMEGA) = _MODE_PARAMS[DILITHIUM_MODE]

# Coefficients are int32_t, unlike Kyber's int16_t -- FOUR bytes each.
COEFF_BYTES = 4


# ---------------------------------------------------------------------------
# Dilithium distribution-aware sampling (collect mode only -- see module
# docstring; probe mode always uses plain random_fill above).
# ---------------------------------------------------------------------------

def _int32_le(val):
    """Two's-complement little-endian encoding of a signed value, as
    used for poly.coeffs[i] (int32_t) throughout the reference impl."""
    val &= 0xFFFFFFFF
    return [val & 0xFF, (val >> 8) & 0xFF, (val >> 16) & 0xFF, (val >> 24) & 0xFF]


def _pack(coeffs):
    out = []
    for c in coeffs:
        out.extend(_int32_le(c))
    return out


def _sample_uniform_eta(rng, n_coeffs):
    """Uniform in [-ETA, ETA] -- the s1/s2 secret distribution. The
    reference implementation reaches it by rejection sampling from
    SHAKE output (poly_uniform_eta); the resulting marginal is uniform,
    which is what matters for a random test buffer."""
    return _pack([rng.randrange(-ETA, ETA + 1) for _ in range(n_coeffs)])


def _sample_poly_mod_q(rng, n_coeffs):
    """Uniform coefficient in [0, Q). Used for every plain
    coefficient/NTT/matrix 'poly'/'polyvec' distribution where the
    exact reduction domain isn't load-bearing for a random test buffer
    -- see the table below for the ones that intentionally use a
    signed range instead."""
    return _pack([rng.randrange(0, DILITHIUM_Q) for _ in range(n_coeffs)])


def _sample_poly_signed(rng, n_coeffs, bound):
    """Uniform signed int32 in [-bound, bound]. Used for Montgomery-
    domain and 'reduced' polynomials, whose valid range is wider than
    (Montgomery) or narrower than (reduced) plain [0, Q) -- exact
    bounds aren't load-bearing here, only "plausibly in-domain, signed"
    is."""
    return _pack([rng.randrange(-bound, bound + 1) for _ in range(n_coeffs)])


def _sample_poly_gamma1(rng, n_coeffs):
    """The masking vector y: uniform in (-GAMMA1, GAMMA1], matching
    poly_uniform_gamma1's output range."""
    return _pack([rng.randrange(-GAMMA1 + 1, GAMMA1 + 1) for _ in range(n_coeffs)])


def _sample_poly_w1(rng, n_coeffs):
    """High bits w1 out of decompose(): coefficients in
    [0, (Q-1)/(2*GAMMA2)) -- 44 values for mode 2's GAMMA2=(Q-1)/88,
    16 for modes 3/5."""
    hi = (DILITHIUM_Q - 1) // (2 * GAMMA2)
    return _pack([rng.randrange(0, hi) for _ in range(n_coeffs)])


def _sample_challenge(rng, n_coeffs):
    """The challenge c: exactly TAU coefficients are +-1, the rest 0
    (poly_challenge). Sparsity is the load-bearing property here -- a
    dense random poly would take c*s1 wildly out of the bounds every
    caller assumes."""
    coeffs = [0] * n_coeffs
    if n_coeffs:
        for idx in rng.sample(range(n_coeffs), min(TAU, n_coeffs)):
            coeffs[idx] = 1 if rng.randrange(2) else -1
    return _pack(coeffs)


def _sample_hint(rng, n_coeffs):
    """The hint vector h: 0/1 coefficients with at most OMEGA ones
    across the WHOLE vector. Sampled over the buffer's full coefficient
    count (which is the whole polyveck when the buffer is one), so the
    OMEGA budget is respected globally rather than per-poly."""
    coeffs = [0] * n_coeffs
    if n_coeffs:
        budget = min(OMEGA, n_coeffs)
        n_ones = rng.randrange(budget + 1)
        for idx in rng.sample(range(n_coeffs), n_ones):
            coeffs[idx] = 1
    return _pack(coeffs)


def _sample_poly_t0(rng, n_coeffs):
    """t0 (low bits of t out of power2round): coefficients in
    (-2^(D-1), 2^(D-1)]."""
    half = 1 << (DILITHIUM_D - 1)
    return _pack([rng.randrange(-half + 1, half + 1) for _ in range(n_coeffs)])


def _sample_poly_t1(rng, n_coeffs):
    """t1 (high bits of t out of power2round): coefficients in
    [0, 2^10), which is what polyt1_pack assumes."""
    return _pack([rng.randrange(0, 1 << 10) for _ in range(n_coeffs)])


def _sample_raw_bytes(rng, n_bytes):
    return [rng.randrange(256) for _ in range(n_bytes)]


# dist string (exactly as written by trace.h's TRACE_DISTRIBUTION /
# TRACE_DISTRIBUTION_IN calls) -> (kind, extra).
#
# Keys are matched case-insensitively with whitespace collapsed (see
# _normalize below), and a trailing " poly"/" polynomial"/" polyvec"/
# " polyveck"/" polyvecl"/" vector"/" matrix" qualifier is stripped as a
# fallback: the coefficient COUNT already falls out of the buffer's
# declared byte length, so "..., NTT domain" and "..., NTT domain
# polyvec" want identical per-coefficient sampling. Anything still
# unmatched falls back to a plain uniform [0, field_mod) fill and prints
# a warning once -- an unrecognized string is much more likely a typo or
# a distribution that needs adding here than an intentional raw fill.
_DISTRIBUTION_TABLE = {
    # --- secrets s1/s2 -------------------------------------------------
    "uniform in [-eta, eta]": ("uniform_eta", None),
    "uniform in [-eta,eta]": ("uniform_eta", None),
    "secret key polynomial, uniform in [-eta, eta]": ("uniform_eta", None),
    "centered binomial distribution, eta": ("uniform_eta", None),

    # --- generic R_q domains ------------------------------------------
    "r_q = z_q[x]/(x^n + 1)": ("poly_mod_q", None),
    "r_q = z_q[x]/(x^n + 1), coefficient domain": ("poly_mod_q", None),
    "r_q = z_q[x]/(x^n + 1), ntt domain": ("poly_mod_q", None),
    "r_q = z_q[x]/(x^n + 1), montgomery domain": ("poly_signed", DILITHIUM_Q - 1),
    "r_q = z_q[x]/(x^n + 1), reduced coefficients": ("poly_signed", DILITHIUM_Q // 2),
    "r_q = z_q[x]/(x^n + 1), reduced": ("poly_signed", DILITHIUM_Q // 2),
    "uniform polynomial matrix in r_q": ("poly_mod_q", None),
    "uniform polynomial in r_q": ("poly_mod_q", None),

    # --- signing-specific shapes --------------------------------------
    "uniform in (-gamma1, gamma1]": ("poly_gamma1", None),
    "masking vector y, uniform in (-gamma1, gamma1]": ("poly_gamma1", None),
    "z = y + c*s1, coefficients bounded by gamma1 - beta":
        ("poly_signed", GAMMA1 - BETA),
    "coefficients bounded by gamma1 - beta": ("poly_signed", GAMMA1 - BETA),
    "coefficients bounded by gamma2 - beta": ("poly_signed", GAMMA2 - BETA),
    "c*s1, coefficients bounded by beta": ("poly_signed", BETA),
    "coefficients bounded by beta": ("poly_signed", BETA),
    "high bits w1, coefficients in [0, (q-1)/(2*gamma2))": ("w1", None),
    "w1 high bits": ("w1", None),
    "low bits w0, coefficients bounded by gamma2": ("poly_signed", GAMMA2),
    "challenge polynomial with tau +-1 coefficients": ("challenge", None),
    "sparse challenge polynomial": ("challenge", None),
    "hint polynomial, 0/1 coefficients": ("hint", None),
    "hint vector with at most omega nonzero coefficients": ("hint", None),
    "t0, coefficients in (-2^(d-1), 2^(d-1)]": ("t0", None),
    "t1, coefficients in [0, 2^10)": ("t1", None),

    # --- byte strings --------------------------------------------------
    "uniform 256-bit byte string": ("bytes", None),
    "uniform byte string": ("bytes", None),
    "seed byte string": ("bytes", None),
    "message byte string": ("bytes", None),
    "randomness byte string": ("bytes", None),
    "crh byte string": ("bytes", None),
    "tr byte string": ("bytes", None),
    "dilithium public key byte string": ("bytes", None),
    "dilithium secret key byte string": ("bytes", None),
    "dilithium signature byte string": ("bytes", None),
    "packed polynomial byte string": ("bytes", None),
    "keccak state": ("bytes", None),
}

_QUALIFIER_RE = re.compile(
    r'\s+(poly|polynomial|polyvec|polyveck|polyvecl|vector|matrix)$'
)

_warned_distributions = set()


def _normalize(dist_name):
    return re.sub(r'\s+', ' ', dist_name.strip().lower())


def _lookup_distribution(dist_name):
    key = _normalize(dist_name)
    entry = _DISTRIBUTION_TABLE.get(key)
    if entry is not None:
        return entry
    stripped = _QUALIFIER_RE.sub('', key)
    if stripped != key:
        entry = _DISTRIBUTION_TABLE.get(stripped)
    if entry is None and dist_name not in _warned_distributions:
        _warned_distributions.add(dist_name)
        print(
            f"[!] unrecognized distribution {dist_name!r}: falling back to "
            f"a plain uniform byte fill. If this is a real Dilithium "
            f"distribution, add it to _DISTRIBUTION_TABLE in "
            f"driver_dist.py -- a uniform byte fill decodes to "
            f"out-of-domain int32 coefficients and can make a function "
            f"behave nothing like it does in a real signature."
        )
    return entry


def sample_for_distribution(dist_name, length, rng, field_mod):
    """
    Fill exactly `length` bytes for a buffer/scalar whose declared
    distribution is `dist_name`. Falls back to a plain uniform fill in
    [0, field_mod) if dist_name is falsy/unrecognized.

    Poly-shaped kinds consume FOUR bytes per coefficient (int32_t), so
    n_coeffs = length // 4 -- this is the single most important
    difference from the Kyber driver.
    """
    entry = _lookup_distribution(dist_name) if dist_name else None
    if entry is None:
        return random_fill(rng, field_mod, length)

    kind, extra = entry
    if kind == "bytes":
        out = _sample_raw_bytes(rng, length)
    else:
        n_coeffs = length // COEFF_BYTES
        if kind == "uniform_eta":
            out = _sample_uniform_eta(rng, n_coeffs)
        elif kind == "poly_mod_q":
            out = _sample_poly_mod_q(rng, n_coeffs)
        elif kind == "poly_signed":
            out = _sample_poly_signed(rng, n_coeffs, extra)
        elif kind == "poly_gamma1":
            out = _sample_poly_gamma1(rng, n_coeffs)
        elif kind == "w1":
            out = _sample_poly_w1(rng, n_coeffs)
        elif kind == "challenge":
            out = _sample_challenge(rng, n_coeffs)
        elif kind == "hint":
            out = _sample_hint(rng, n_coeffs)
        elif kind == "t0":
            out = _sample_poly_t0(rng, n_coeffs)
        elif kind == "t1":
            out = _sample_poly_t1(rng, n_coeffs)
        else:
            raise ValueError(f"unhandled distribution kind: {kind!r}")

    # length not an exact multiple of 4 for a poly-shaped distribution
    # would be a witness/harness bug (or a poly-shaped distribution
    # attached to a 1-byte scalar), but don't let that crash a whole
    # collection run -- pad/truncate defensively and keep going.
    if len(out) < length:
        out.extend(_sample_raw_bytes(rng, length - len(out)))
    elif len(out) > length:
        out = out[:length]
    return out


def infer_field_mod(dist_name):
    """Returns the natural number of distinct values a SINGLE coefficient
    (4 bytes, int32_t) of this distribution can take -- i.e. the domain
    size to sweep a secret position through, derived from the SAME
    kind/extra lookup sample_for_distribution() itself uses above (not a
    guess). Falls back to 256 (a full uniform byte) if dist_name is
    falsy/unrecognized, matching sample_for_distribution's own
    uniform-byte fallback.

    Every branch below is cross-checked against the actual
    rng.randrange(lo, hi) call in the matching _sample_* function so the
    reported domain size can't silently be off by one:
      - uniform_eta:   _sample_uniform_eta   randrange(-ETA, ETA+1)      -> 2*ETA+1 values
      - poly_mod_q:    _sample_poly_mod_q    randrange(0, Q)             -> Q values
      - poly_signed:   _sample_poly_signed   randrange(-bound, bound+1)  -> 2*bound+1 values
      - poly_gamma1:   _sample_poly_gamma1   randrange(-GAMMA1+1, GAMMA1+1) -> 2*GAMMA1 values
      - w1:            _sample_poly_w1       randrange(0, hi)            -> hi = (Q-1)//(2*GAMMA2) values
      - challenge:     _sample_challenge samples a SPARSE {-1,0,1} poly, not
                        a per-coefficient uniform draw -- there is no single
                        rng.randrange call to match. The coefficient-level
                        domain is still just {-1, 0, 1} (3 values); the
                        override mechanism (_dilithium_override_hook in
                        collect_dist_unicorn.py) writes a raw literal
                        int32 value via _int32_le regardless, so sweeping
                        3 values exercises "0 vs a nonzero challenge
                        coefficient" meaningfully even though the swept
                        value in isolation isn't itself a valid
                        TAU-sparse challenge.
      - hint:          _sample_hint samples a budgeted 0/1 poly (also not a
                        per-coefficient randrange); coefficient-level domain
                        is {0, 1} -> 2 values.
      - t0:            _sample_poly_t0       randrange(-half+1, half+1),
                        half = 1 << (D-1)     -> 2*half = 1 << D values
      - t1:            _sample_poly_t1       randrange(0, 1 << 10)       -> 1 << 10 values
      - bytes/None/unrecognized -> 256 (matches sample_for_distribution's
        own uniform-byte fallback)
    """
    entry = _lookup_distribution(dist_name) if dist_name else None
    if entry is None:
        return 256

    kind, extra = entry
    if kind == "bytes":
        return 256
    if kind == "uniform_eta":
        return 2 * ETA + 1
    if kind == "poly_mod_q":
        return DILITHIUM_Q
    if kind == "poly_signed":
        return 2 * extra + 1
    if kind == "poly_gamma1":
        return 2 * GAMMA1
    if kind == "w1":
        return (DILITHIUM_Q - 1) // (2 * GAMMA2)
    if kind == "challenge":
        return 3
    if kind == "hint":
        return 2
    if kind == "t0":
        return 1 << DILITHIUM_D
    if kind == "t1":
        return 1 << 10
    return 256


def _is_coeff_shaped(dist_name):
    """True if dist_name is a poly/coefficient-shaped distribution
    (int32_t coefficients), False for a byte-string one, None if
    dist_name is falsy/unrecognized (treated as byte-oriented)."""
    if not dist_name:
        return False
    entry = _lookup_distribution(dist_name)
    return entry is not None and entry[0] != "bytes"
