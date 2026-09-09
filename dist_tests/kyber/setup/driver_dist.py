#!/usr/bin/env python3
"""
driver_dist.py — gdb batch-mode driver with two modes:

  probe   : write a random prefix of ONE buffer, zero elsewhere, run,
            dump outputs. Used by calibrate.py.

  collect : write a randomized value (per active_lengths.json) of EVERY
            input buffer, run, dump outputs. Used for N-trial data
            collection against correct/faulty ELF pairs, and for the
            paired secret-sweep collector (collect_dist.py) via the
            GDB_DRIVER_OVERRIDE_* env vars below.

The paired secret-sweep override supports both:

  word_size = 1
      byte-oriented override

  word_size = 2
      16-bit word-oriented override

For Kyber int16_t polynomial coefficients:

      coefficient index i
          -> byte offset 2*i

and the supplied override value is encoded as a signed/two's-complement
16-bit little-endian value.

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

  - Scalar anchors must be written AFTER Reset_Handler's .data copy
    has run (i.e. after main() is reached) but BEFORE main() reaches
    the load instruction that consumes them -- writing before
    Reset_Handler finishes gets silently overwritten by the .data
    init copy.

  - main()'s caller (Reset_Handler / crt0) has no debug/CFI info, so
    `finish` cannot unwind out of main(). Instead, $lr is captured at
    main()'s true entry (before anything overwrites it) and used to set
    an explicit return-address breakpoint, so the driver can stop
    exactly when main() completes while the inferior is still alive.
"""

import gdb
import json
import os
import random
import sys


GDB_TARGET = "localhost:1234"


# ---------------------------------------------------------------------------
# Memory helpers
# ---------------------------------------------------------------------------

def write_bytes(addr, values):
    inferior = gdb.selected_inferior()
    packed = bytes(
        v & 0xFF
        for v in values
    )

    inferior.write_memory(
        addr,
        packed,
    )

def read_bytes(addr, count):
    inferior = gdb.selected_inferior()

    raw = inferior.read_memory(
        addr,
        count,
    )

    return list(bytes(raw))

def random_fill(rng, field_mod, length):
    return [
        rng.randrange(field_mod)
        for _ in range(length)
    ]

# ---------------------------------------------------------------------------
# Kyber distribution-aware sampling
# ---------------------------------------------------------------------------

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


# ---------------------------------------------------------------------------
# Connection / shared setup
# ---------------------------------------------------------------------------

def connect(elf_path):

    gdb.execute(
        f"file {elf_path}",
        to_string=True,
    )

    gdb.execute(
        f"target remote {GDB_TARGET}",
        to_string=True,
    )


def get_pointer_args(frame):

    block = frame.block()

    while block and not block.function:
        block = block.superblock

    if block is None:
        raise RuntimeError(
            "no debug info block found for this frame"
        )

    args = []

    for sym in block:

        if (
            sym.is_argument
            and sym.type.code == gdb.TYPE_CODE_PTR
        ):
            args.append(sym)

    return args


def get_fixed_scalars():

    raw = (
        os.environ.get(
            "GDB_DRIVER_FIXED_SCALARS"
        )
        or ""
    )

    return set(
        s
        for s in raw.split(",")
        if s
    )


# ---------------------------------------------------------------------------
# Word-aware override
# ---------------------------------------------------------------------------

def get_override():
    """
    Returns:

        (
            override_buf,
            override_pos,
            override_val,
            override_word_size
        )

    override_word_size:

        1
            byte-oriented behavior

        2
            16-bit word-oriented behavior

    For word_size=2:

        override_pos = coefficient/word index

        byte_offset = override_pos * 2
    """

    override_buf = os.environ.get(
        "GDB_DRIVER_OVERRIDE_BUF",
        "",
    )

    override_pos = int(
        os.environ.get(
            "GDB_DRIVER_OVERRIDE_POS",
            "-1",
        )
    )

    override_val = int(
        os.environ.get(
            "GDB_DRIVER_OVERRIDE_VAL",
            "-1",
        )
    )

    override_word_size = int(
        os.environ.get(
            "GDB_DRIVER_OVERRIDE_WORD_SIZE",
            "1",
        )
    )

    if override_word_size not in (1, 2):
        raise RuntimeError(
            "GDB_DRIVER_OVERRIDE_WORD_SIZE must be "
            "1 or 2"
        )

    return (
        override_buf,
        override_pos,
        override_val,
        override_word_size,
    )


def apply_word_override(
    addr,
    vals,
    word_pos,
    value,
    word_size,
):
    """
    Apply one override to `vals` and write it to target memory.

    word_size == 1:

        word_pos is a byte offset.

    word_size == 2:

        word_pos is an int16_t element/coefficient index.

        byte_offset = word_pos * 2

    Returns a metadata dictionary describing the override.
    """

    if word_size == 1:

        byte_pos = word_pos

        if byte_pos < 0:
            raise RuntimeError(
                f"negative byte override position: "
                f"{byte_pos}"
            )

        if byte_pos >= len(vals):
            raise RuntimeError(
                f"byte override position {byte_pos} "
                f"is outside buffer of length {len(vals)}"
            )

        byte_value = value & 0xFF

        vals[byte_pos] = byte_value

        write_bytes(
            addr + byte_pos,
            [byte_value],
        )

        return {
            "position": word_pos,
            "byte_offset": byte_pos,
            "word_size": 1,
            "value": value,
            "bytes": [byte_value],
        }

    if word_size == 2:

        word_pos = int(word_pos)

        if word_pos < 0:
            raise RuntimeError(
                f"negative int16_t override position: "
                f"{word_pos}"
            )

        byte_pos = word_pos * 2

        if byte_pos + 1 >= len(vals):
            raise RuntimeError(
                f"int16_t override position {word_pos} "
                f"is outside buffer of length {len(vals)} "
                f"(byte range "
                f"{byte_pos}..{byte_pos + 1})"
            )

        word_bytes = _int16_le(value)

        vals[byte_pos] = word_bytes[0]
        vals[byte_pos + 1] = word_bytes[1]

        write_bytes(
            addr + byte_pos,
            word_bytes,
        )

        return {
            "position": word_pos,
            "byte_offset": byte_pos,
            "word_size": 2,
            "value": value,
            "bytes": word_bytes,
        }

    raise RuntimeError(
        f"unsupported override word size: "
        f"{word_size}"
    )


# ---------------------------------------------------------------------------
# main() true entry
# ---------------------------------------------------------------------------

def break_at_main_true_entry():
    """
    Resolve main()'s TRUE entry address via parse_and_eval.

    Break there and capture $lr for a later explicit return-address
    breakpoint.
    """

    main_entry = int(
        gdb.parse_and_eval(
            "(unsigned long)&main"
        )
    ) & ~1

    if main_entry == 0:
        raise RuntimeError(
            "could not resolve symbol 'main' "
            "via parse_and_eval"
        )

    bp_main = gdb.Breakpoint(
        f"*0x{main_entry:x}",
        internal=False,
    )

    gdb.execute(
        "continue",
        to_string=True,
    )

    frame = gdb.selected_frame()

    if frame.name() != "main":
        raise RuntimeError(
            f"stopped in '{frame.name()}', "
            f"expected 'main'"
        )

    bp_main.delete()

    return_addr = int(
        gdb.parse_and_eval("$lr")
    ) & ~1

    return return_addr


# ---------------------------------------------------------------------------
# Resolve pointer addresses
# ---------------------------------------------------------------------------

def resolve_pointer_addrs(
    func,
    layout,
):
    """
    Break at the FUT's raw entry and resolve every pointer-typed
    layout entry from the function's pointer arguments.

    Returns:

        ptr_addr,
        ptr_names
    """

    ptr_names = [
        n
        for n, s in layout.items()
        if s.get("type") != "scalar"
    ]

    if not ptr_names:
        return {}, []

    fn_bp = gdb.Breakpoint(
        f"*{func}",
        internal=False,
    )

    gdb.execute(
        "continue",
        to_string=True,
    )

    frame = gdb.selected_frame()

    if frame.name() != func:
        raise RuntimeError(
            f"stopped in '{frame.name()}', "
            f"expected '{func}'"
        )

    fn_bp.delete()

    ptr_args = get_pointer_args(frame)

    if len(ptr_args) != len(ptr_names):

        raise RuntimeError(
            f"layout has {len(ptr_names)} "
            f"pointer buffers {ptr_names}, but "
            f"{func} has {len(ptr_args)} pointer args "
            f"{[s.name for s in ptr_args]} "
            f"— order/count mismatch"
        )

    ptr_addr = {
        n: int(sym.value(frame))
        for n, sym in zip(
            ptr_names,
            ptr_args,
        )
    }

    return ptr_addr, ptr_names


# ---------------------------------------------------------------------------
# probe mode
# ---------------------------------------------------------------------------

def run_probe():

    elf_path = os.environ[
        "GDB_DRIVER_ELF"
    ]

    witness_path = os.environ[
        "GDB_DRIVER_WITNESS"
    ]

    func = os.environ[
        "GDB_DRIVER_FUNC"
    ]

    field_mod = int(
        os.environ[
            "GDB_DRIVER_FIELD_MOD"
        ]
    )

    probe_buf = os.environ[
        "GDB_DRIVER_PROBE_BUF"
    ]

    probe_len = int(
        os.environ[
            "GDB_DRIVER_PROBE_LEN"
        ]
    )

    probe_seed = int(
        os.environ[
            "GDB_DRIVER_PROBE_SEED"
        ]
    )

    co_seed = int(
        os.environ[
            "GDB_DRIVER_CO_SEED"
        ]
    )

    probe_out = os.environ[
        "GDB_DRIVER_PROBE_OUT"
    ]

    fixed_scalars = get_fixed_scalars()

    with open(witness_path) as f:
        layout = json.load(f)["layout"]

    connect(elf_path)

    return_addr = break_at_main_true_entry()

    ret_bp = gdb.Breakpoint(
        f"*0x{return_addr:x}",
        internal=False,
    )

    # Resolve every scalar address first.
    scalar_addr = {}

    for name, spec in layout.items():

        if spec.get("type") != "scalar":
            continue

        scalar_addr[name] = int(
            gdb.parse_and_eval(
                f"&{spec['anchor']}"
            )
        )

    ptr_addr, ptr_names = resolve_pointer_addrs(
        func,
        layout,
    )

    addr_of = {
        **scalar_addr,
        **ptr_addr,
    }

    rng = random.Random(
        probe_seed
    )

    co_rng = random.Random(
        co_seed
    )

    # ---------------------------------------------------------------
    # Scalar inputs
    # ---------------------------------------------------------------

    for name, spec in layout.items():

        if (
            spec.get("type") != "scalar"
            or spec.get("role") != "input"
        ):
            continue

        addr = scalar_addr[name]

        if name in fixed_scalars:

            val = spec.get(
                "init_value",
                0,
            )

        elif name == probe_buf:

            val = rng.randrange(
                field_mod
            )

        else:

            val = co_rng.randrange(
                field_mod
            )

        write_bytes(
            addr,
            [val],
        )

    # ---------------------------------------------------------------
    # Pointer inputs
    # ---------------------------------------------------------------

    for name in ptr_names:

        spec = layout[name]

        also_in = spec.get(
            "also_input"
        )

        is_input = (
            spec.get("role") == "input"
            or also_in
        )

        if not is_input:
            continue

        addr = ptr_addr[name]

        if name == probe_buf:

            vals = random_fill(
                rng,
                field_mod,
                probe_len,
            )

        else:

            vals = random_fill(
                co_rng,
                field_mod,
                spec["length"],
            )

        write_bytes(
            addr,
            vals,
        )

    gdb.execute(
        "continue",
        to_string=True,
    )

    ret_bp.delete()

    addr_of = {
        **scalar_addr,
        **ptr_addr,
    }

    outputs = {}

    for name, spec in layout.items():

        if spec.get("role") == "output":

            outputs[name] = read_bytes(
                addr_of[name],
                spec["length"],
            )

    with open(
        probe_out,
        "w",
    ) as f:

        json.dump(
            outputs,
            f,
        )

    print(
        f"[probe] {probe_buf} "
        f"len={probe_len} "
        f"seed={probe_seed} "
        f"-> {probe_out}"
    )


# ---------------------------------------------------------------------------
# collect mode
# ---------------------------------------------------------------------------

def run_collect():

    elf_path = os.environ[
        "GDB_DRIVER_ELF"
    ]

    witness_path = os.environ[
        "GDB_DRIVER_WITNESS"
    ]

    func = os.environ[
        "GDB_DRIVER_FUNC"
    ]

    field_mod = int(
        os.environ[
            "GDB_DRIVER_FIELD_MOD"
        ]
    )

    active_lengths_path = os.environ[
        "GDB_DRIVER_ACTIVE_LENGTHS"
    ]

    trial_seed = int(
        os.environ[
            "GDB_DRIVER_TRIAL_SEED"
        ]
    )

    variant = os.environ[
        "GDB_DRIVER_VARIANT"
    ]

    out_dir = os.environ[
        "GDB_DRIVER_OUTDIR"
    ]

    fixed_scalars = get_fixed_scalars()

    (
        override_buf,
        override_pos,
        override_val,
        override_word_size,
    ) = get_override()

    with open(witness_path) as f:
        layout = json.load(f)["layout"]

    with open(active_lengths_path) as f:
        active_lengths = json.load(f)

    connect(elf_path)

    return_addr = break_at_main_true_entry()

    ret_bp = gdb.Breakpoint(
        f"*0x{return_addr:x}",
        internal=False,
    )

    rng = random.Random(
        trial_seed
    )

    written_inputs = {}

    override_info = None

    # -----------------------------------------------------------------
    # Scalar inputs
    #
    # Scalar arguments remain byte-oriented.
    #
    # A scalar-anchor-backed input is a single byte in the existing
    # harness, so override_word_size=2 is intentionally rejected for
    # scalar inputs below.
    # -----------------------------------------------------------------

    scalar_addr = {}

    for name, spec in layout.items():

        if spec.get("type") != "scalar":
            continue

        addr = int(
            gdb.parse_and_eval(
                f"&{spec['anchor']}"
            )
        )

        scalar_addr[name] = addr

        if spec.get("role") != "input":
            continue

        if name in fixed_scalars:

            val = spec.get(
                "init_value",
                0,
            )

        elif (
            name == override_buf
            and override_pos == 0
        ):

            if override_word_size != 1:
                raise RuntimeError(
                    f"scalar override for {name!r} "
                    f"must use word_size=1; "
                    f"scalars are currently one byte "
                    f"in this driver"
                )

            val = override_val

            override_info = {
                "buffer": name,
                "position": 0,
                "byte_offset": 0,
                "word_size": 1,
                "value": val,
                "bytes": [val & 0xFF],
            }

        else:

            val = sample_for_distribution(
                spec.get("distribution"),
                1,
                rng,
                field_mod,
            )[0]

        write_bytes(
            addr,
            [val],
        )

        written_inputs[name] = [
            val
        ]

    # -----------------------------------------------------------------
    # Pointer buffer inputs
    #
    # For a Kyber polynomial with int16_t coefficients:
    #
    #     coefficient i
    #         -> byte offset 2*i
    #
    # The background distribution sampling already emits 2 bytes per
    # coefficient.
    # -----------------------------------------------------------------

    ptr_addr, ptr_names = resolve_pointer_addrs(
        func,
        layout,
    )

    for name in ptr_names:

        spec = layout[name]

        also_in = spec.get(
            "also_input"
        )

        is_input = (
            spec.get("role") == "input"
            or also_in
        )

        if not is_input:
            continue

        fill_len = active_lengths.get(
            name,
            spec["length"],
        )

        # Generate the complete realistic background first.
        vals = sample_for_distribution(
            spec.get("distribution"),
            fill_len,
            rng,
            field_mod,
        )

        # Write complete background.
        write_bytes(
            ptr_addr[name],
            vals,
        )

        # -------------------------------------------------------------
        # Word-aware override
        # -------------------------------------------------------------

        if name == override_buf:

            override_info = apply_word_override(
                ptr_addr[name],
                vals,
                override_pos,
                override_val,
                override_word_size,
            )

        # -------------------------------------------------------------
        # Save PRE-call input
        # -------------------------------------------------------------

        key = (
            f"{name}_pre"
            if also_in
            else name
        )

        written_inputs[key] = vals

    # -----------------------------------------------------------------
    # Run until main()'s return address.
    # -----------------------------------------------------------------

    gdb.execute(
        "continue",
        to_string=True,
    )

    ret_bp.delete()

    # -----------------------------------------------------------------
    # Read outputs
    # -----------------------------------------------------------------

    addr_of = {
        **scalar_addr,
        **ptr_addr,
    }

    outputs = {}

    for name, spec in layout.items():

        if spec.get("role") == "output":

            outputs[name] = read_bytes(
                addr_of[name],
                spec["length"],
            )

    # -----------------------------------------------------------------
    # Write result
    # -----------------------------------------------------------------

    os.makedirs(
        out_dir,
        exist_ok=True,
    )

    out_path = os.path.join(
        out_dir,
        f"{variant}_trial{trial_seed:06d}.json",
    )

    result = {
        "inputs": written_inputs,
        "outputs": outputs,
    }

    # Record the override explicitly so downstream analysis knows
    # which coefficient was forced and what bytes represented it.
    if override_info is not None:

        result["override"] = override_info

    with open(
        out_path,
        "w",
    ) as f:

        json.dump(
            result,
            f,
        )


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():

    mode = os.environ.get(
        "GDB_DRIVER_MODE"
    )

    if mode == "probe":

        run_probe()

    elif mode == "collect":

        run_collect()

    else:

        print(
            f"[!] unknown or missing "
            f"GDB_DRIVER_MODE: {mode!r}",
            file=sys.stderr,
        )

        sys.exit(2)


if __name__ == "__main__":
    main()