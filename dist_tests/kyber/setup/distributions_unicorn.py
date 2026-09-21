#!/usr/bin/env python3
"""distributions_unicorn.py (kyber) — pure-Python distribution-aware
sampling helpers, ported VERBATIM from dist_tests/kyber/setup/driver_dist.py
(the KYBER_Q..sample_for_distribution block). These have zero gdb
dependency in the original either -- straight copy-paste, so the
Unicorn-based collector can use identical sampling logic without
importing the gdb-batch-mode driver module (which only imports inside
gdb's embedded Python).

Also includes apply_word_override_pure(), a memory-write-free port of
driver_dist.py's apply_word_override() (which the original couples to
gdb's write_bytes()) -- same word_size==1/2 override-encoding math,
returning the mutated vals list for the CALLER to write via
Machine.write() instead.

Do not hand-edit the sampling math here without also updating
driver_dist.py, and vice versa.
"""

import os


def random_fill(rng, field_mod, length):
    return [rng.randrange(field_mod) for _ in range(length)]


KYBER_Q = 3329

KYBER_K = int(
    os.environ.get(
        "GDB_DRIVER_KYBER_K",
        "3",
    )
)

KYBER_ETA1 = {
    2: 3,
    3: 2,
    4: 2,
}.get(
    KYBER_K,
    2,
)

KYBER_ETA2 = 2

def _int16_le(val):
    """
    Encode a signed int16_t value as two-byte little-endian.

    Example:

        5       -> [0x05, 0x00]
        1000    -> [0xE8, 0x03]
        -1      -> [0xFF, 0xFF]
        -2      -> [0xFE, 0xFF]

    This is the representation used by Kyber's int16_t polynomial
    coefficients.
    """

    val &= 0xFFFF

    return [
        val & 0xFF,
        (val >> 8) & 0xFF,
    ]

def _cbd_sample(rng, eta):
    """
    One centered-binomial-distribution coefficient.

    Range:

        [-eta, eta]

    This samples the mathematical coefficient directly. It does not
    reproduce Kyber's exact byte-packing algorithm; the resulting
    coefficient is subsequently encoded as int16_t.
    """

    a = sum(
        rng.randrange(2)
        for _ in range(eta)
    )

    b = sum(
        rng.randrange(2)
        for _ in range(eta)
    )

    return a - b

def _sample_cbd(rng, eta, n_coeffs):
    out = []

    for _ in range(n_coeffs):

        coeff = _cbd_sample(
            rng,
            eta,
        )

        out.extend(
            _int16_le(coeff)
        )

    return out

def _sample_poly_mod_q(rng, n_coeffs):
    """
    Uniform polynomial coefficient in:
        [0, KYBER_Q)
    Each coefficient is encoded as an int16_t, i.e. 2 bytes.
    """
    out = []

    for _ in range(n_coeffs):

        coeff = rng.randrange(
            0,
            KYBER_Q,
        )
        out.extend(
            _int16_le(coeff)
        )
    return out


def _sample_poly_signed(rng, n_coeffs, bound):
    """
    Uniform signed int16 coefficient in:

        [-bound, bound]

    Each coefficient occupies two bytes.
    """

    out = []

    for _ in range(n_coeffs):

        coeff = rng.randrange(
            -bound,
            bound + 1,
        )

        out.extend(
            _int16_le(coeff)
        )

    return out


def _sample_message_poly(rng, n_coeffs):
    """
    Polynomial whose coefficients are either:

        0

    or:

        round(q/2)

    matching the message embedding used by poly_frommsg().
    """

    half_q = (KYBER_Q + 1) // 2

    out = []

    for _ in range(n_coeffs):

        if rng.randrange(2):
            coeff = half_q
        else:
            coeff = 0

        out.extend(
            _int16_le(coeff)
        )

    return out

def _sample_raw_bytes(rng, n_bytes):
    return [
        rng.randrange(256)
        for _ in range(n_bytes)
    ]


# ---------------------------------------------------------------------------
# Distribution table
# ---------------------------------------------------------------------------

_DISTRIBUTION_TABLE = {

    "centered binomial distribution, eta1":
        ("cbd", KYBER_ETA1),

    "centered binomial distribution, eta2":
        ("cbd", KYBER_ETA2),

    "Kyber ciphertext byte string":
        ("bytes", None),

    "Kyber public key byte string":
        ("bytes", None),

    "Kyber secret key byte string":
        ("bytes", None),

    "message byte string":
        ("bytes", None),

    "shared secret byte string":
        ("bytes", None),

    "uniform 256-bit byte string":
        ("bytes", None),

    "message embedded in R_q = Z_q[X]/(X^n + 1)":
        ("message_poly", None),

    "R_q = Z_q[X]/(X^n + 1), coefficient domain":
        ("poly_mod_q", None),

    "R_q = Z_q[X]/(X^n + 1), coefficient domain polyvec":
        ("poly_mod_q", None),

    "R_q = Z_q[X]/(X^n + 1), NTT domain":
        ("poly_mod_q", None),

    "R_q = Z_q[X]/(X^n + 1), NTT domain polyvec":
        ("poly_mod_q", None),

    "R_q = Z_q[X]/(X^n + 1), poly":
        ("poly_mod_q", None),

    "R_q = Z_q[X]/(X^n + 1), polyvec":
        ("poly_mod_q", None),

    "R_q = Z_q[X]/(X^n + 1), Montgomery domain":
        ("poly_signed", KYBER_Q - 1),

    "R_q = Z_q[X]/(X^n + 1), reduced coefficients":
        ("poly_signed", KYBER_Q // 2),

    "R_q = Z_q[X]/(X^n + 1), reduced polynomial":
        ("poly_signed", KYBER_Q // 2),

    "R_q = Z_q[X]/(X^n + 1), reduced polyvec":
        ("poly_signed", KYBER_Q // 2),

    "uniform polynomial matrix in R_q":
        ("poly_mod_q", None),
}


def sample_for_distribution(
    dist_name,
    length,
    rng,
    field_mod,
):
    """
    Fill exactly `length` bytes for a buffer/scalar whose declared
    distribution is `dist_name`.

    Polynomial-shaped distributions use:

        2 bytes / coefficient

    because Kyber polynomial coefficients are int16_t.

    Unknown distributions fall back to the existing byte-oriented
    random fill.
    """

    entry = (
        _DISTRIBUTION_TABLE.get(dist_name)
        if dist_name
        else None
    )

    if entry is None:
        return random_fill(
            rng,
            field_mod,
            length,
        )

    kind, extra = entry

    if kind == "bytes":

        out = _sample_raw_bytes(
            rng,
            length,
        )

    else:

        n_coeffs = length // 2

        if kind == "cbd":

            out = _sample_cbd(
                rng,
                extra,
                n_coeffs,
            )

        elif kind == "poly_mod_q":

            out = _sample_poly_mod_q(
                rng,
                n_coeffs,
            )

        elif kind == "poly_signed":

            out = _sample_poly_signed(
                rng,
                n_coeffs,
                extra,
            )

        elif kind == "message_poly":

            out = _sample_message_poly(
                rng,
                n_coeffs,
            )

        else:

            raise ValueError(
                f"unhandled distribution kind: {kind!r}"
            )

    # A polynomial-shaped buffer should have an even byte length.
    #
    # Keep the defensive behavior from the original driver so that a
    # malformed witness does not silently destroy an entire collection.
    if len(out) < length:

        out.extend(
            _sample_raw_bytes(
                rng,
                length - len(out),
            )
        )

    elif len(out) > length:

        out = out[:length]

    return out




def infer_field_mod(dist_name):
    """
    Returns the natural number of distinct values a SINGLE coefficient
    (2 bytes, int16_t) of this distribution can take -- i.e. the domain
    size to sweep a secret position through, derived from the SAME
    (kind, extra) entry sample_for_distribution() looks up above (not a
    guess). Falls back to 256 (a full uniform byte) if dist_name is
    falsy/unrecognized, matching sample_for_distribution's own
    uniform-byte fallback.

    Cross-checked against each _sample_* function body:
      - cbd:           _cbd_sample samples two independent Binomial(eta, 1/2)
                        draws and subtracts them -- range [-eta, eta]
                        inclusive -> 2*eta+1 values. `extra` here IS eta
                        (KYBER_ETA1 or KYBER_ETA2, baked into the table
                        entry itself), so this is exact, not a guess.
      - poly_mod_q:     _sample_poly_mod_q   randrange(0, KYBER_Q)          -> KYBER_Q values
      - poly_signed:    _sample_poly_signed  randrange(-bound, bound+1)     -> 2*bound+1 values
      - message_poly:   _sample_message_poly picks between exactly two
                         values (0 or round(q/2)) per coefficient -> 2 values
      - bytes/None/unrecognized -> 256 (matches sample_for_distribution's
        own uniform-byte fallback)
    """
    entry = _DISTRIBUTION_TABLE.get(dist_name) if dist_name else None
    if entry is None:
        return 256

    kind, extra = entry
    if kind == "bytes":
        return 256
    if kind == "cbd":
        return 2 * extra + 1
    if kind == "poly_mod_q":
        return KYBER_Q
    if kind == "poly_signed":
        return 2 * extra + 1
    if kind == "message_poly":
        return 2
    return 256


def apply_word_override_pure(vals, word_pos, value, word_size):
    """Pure port of driver_dist.py's apply_word_override(): mutates and
    returns `vals` in place (no memory write -- the caller does that).
    word_size==1: word_pos is a byte offset. word_size==2: word_pos is
    an int16_t element/coefficient index (byte_offset = word_pos * 2)."""
    if word_size == 1:
        byte_pos = word_pos
        if byte_pos < 0 or byte_pos >= len(vals):
            raise RuntimeError(
                f"byte override position {byte_pos} is outside buffer of "
                f"length {len(vals)}"
            )
        vals[byte_pos] = value & 0xFF
        return vals

    if word_size == 2:
        word_pos = int(word_pos)
        byte_pos = word_pos * 2
        if word_pos < 0 or byte_pos + 1 >= len(vals):
            raise RuntimeError(
                f"int16_t override position {word_pos} is outside buffer "
                f"of length {len(vals)} (byte range {byte_pos}..{byte_pos + 1})"
            )
        word_bytes = _int16_le(value)
        vals[byte_pos] = word_bytes[0]
        vals[byte_pos + 1] = word_bytes[1]
        return vals

    raise RuntimeError(f"unsupported override word size: {word_size}")
