#!/usr/bin/env python3
"""
driver_dist.py — gdb batch-mode driver with two modes:

  probe   : write a random prefix of ONE buffer, zero elsewhere, run,
            dump outputs. Used by calibrate.py for binary search.
  collect : write a randomized value (per active_lengths.json) of EVERY
            input buffer, run, dump outputs. Used for N-trial data
            collection against correct/faulty ELF pairs, and for the
            paired secret-sweep collector (collect_dist.py) via the
            GDB_DRIVER_OVERRIDE_* env vars below.

Dilithium-specific vs the Kyber version
---------------------------------------
  - Coefficients are int32_t (poly.coeffs is int32_t[N]), so every
    poly-shaped distribution samples FOUR bytes per coefficient via
    _int32_le, not two. n_coeffs = length // 4 throughout. Getting this
    wrong doesn't crash -- it silently writes a buffer whose halves
    decode as garbage-magnitude coefficients, which is exactly the kind
    of "realistic-looking but out-of-domain" input this whole
    distribution machinery exists to avoid.
  - Q = 8380417 and the parameter set is selected by DILITHIUM_MODE
    (2/3/5) rather than Kyber's K, via GDB_DRIVER_DILITHIUM_MODE.
    Default is 2, because trace.h compiles PRINT_ARGS/TRACE_SNAPSHOT to
    no-ops unless DILITHIUM_MODE == 2 -- so every function_inputs
    sample, and therefore every witness, comes from a mode-2 build
    unless that guard was changed.
  - Dilithium has several distributions with no Kyber analogue at all:
    the masking vector y (uniform in (-GAMMA1, GAMMA1]), the decomposed
    high bits w1 ([0, (Q-1)/(2*GAMMA2))), the sparse challenge c (TAU
    nonzero +-1 coefficients), the hint vector h (0/1, at most OMEGA
    ones), and t0/t1. See _DISTRIBUTION_TABLE.

Address recovery: pointer buffers are resolved off the FUT's raw-entry
breakpoint frame (debug info required on the FUT itself). Scalar
arguments are backed by patchable global anchors (__mbc_arg_<fn>_<arg>)
and resolved via gdb.parse_and_eval, since they have no debug symbol
and never appear as pointer args on the frame.

Timing notes (hard-won, do not "simplify" without re-reading these):
  - main() must be broken at its TRUE entry address (resolved via
    parse_and_eval, not a name-based breakpoint) -- GDB's name/prologue
    resolution can land mid-prologue, after some scalar-anchor loads
    have already executed, silently capturing stale values into
    registers before the driver's write ever lands.
  - Scalar anchors must be written AFTER Reset_Handler's .data copy has
    run (i.e. after main() is reached) but BEFORE main() reaches the
    load instruction that consumes them -- writing before Reset_Handler
    finishes gets silently overwritten by the .data init copy.
  - main()'s caller (Reset_Handler / crt0) has no debug/CFI info, so
    `finish` cannot unwind out of main(). Instead, $lr is captured at
    main()'s true entry (before anything overwrites it) and used to set
    an explicit return-address breakpoint, so the driver can stop
    exactly when main() completes while the inferior is still alive
    (letting it run to its natural semihosting exit tears down memory,
    and any read afterward silently returns the ELF's static image
    instead of raising an error).

Required env vars (all modes):
    GDB_DRIVER_ELF        path to the ELF
    GDB_DRIVER_WITNESS    path to qemu_witness.json (layout only)
    GDB_DRIVER_FUNC       function-under-test name
    GDB_DRIVER_MODE       "probe" | "collect"
    GDB_DRIVER_FIELD_MOD  fallback uniform-byte range (see distribution
                          notes below), e.g. 256

Optional (all modes):
    GDB_DRIVER_FIXED_SCALARS   comma-separated list of scalar layout
                               names that must stay at their compiled-in
                               init_value every run (a structural
                               parameter, e.g. a nonce or a length),
                               instead of being randomized like a normal
                               fuzzed input.
    GDB_DRIVER_DILITHIUM_MODE  Dilithium parameter set (2/3/5), used to
                               pick K/L/ETA/TAU/GAMMA1/GAMMA2/OMEGA for
                               distribution-aware sampling.
                               Default: 2.

probe mode additionally needs:
    GDB_DRIVER_PROBE_BUF     name of the buffer being probed
    GDB_DRIVER_PROBE_LEN     prefix length to randomize
    GDB_DRIVER_PROBE_SEED    RNG seed (int) for the probed buffer
    GDB_DRIVER_CO_SEED       RNG seed (int) for every OTHER pointer
                             buffer input, held fixed across the whole
                             calibration of one buffer so co-buffer
                             noise doesn't masquerade as sensitivity
    GDB_DRIVER_PROBE_OUT     path to write result JSON

    probe mode always uses a plain uniform byte fill in [0, field_mod),
    ignoring any declared "distribution" -- calibration only cares
    which BYTE offsets influence the output, not whether the bytes
    decode to a realistic field/polynomial element (see calibrate.py's
    module docstring).

collect mode additionally needs:
    GDB_DRIVER_ACTIVE_LENGTHS  path to active_lengths.json
    GDB_DRIVER_TRIAL_SEED      RNG seed for this trial (int)
    GDB_DRIVER_VARIANT         "correct" | "faulty"
    GDB_DRIVER_OUTDIR          results directory

collect mode optionally supports a single-position override, used by the
paired secret-sweep collector to hold a background input fixed while
forcing ONE buffer's ONE position to an explicit value (rather than the
normal randomized fill), for EITHER a pointer buffer OR a scalar-anchor
buffer:
    GDB_DRIVER_OVERRIDE_BUF   name of the buffer/scalar to override
    GDB_DRIVER_OVERRIDE_POS   byte position within that buffer to
                              override (scalars are always position 0)
    GDB_DRIVER_OVERRIDE_VAL   the value to force at that position

    NOTE (Dilithium): for a COEFFICIENT-SHAPED target buffer (see
    is_coeff_shaped below), the WHOLE 4-byte int32_t coefficient
    containing override_pos is overwritten with the two's-complement
    little-endian encoding of GDB_DRIVER_OVERRIDE_VAL -- not just the
    single byte at override_pos. This is what makes sv=0..field_mod-1
    sweep genuine COEFFICIENT VALUES rather than only that coefficient's
    low byte: writing override_val into one byte alone (after zeroing
    the other three) can only ever represent values in [0, 255], no
    matter how large --field-mod is, since the un-written bytes stay at
    zero regardless of override_val. Encoding the full word from
    override_val instead lets a sweep with --field-mod 8380417
    (Dilithium Q) genuinely cover the coefficient's entire domain. For a
    non-coefficient (byte-string) buffer, only the single byte at
    override_pos is changed, same as a plain byte-level override.

Witness layout entries support two extra optional keys, on top of the
usual "role"/"length"/"type"/"anchor"/"init_value":

    "also_input": true
        For buffers that are BOTH written before the call AND read as
        output afterward (e.g. an in-place transform like poly_ntt's
        r). The buffer is randomized before the call like a normal
        input, but its pre-call snapshot is recorded under the key
        "<name>_pre" in the trial JSON's "inputs" section -- NOT under
        "<name>" -- so it never collides with the genuine post-call
        value recorded under "<name>" in "outputs".

    "distribution": "<one of the documented Dilithium distributions>"
        Set by extract_qemu_witness.py from the function_inputs
        sample's "distribution" dict (preferring the "<name>_in"
        PRE-call entry for an also_input buffer). collect mode samples
        this buffer/scalar's randomized fill from the matching
        Dilithium-shaped distribution instead of a flat uniform byte
        fill -- see sample_for_distribution() below for exactly how
        each one is interpreted. A buffer with no "distribution" key
        (e.g. a raw uint8_t* recorded only as a scalar trace byte)
        falls back to the plain uniform [0, field_mod) fill, same as
        probe mode.

Expects QEMU already running:
    qemu-system-arm -M mps2-an386 -kernel <elf> -nographic -semihosting -S -gdb tcp::1234
"""

import gdb
import json
import os
import random
import re
import sys

GDB_TARGET = "localhost:1234"


# ---------------------------------------------------------------------------
# Memory helpers
# ---------------------------------------------------------------------------

def write_bytes(addr, values):
    inferior = gdb.selected_inferior()
    packed = bytes(v & 0xFF for v in values)
    inferior.write_memory(addr, packed)


def read_bytes(addr, count):
    inferior = gdb.selected_inferior()
    raw = inferior.read_memory(addr, count)
    return list(bytes(raw))


def random_fill(rng, field_mod, length):
    return [rng.randrange(field_mod) for _ in range(length)]


# ---------------------------------------------------------------------------
# Dilithium parameters (params.h), selected by DILITHIUM_MODE.
# ---------------------------------------------------------------------------

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


def _is_coeff_shaped(dist_name):
    """True if dist_name is a poly/coefficient-shaped distribution
    (int32_t coefficients), False for a byte-string one, None if
    dist_name is falsy/unrecognized (treated as byte-oriented)."""
    if not dist_name:
        return False
    entry = _lookup_distribution(dist_name)
    return entry is not None and entry[0] != "bytes"


# ---------------------------------------------------------------------------
# Connection / shared setup
# ---------------------------------------------------------------------------

def connect(elf_path):
    gdb.execute(f"file {elf_path}", to_string=True)
    gdb.execute(f"target remote {GDB_TARGET}", to_string=True)


def get_pointer_args(frame):
    block = frame.block()
    while block and not block.function:
        block = block.superblock
    if block is None:
        raise RuntimeError("no debug info block found for this frame")
    args = []
    for sym in block:
        if sym.is_argument and sym.type.code == gdb.TYPE_CODE_PTR:
            args.append(sym)
    return args


def get_fixed_scalars():
    raw = os.environ.get("GDB_DRIVER_FIXED_SCALARS") or ""
    return set(s for s in raw.split(",") if s)


def get_override():
    """
    Returns (override_buf, override_pos, override_val). override_buf is
    "" if no override was requested (the common case for a plain
    N-trial run) -- callers should treat an empty override_buf as
    "never matches any layout name" and skip the override branch
    entirely.
    """
    override_buf = os.environ.get("GDB_DRIVER_OVERRIDE_BUF", "")
    override_pos = int(os.environ.get("GDB_DRIVER_OVERRIDE_POS", "-1"))
    override_val = int(os.environ.get("GDB_DRIVER_OVERRIDE_VAL", "-1"))
    return override_buf, override_pos, override_val


def break_at_main_true_entry():
    """
    Resolve main()'s TRUE entry address via parse_and_eval (bypassing
    GDB's name/prologue-skip resolution, which has been observed to land
    past the prologue -- after some scalar-anchor loads have already
    executed -- regardless of "main" vs "*main" breakpoint syntax), break
    there, and capture $lr for a later manual return-address breakpoint
    (main()'s caller has no debug/CFI info, so `finish` cannot be used).

    Returns return_addr (int), with the temporary entry breakpoint
    already deleted and execution stopped at main()'s first instruction.
    """
    main_entry = int(gdb.parse_and_eval("(unsigned long)&main")) & ~1
    if main_entry == 0:
        raise RuntimeError("could not resolve symbol 'main' via parse_and_eval")

    bp_main = gdb.Breakpoint(f"*0x{main_entry:x}", internal=False)
    gdb.execute("continue", to_string=True)

    frame = gdb.selected_frame()
    if frame.name() != "main":
        raise RuntimeError(f"stopped in '{frame.name()}', expected 'main'")
    bp_main.delete()

    return_addr = int(gdb.parse_and_eval("$lr")) & ~1
    return return_addr


def resolve_pointer_addrs(func, layout):
    """
    Break at the FUT's raw entry and resolve every pointer-typed layout
    entry off the frame's pointer arguments. Returns ({}, []) (and sets
    no breakpoint) if there are no pointer buffers at all -- callers must
    check ptr_names before assuming a callee frame exists to
    `continue`/return from.
    """
    ptr_names = [n for n, s in layout.items() if s.get("type") != "scalar"]
    if not ptr_names:
        return {}, []

    fn_bp = gdb.Breakpoint(f"*{func}", internal=False)
    gdb.execute("continue", to_string=True)

    frame = gdb.selected_frame()
    if frame.name() != func:
        raise RuntimeError(f"stopped in '{frame.name()}', expected '{func}'")
    fn_bp.delete()

    ptr_args = get_pointer_args(frame)
    if len(ptr_args) != len(ptr_names):
        raise RuntimeError(
            f"layout has {len(ptr_names)} pointer buffers {ptr_names}, but "
            f"{func} has {len(ptr_args)} pointer args "
            f"{[s.name for s in ptr_args]} — order/count mismatch"
        )

    ptr_addr = {n: int(sym.value(frame)) for n, sym in zip(ptr_names, ptr_args)}
    return ptr_addr, ptr_names


# ---------------------------------------------------------------------------
# probe mode
# ---------------------------------------------------------------------------

def run_probe():
    elf_path = os.environ["GDB_DRIVER_ELF"]
    witness_path = os.environ["GDB_DRIVER_WITNESS"]
    func = os.environ["GDB_DRIVER_FUNC"]
    field_mod = int(os.environ["GDB_DRIVER_FIELD_MOD"])
    probe_buf = os.environ["GDB_DRIVER_PROBE_BUF"]
    probe_len = int(os.environ["GDB_DRIVER_PROBE_LEN"])
    probe_seed = int(os.environ["GDB_DRIVER_PROBE_SEED"])
    co_seed = int(os.environ["GDB_DRIVER_CO_SEED"])
    probe_out = os.environ["GDB_DRIVER_PROBE_OUT"]

    fixed_scalars = get_fixed_scalars()

    with open(witness_path) as f:
        layout = json.load(f)["layout"]

    connect(elf_path)

    return_addr = break_at_main_true_entry()
    ret_bp = gdb.Breakpoint(f"*0x{return_addr:x}", internal=False)

    # Resolve every address FIRST -- before any writes -- so addr_of is
    # fully populated before the randomization loop below touches it.
    scalar_addr = {}
    for name, spec in layout.items():
        if spec.get("type") != "scalar":
            continue
        scalar_addr[name] = int(gdb.parse_and_eval(f"&{spec['anchor']}"))

    ptr_addr, ptr_names = resolve_pointer_addrs(func, layout)
    addr_of = {**scalar_addr, **ptr_addr}

    # The probed buffer's prefix uses probe_seed (varies per repeat so
    # calibrate.py's n_repeats can guard against unlucky coincidences);
    # every OTHER pointer-buffer input uses co_seed, held fixed across
    # the whole calibration of one buffer -- leaving co-buffers at zero
    # would mask multiplicative dependencies (e.g. a poly product: an
    # all-zero co-buffer forces the product to zero regardless of the
    # buffer being probed, making it appear insensitive up to its full
    # declared length). Always a plain uniform byte fill, regardless of
    # any declared "distribution" -- see module docstring.
    rng = random.Random(probe_seed)
    co_rng = random.Random(co_seed)

    for name, spec in layout.items():
        if spec.get("type") != "scalar" or spec.get("role") != "input":
            continue
        addr = scalar_addr[name]
        if name in fixed_scalars:
            val = spec.get("init_value", 0)
        elif name == probe_buf:
            val = rng.randrange(field_mod)
        else:
            val = co_rng.randrange(field_mod)
        write_bytes(addr, [val])

    for name in ptr_names:
        spec = layout[name]
        also_in = spec.get("also_input")
        is_input = spec.get("role") == "input" or also_in
        if not is_input:
            continue
        addr = ptr_addr[name]
        if name == probe_buf:
            vals = random_fill(rng, field_mod, probe_len)
        else:
            vals = random_fill(co_rng, field_mod, spec["length"])
        write_bytes(addr, vals)

    gdb.execute("continue", to_string=True)
    ret_bp.delete()

    outputs = {}
    for name, spec in layout.items():
        if spec.get("role") == "output":
            outputs[name] = read_bytes(addr_of[name], spec["length"])

    with open(probe_out, "w") as f:
        json.dump(outputs, f)

    print(f"[probe] {probe_buf} len={probe_len} seed={probe_seed} -> {probe_out}")


# ---------------------------------------------------------------------------
# collect mode
# ---------------------------------------------------------------------------

def run_collect():
    elf_path = os.environ["GDB_DRIVER_ELF"]
    witness_path = os.environ["GDB_DRIVER_WITNESS"]
    func = os.environ["GDB_DRIVER_FUNC"]
    field_mod = int(os.environ["GDB_DRIVER_FIELD_MOD"])
    active_lengths_path = os.environ["GDB_DRIVER_ACTIVE_LENGTHS"]
    trial_seed = int(os.environ["GDB_DRIVER_TRIAL_SEED"])
    variant = os.environ["GDB_DRIVER_VARIANT"]
    out_dir = os.environ["GDB_DRIVER_OUTDIR"]

    fixed_scalars = get_fixed_scalars()
    override_buf, override_pos, override_val = get_override()

    with open(witness_path) as f:
        layout = json.load(f)["layout"]
    with open(active_lengths_path) as f:
        active_lengths = json.load(f)

    connect(elf_path)

    return_addr = break_at_main_true_entry()
    ret_bp = gdb.Breakpoint(f"*0x{return_addr:x}", internal=False)

    rng = random.Random(trial_seed)
    written_inputs = {}

    # -----------------------------------------------------------------
    # Scalar inputs: patch now, at main()'s true entry, before any load
    # instruction that would consume them has executed.
    #
    # Dilithium scalars are not all single-byte (poly_uniform_eta's
    # nonce is a uint16_t), so the declared "length" drives how many
    # bytes get written -- writing only the low byte would leave the
    # high byte at its .data init value and silently pin the nonce to a
    # near-constant.
    #
    # Override applies here too, NOT just to pointer buffers -- a
    # scalar-anchor-backed argument targeted by a paired sweep would
    # otherwise silently ignore the override. Scalars are never treated
    # as coefficient-shaped (a coefficient lives in a poly/polyvec
    # buffer, not a bare scalar anchor), so this remains a plain
    # single-byte override of position 0.
    # -----------------------------------------------------------------
    scalar_addr = {}
    for name, spec in layout.items():
        if spec.get("type") != "scalar":
            continue
        addr = int(gdb.parse_and_eval(f"&{spec['anchor']}"))
        scalar_addr[name] = addr
        if spec.get("role") != "input":
            continue

        width = spec.get("length", 1)

        if name in fixed_scalars:
            # Structural parameter that must stay at its compiled-in
            # value every trial, not be randomized over the domain.
            init = spec.get("init_value", 0) & ((1 << (8 * width)) - 1)
            vals = [(init >> (8 * i)) & 0xFF for i in range(width)]
        else:
            vals = sample_for_distribution(
                spec.get("distribution"), width, rng, field_mod)
            if name == override_buf and 0 <= override_pos < width:
                # Paired secret-sweep override: force this scalar byte
                # to an explicit value instead of randomizing it.
                vals[override_pos] = override_val

        write_bytes(addr, vals)
        written_inputs[name] = vals

    # -----------------------------------------------------------------
    # Pointer buffer inputs (and also_input buffers, e.g. an in-place
    # transform that is both written before AND read after the call).
    #
    # Sampled from the buffer's declared "distribution" if it has one
    # (uniform in [-ETA,ETA], an R_q domain, y/w1/challenge/hint/t0/t1,
    # a byte string, ...), falling back to a plain uniform
    # [0, field_mod) fill otherwise.
    #
    # Override: for a COEFFICIENT-SHAPED target buffer, the WHOLE
    # 4-byte int32_t coefficient containing override_pos is overwritten
    # with override_val's own two's-complement little-endian encoding
    # -- NOT just the single byte at override_pos. This is the critical
    # difference from a plain byte-level override (which this driver
    # used to do, and which byte-string buffers still get): writing
    # override_val into ONE byte of an otherwise-zeroed coefficient can
    # only ever produce coefficient values in [0, 255], no matter how
    # large --field-mod is asked to sweep, since the other 3 bytes never
    # change. Writing the FULL word means sv=0..field_mod-1 sweeps
    # genuine coefficient values across that whole range (e.g.
    # --field-mod 8380417 for Dilithium's Q covers the coefficient's
    # entire domain). For a non-coefficient (byte-string) buffer, only
    # the single byte at override_pos is changed, unchanged from before.
    # -----------------------------------------------------------------
    ptr_addr, ptr_names = resolve_pointer_addrs(func, layout)

    for name in ptr_names:
        spec = layout[name]
        also_in = spec.get("also_input")
        is_input = spec.get("role") == "input" or also_in
        if not is_input:
            continue

        fill_len = active_lengths.get(name, spec["length"])
        vals = sample_for_distribution(spec.get("distribution"), fill_len, rng, field_mod)

        if name == override_buf and 0 <= override_pos < len(vals):
            if _is_coeff_shaped(spec.get("distribution")):
                coeff_base = (override_pos // COEFF_BYTES) * COEFF_BYTES
                vals[coeff_base:coeff_base + COEFF_BYTES] = _int32_le(override_val)
            else:
                vals[override_pos] = override_val

        write_bytes(ptr_addr[name], vals)

        # also_input buffers are recorded under a distinct "<name>_pre"
        # key so they never collide with the genuine post-call value
        # recorded under "<name>" in outputs below -- get_buffer() in
        # the test scripts checks "inputs" before "outputs", so writing
        # both under the same key would silently make --out-buf read
        # the PRE-call snapshot instead of the real result.
        key = f"{name}_pre" if also_in else name
        written_inputs[key] = vals

    # -----------------------------------------------------------------
    # Run until our manually-placed return-address breakpoint -- main()
    # has fully completed (including any post-call store to a scalar
    # output anchor), and the inferior is still alive.
    # -----------------------------------------------------------------
    gdb.execute("continue", to_string=True)
    ret_bp.delete()

    addr_of = {**scalar_addr, **ptr_addr}
    outputs = {}
    for name, spec in layout.items():
        if spec.get("role") == "output":
            outputs[name] = read_bytes(addr_of[name], spec["length"])

    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, f"{variant}_trial{trial_seed:06d}.json")
    with open(out_path, "w") as f:
        json.dump({"inputs": written_inputs, "outputs": outputs}, f)


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    mode = os.environ.get("GDB_DRIVER_MODE")
    if mode == "probe":
        run_probe()
    elif mode == "collect":
        run_collect()
    else:
        print(f"[!] unknown or missing GDB_DRIVER_MODE: {mode!r}", file=sys.stderr)
        sys.exit(2)


if __name__ == "__main__":
    main()