#!/usr/bin/env python3
"""weak_system_compute_P3.py — generic equation-based "quadratic-to-linear
collapse" oracle, run in-process via Unicorn (dist_tests/common/machine.py),
against a pair of gated whole-program MAYO ELFs.

Two independent things, decoupled
-----------------------------------
1. The PROBE function (--func): whichever function's inputs/output we
   actually hook and read. This is fixed by what we want to check the
   algebraic degree of (e.g. always "compute_P3", because P3 is the object
   whose quadratic-vs-affine dependence on O we care about).

2. The FAULT location: wherever inside that probe function's call tree a
   `<name>`/`<name>__faulted` gate pair (@__fi_count_<name> /
   @__fi_target_<name>) actually lives. This can be the probe function
   itself, e.g.:

     tests_mayo/compute_P3/full_mayo_gated/gated_compute_P3.ll
       -> compute_P3 / compute_P3__faulted gated directly; the faulted
          body skips the call to P1_times_O.

   ...or it can be one or more levels DEEPER, with the probe function
   itself appearing only ONCE, ungated, e.g.:

     tests_mayo/P1_times_O/full_mayo_gated/gated_P1_times_O.ll
       -> compute_P3 appears exactly once (no compute_P3__faulted at
          all); IT calls the gate, choosing between P1_times_O and
          P1_times_O__faulted.

   The black-box test does not care which of these it is: it never hooks
   the fault-gated symbol at all, only the stable outer probe function.
   So the SAME --func compute_P3 (and the same secret/output argument
   positions and lengths) is reused for every fault site that ultimately
   changes what compute_P3 returns, whether the gate sits in compute_P3
   itself, in P1_times_O, or deeper still. The tool auto-detects whether
   a `<func>__faulted` twin exists in a given ELF and hooks it too when
   it does -- but that hook is redundant with the fault's own effect on
   `<func>`'s output; it is never required for the test to work.

What the test checks
-----------------------
P3 is supposed to be a genuine degree-2 function of the secret oil matrix
O: P3_i = Upper(O^T*P1_i*O + O^T*P2_i) (round-2 Algorithm 5 line 16 /
round-3 Algorithm 4 line 16 -- char-2 field, so "-" == "+"). P1, P2 are
public. A fault that drops the O^T*P1*O contribution (wherever in the
call tree it happens) turns P3 into Upper(O^T*P2) alone: an honestly
AFFINE (degree <=1) function of O instead of quadratic. That is exactly
the "MAYO public key is no longer genuinely multivariate quadratic in the
oil variables" weakness this project is hunting for -- an attacker (or a
differential distinguisher) who can tell P3 depends affinely rather than
quadratically on O gets to recover O with linear algebra instead of
solving the OV/MQ problem.

How the test detects it, as a black box
------------------------------------------
The probe function's P1/P2/P3-style buffers may be in MAYO's production
"m_vec" nibble-sliced format (one 40-byte block packs up to 80
polynomials' nibbles, 2 per byte, per matrix position) -- decoding that
is never needed. The SECRET argument (O) is a single, not-replicated
matrix of one-nibble-per-byte field elements, so the test only needs to
control its raw bytes, and only needs to treat the OUTPUT argument's
bytes as an opaque bitstring, splitting each byte into its two nibbles
(bit/nibble-slicing is a fixed, k-independent F2-linear repacking, so it
cannot change any individual nibble's degree in the swept O coordinate).

For a chosen O byte position `pos`, force O[pos] to each of 3 distinct
GF(16) field elements {0, 1, x} (raw nibbles 0, 1, 2) right when the
probe function's entry hook fires (before its body runs; everything
else -- P1, P2, the rest of O -- is left exactly as the deterministic
keypair generation produced it), and capture the resulting output buffer
each time. Restricted to this one-coordinate line, the probe function is
a genuine univariate GF(16) polynomial of degree <= 2 per output nibble.
Fit the unique degree-1 (affine) polynomial through the k=0 and k=1
samples and predict the k=x(=2) sample; a nonzero residual there proves a
genuine quadratic term. Tally the residual-nonzero count over every
output nibble:

    healthy (quadratic in O) : some nibbles show a nonzero residual
    collapsed (affine in O)  : ~0 nibbles show a nonzero residual

Not every function is a valid target for THIS test
------------------------------------------------------
Only functions that are genuinely quadratic in the secret argument being
swept make sense here. compute_P3 (and anything that calls it, observed
at the P3 output) qualifies -- it is the one place in MAYO where O
legitimately appears quadratically (that's what makes recovering O hard;
everywhere in MAYO.Sign, by trapdoor design, everything is LINEAR in O).
Plain linear building blocks such as P1_times_O, mat_add, mat_mul,
mul_add_m_upper_triangular_mat_x_mat, mul_add_mat_trans_x_m_mat,
compute_A, compute_rhs are all supposed to be affine in their secret
input already -- this test would show residual=0 in BOTH the correct and
the faulty binary for those (a true negative, not evidence of anything),
because there is no quadratic term to lose in the first place. A fault
there calls for a different equation-based check: does the output still
respond to its secret input at all (see weak_system_mat_add.py's
finite-difference/rank-collapse test).

Usage
-------
    # compute_P3 itself is the fault-gated pair:
    python3 dist_tests/mayo/weak_system_compute_P3.py \\
        --func compute_P3 \\
        --correct-elf build/tests_mayo/compute_P3/full_mayo_gated/gated_compute_P3.elf \\
        --faulty-elf  build/tests_mayo/compute_P3/loopOrFuncSkip/full_mayo_gated/gated_compute_P3_fnSkip_P1_times_O_line0.elf

    # same probe function, but the fault (and its __faulted twin) is one
    # level deeper, inside P1_times_O -- compute_P3 itself is unchanged,
    # ungated, in both ELFs; --func/--secret-*/--output-* stay identical:
    python3 dist_tests/mayo/weak_system_compute_P3.py \\
        --func compute_P3 \\
        --correct-elf build/tests_mayo/P1_times_O/full_mayo_gated/gated_P1_times_O.elf \\
        --faulty-elf  build/tests_mayo/P1_times_O/loopOrFuncSkip/full_mayo_gated/gated_P1_times_O_fnSkip_mul_add_m_upper_triangular_mat_x_mat_line0.elf

--func compute_P3 has built-in defaults for --secret-arg/--secret-len/
--output-arg/--output-len (see KNOWN_FUNCS below); pass them explicitly
to probe a differently-shaped function.
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..")))

from dist_tests.common.machine import Machine, EmulationError  # noqa: E402

DEFAULT_CORRECT_ELF = "build/tests_mayo/compute_P3/full_mayo_gated/gated_compute_P3.elf"
DEFAULT_FAULTY_ELF = (
    "build/tests_mayo/compute_P3/loopOrFuncSkip/full_mayo_gated/"
    "gated_compute_P3_fnSkip_P1_times_O_line0.elf"
)

# Convenience defaults, keyed by probe function name. Each entry describes
# that function's formal-parameter layout (0-based declaration order; every
# parameter observed in this codebase's fault-harness functions is exactly
# one 32-bit word -- ptr or i32 -- so declaration index IS the AAPCS slot:
# r0-r3 for slots 0-3, incoming-stack word (sp + 4*(slot-4)) beyond that):
#   secret_arg / secret_len : the pointer argument to perturb, and its
#       buffer length in bytes (one field-element nibble per byte).
#   output_arg / output_len : the pointer argument whose bytes get decoded
#       into nibbles and degree-tested, and its buffer length in bytes.
KNOWN_FUNCS = {
    # compute_P3(ptr p, ptr P1, ptr P2, ptr O, ptr P3)
    "compute_P3": {
        "secret_arg": 3,
        "secret_len": 78 * 8,             # O: (n-o) x o, one nibble/byte
        "output_arg": 4,
        "output_len": 40 * (8 * 9 // 2),  # P3: o x o upper-tri, 40B m_vec/pos
    },
}

RUN_TIMEOUT_US = 180_000_000

# -- GF(16) = F2[x]/(x^4 + x + 1) --------------------------------------------

_GF16_MOD = 0b10011  # x^4 + x + 1


def gf16_mul(a, b):
    a &= 0xF
    b &= 0xF
    p = 0
    for i in range(4):
        if (b >> i) & 1:
            p ^= a << i
    for i in range(6, 3, -1):
        if (p >> i) & 1:
            p ^= _GF16_MOD << (i - 4)
    return p & 0xF


assert gf16_mul(1, 7) == 7 and gf16_mul(0, 9) == 0 and gf16_mul(2, 2) == 4, (
    "gf16_mul sanity check failed"
)


def _read_arg_ptr(machine, arg_index):
    """AAPCS slot `arg_index` (0-based, across ALL declared params) at the
    exact PC of a not-yet-executed function entry: r0-r3 for slots 0-3, or
    the incoming stack for slot >= 4."""
    if arg_index < 4:
        return machine.reg(f"r{arg_index}")
    sp = machine.reg("sp")
    return machine.read_u32(sp + 4 * (arg_index - 4))


def capture_calls(elf_path, func, secret_arg, secret_len, output_arg, output_len, override=None):
    """Boot elf_path to main(), hook every call to `func` (and, if it
    happens to exist in this ELF, `func`__faulted -- the two are
    functionally interchangeable hook points; whichever ones are present
    are hooked identically), run the whole example_mayo() round trip to
    completion, and return one record per call: {which, call_index,
    secret, output}.

    override: optional {"call_index": int, "pos": int, "value": int} --
    the secret argument's byte `pos` is forced to `value` (not XOR'd) in
    guest memory right when the target call's entry hook fires, before
    its body runs.
    """
    m = Machine.from_elf(elf_path)
    m.run_until("main")
    main_entry_pc = m.reg("pc") | 1
    return_addr = m.reg("lr") & ~1

    addrs = {}
    for name in (func, f"{func}__faulted"):
        try:
            addrs[name] = m.addr_of(name)
        except KeyError:
            continue
    if func not in addrs:
        raise EmulationError(f"{elf_path}: no symbol named {func!r}")
    addr_to_name = {addr: name for name, addr in addrs.items()}

    calls = []
    pending = []
    return_hooks = {}

    def entry_hook(machine, address, size):
        which = addr_to_name[address]
        secret_ptr = _read_arg_ptr(machine, secret_arg)
        output_ptr = _read_arg_ptr(machine, output_arg)
        ret_addr = machine.reg("lr") & ~1
        idx = len(calls) + len(pending) + 1

        secret_bytes = list(machine.read(secret_ptr, secret_len))

        if override is not None and idx == override["call_index"]:
            pos = override["pos"]
            value = override["value"] & 0xFF
            if not (0 <= pos < secret_len):
                raise ValueError(f"override pos {pos} out of range (secret_len={secret_len})")
            machine.write(secret_ptr + pos, bytes([value]))
            secret_bytes[pos] = value

        pending.append(
            {
                "which": which,
                "call_index": idx,
                "output_ptr": output_ptr,
                "secret": secret_bytes,
            }
        )

        if ret_addr not in return_hooks:
            def exit_hook(machine, address, size):
                rec = pending.pop(0)
                rec["output"] = list(machine.read(rec["output_ptr"], output_len))
                calls.append(rec)

            return_hooks[ret_addr] = m.hook_code(
                exit_hook, begin=ret_addr, end=ret_addr, precise=False
            )

    entry_handles = [
        m.hook_code(entry_hook, begin=addr, end=addr, precise=False) for addr in addrs.values()
    ]

    try:
        m._emu_start(main_entry_pc, return_addr, timeout=RUN_TIMEOUT_US)
    finally:
        for h in entry_handles:
            m.unhook(h)
        for h in return_hooks.values():
            m.unhook(h)

    if pending:
        raise EmulationError(f"{len(pending)} {func} call(s) entered but never returned")

    calls.sort(key=lambda r: r["call_index"])
    return calls


def _nibbles(byte_list):
    out = []
    for b in byte_list:
        out.append(b & 0xF)
        out.append((b >> 4) & 0xF)
    return out


def degree_probe(elf_path, func, secret_arg, secret_len, output_arg, output_len, call_index, pos, label):
    """Force secret[pos] to 0, 1, x(=2) in three separate runs, decode
    every output nibble, and count how many show a nonzero Lagrange
    residual at the 3rd point (== genuine degree-2 dependence on
    secret[pos])."""
    samples = {}
    for k in (0, 1, 2):
        calls = capture_calls(
            elf_path, func, secret_arg, secret_len, output_arg, output_len,
            override={"call_index": call_index, "pos": pos, "value": k},
        )
        rec = next(r for r in calls if r["call_index"] == call_index)
        samples[k] = _nibbles(rec["output"])

    n = len(samples[0])
    assert len(samples[1]) == n and len(samples[2]) == n

    nonzero = 0
    for i in range(n):
        v0, v1, v2 = samples[0][i], samples[1][i], samples[2][i]
        predicted = v0 ^ gf16_mul(2, v0 ^ v1)  # affine line through (0,v0),(1,v1), at t=2
        residual = predicted ^ v2
        if residual != 0:
            nonzero += 1

    ratio = nonzero / n
    print(
        f"[i] {label}: secret[{pos}] degree probe over {n} output nibbles -> "
        f"{nonzero} nonzero-residual ({ratio:.2%})"
    )
    return {"pos": pos, "n_nibbles": n, "nonzero_residual": nonzero, "ratio": ratio}


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--func", default="compute_P3",
                     help="probe function name: whose secret-argument input "
                          "and output are hooked/checked. Independent of "
                          "where the actual <name>__faulted fault gate "
                          "lives in the call tree.")
    ap.add_argument("--correct-elf", default=DEFAULT_CORRECT_ELF)
    ap.add_argument("--faulty-elf", default=DEFAULT_FAULTY_ELF)
    ap.add_argument("--secret-arg", type=int, default=None,
                     help="0-based declaration-order index of the secret "
                          "pointer argument (default: looked up in "
                          "KNOWN_FUNCS for --func).")
    ap.add_argument("--secret-len", type=int, default=None,
                     help="secret buffer length in bytes (one nibble/byte).")
    ap.add_argument("--output-arg", type=int, default=None,
                     help="0-based declaration-order index of the output "
                          "pointer argument to degree-test.")
    ap.add_argument("--output-len", type=int, default=None,
                     help="output buffer length in bytes.")
    ap.add_argument("--call-index", type=int, default=1,
                     help="1-based call index of --func the probe targets.")
    ap.add_argument("--positions", default="0,1",
                     help="comma-separated secret[] byte positions to probe.")
    ap.add_argument(
        "--min-nonzero", type=int, default=5,
        help="minimum absolute nonzero-residual count for a 'correct' probe "
             "to count as genuinely quadratic in the secret. Sweeping a "
             "single coordinate only exposes ITS OWN diagonal self-product "
             "term (confined to a small slice of the output), so the "
             "healthy count is naturally small -- what matters is that it "
             "is clearly nonzero.",
    )
    ap.add_argument(
        "--max-nonzero-faulty", type=int, default=1,
        help="maximum absolute nonzero-residual count still counted as "
             "'collapsed' for the faulty probe (0 is the clean expectation; "
             "a small allowance guards against incidental coincidences).",
    )
    ap.add_argument("--report", default=None)
    args = ap.parse_args()

    defaults = KNOWN_FUNCS.get(args.func, {})
    secret_arg = args.secret_arg if args.secret_arg is not None else defaults.get("secret_arg")
    secret_len = args.secret_len if args.secret_len is not None else defaults.get("secret_len")
    output_arg = args.output_arg if args.output_arg is not None else defaults.get("output_arg")
    output_len = args.output_len if args.output_len is not None else defaults.get("output_len")

    missing = [
        n for n, v in (
            ("--secret-arg", secret_arg), ("--secret-len", secret_len),
            ("--output-arg", output_arg), ("--output-len", output_len),
        ) if v is None
    ]
    if missing:
        print(
            f"[!] --func {args.func!r} has no built-in defaults; "
            f"missing required argument(s): {', '.join(missing)}",
            file=sys.stderr,
        )
        sys.exit(1)

    for label, path in (("correct ELF", args.correct_elf), ("faulty ELF", args.faulty_elf)):
        if not os.path.isfile(path):
            print(f"[!] {label} not found: {path}", file=sys.stderr)
            sys.exit(1)

    positions = [int(p) for p in args.positions.split(",") if p.strip() != ""]

    print("=" * 70)
    print(f"{args.func} degree-collapse probe: is the output still quadratic in the secret?")
    print("=" * 70)

    results = {"correct": [], "faulty": []}
    try:
        for pos in positions:
            results["correct"].append(
                degree_probe(args.correct_elf, args.func, secret_arg, secret_len,
                             output_arg, output_len, args.call_index, pos, "correct")
            )
        for pos in positions:
            results["faulty"].append(
                degree_probe(args.faulty_elf, args.func, secret_arg, secret_len,
                             output_arg, output_len, args.call_index, pos, "faulty ")
            )
    except EmulationError as e:
        print(f"[!] emulation failed: {e}", file=sys.stderr)
        sys.exit(2)

    print()
    print("=" * 70)
    print("Verdict")
    print("=" * 70)

    correct_healthy = all(
        r["nonzero_residual"] >= args.min_nonzero for r in results["correct"]
    )
    faulty_collapsed = all(
        r["nonzero_residual"] <= args.max_nonzero_faulty for r in results["faulty"]
    )
    weak_system_detected = correct_healthy and faulty_collapsed

    if weak_system_detected:
        print(
            f"[!] WEAK SYSTEM DETECTED: at every probed secret coordinate "
            f"({positions}), {args.func}'s output is a genuine degree-2 "
            f"function of the secret in the correct binary but collapses "
            f"to a degree-<=1 (affine) function of the secret in the "
            f"faulty binary."
        )
        exit_code = 1
    else:
        print("[i] no quadratic-to-linear collapse detected with these parameters.")
        exit_code = 0

    if args.report:
        with open(args.report, "w") as f:
            json.dump(
                {
                    "func": args.func,
                    "correct_elf": args.correct_elf,
                    "faulty_elf": args.faulty_elf,
                    "secret_arg": secret_arg, "secret_len": secret_len,
                    "output_arg": output_arg, "output_len": output_len,
                    "positions": positions,
                    "results": results,
                    "weak_system_detected": weak_system_detected,
                },
                f,
                indent=2,
            )
        print(f"[i] report written to {args.report}")

    sys.exit(exit_code)


if __name__ == "__main__":
    main()
