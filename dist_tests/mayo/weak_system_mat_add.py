#!/usr/bin/env python3
"""weak_system_mat_add.py — equation-based "weak system" oracle for MAYO's
mat_add fault, run entirely in-process via Unicorn (dist_tests/common/machine.py),
against the two GATED, whole-program LLVM/ELF builds:

    correct : tests_mayo/mat_add/full_mayo_gated/gated_mat_add.ll
              -> build/tests_mayo/mat_add/full_mayo_gated/gated_mat_add.elf
    faulty  : tests_mayo/mat_add/loopOrFuncSkip/full_mayo_gated/
                  gated_mat_add_fnSkip_add_f_line8.ll
              -> build/tests_mayo/mat_add/loopOrFuncSkip/full_mayo_gated/
                  gated_mat_add_fnSkip_add_f_line8.elf

Why this fault, concretely
---------------------------
Both gated .ll files inline a full example_mayo() round trip (keypair ->
expand_sk -> expand_pk -> sign -> open -> verify) with a compile-time fault
gate on every call to mat_add:

    %fi.c1 = <call counter> + 1
    br i1 (%fi.c1 == @__fi_target_mat_add), label %fi.faulted, label %fi.orig
  fi.faulted:  call @mat_add__faulted(a, b, c, m, n)
  fi.orig:     call @mat_add(a, b, c, m, n)

@__fi_target_mat_add is 1 in BOTH files, so the fault is armed on the FIRST
of the 10 mat_add calls inside MAYO.Sign's signature-assembly loop

    s_i <- v_i + O*x_i            (mat_add(a=v_i, b=Ox_i, c=s_i, m=78, n=1))

i.e. mat_add here computes one entrywise-linear step of the actual spec
equation (round-2 Algorithm 8, line 44 / round-3 Algorithm 7, line 49):
s[i*n:(i+1)*n] <- v_i + O*x[i*o:(i+1)*o]. Diffing the two __faulted bodies
shows the fault (fnSkip on add_f, source line 8) drops the call to add_f
for iteration 0 of mat_add's own internal loop:

    correct : c[0] = add_f(a[0], b[0]) = a[0] XOR b[0]
    faulty  : c[0] = a[0]                        (b[0]'s contribution lost)

(add_f is confirmed by inspection to be `xor i8 %a, %b` -- GF(16) addition
under this harness's one-nibble-per-byte encoding.)

That is exactly a "weak system" fault in the sense discussed for this
project: the byte c[0] of the assembled signature silently stops being a
function of the secret buffer b (Ox, i.e. of O -- the secret oil space) at
that one coordinate. It is a *structural*, secret-independent loss of rank
in the linear map b -> c at position 0, not a random corruption -- so it
should reproduce identically on every draw and should NOT show up anywhere
else in the 78-byte output.

Two complementary equation-based checks
-----------------------------------------
1. Direct equation check (per call, per byte position):
       predicted[i] = a[i] XOR b[i]
   compared against the *correct* binary's c[i] (sanity: must hold almost
   everywhere -- confirms the harness/witness are wired correctly) and the
   *faulty* binary's c[i] (a position where the correct binary satisfies
   the equation but the faulty one doesn't is direct evidence that this
   coefficient of the assembled system dropped its secret dependency).

2. Live in-guest perturbation / finite-difference linearity check:
   for a chosen call and byte position, XOR the secret input byte b[pos] by
   a known delta *in guest memory*, right when the hook fires (before the
   call body executes), then read back how much c[pos] moved:
       observed_delta = c[pos]_baseline XOR c[pos]_perturbed
   A healthy (full-rank) coefficient must satisfy observed_delta == delta
   (GF(16) addition is its own inverse). A collapsed coefficient will show
   observed_delta == 0 -- it no longer reacts to its secret input at all.
   This is the actual "does the linear system still depend on this secret
   coordinate" test, performed algebraically rather than by guessing at
   output distributions.

Usage:
    python3 dist_tests/mayo/weak_system_mat_add.py
    python3 dist_tests/mayo/weak_system_mat_add.py --correct-elf ... --faulty-elf ...
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..")))

from dist_tests.common.machine import Machine, EmulationError  # noqa: E402

DEFAULT_CORRECT_ELF = "build/tests_mayo/mat_add/full_mayo_gated/gated_mat_add.elf"
DEFAULT_FAULTY_ELF = (
    "build/tests_mayo/mat_add/loopOrFuncSkip/full_mayo_gated/"
    "gated_mat_add_fnSkip_add_f_line8.elf"
)

# mat_add(ptr a, ptr b, ptr c, i32 m, i32 n) -- AAPCS: a=r0 b=r1 c=r2 m=r3,
# n is the 5th word arg, spilled to the incoming stack at sp+0.
FUT_NAMES = ("mat_add", "mat_add__faulted")

RUN_TIMEOUT_US = 180_000_000  # 180s wall-clock safety net (unicorn's own
                                # timeout, not a Python-level one)


def _read_aapcs_pointer_call(machine):
    a_ptr = machine.reg("r0")
    b_ptr = machine.reg("r1")
    c_ptr = machine.reg("r2")
    m_val = machine.reg("r3")
    sp = machine.reg("sp")
    n_val = machine.read_u32(sp)
    return a_ptr, b_ptr, c_ptr, m_val, n_val


def capture_mat_add_calls(elf_path, perturb=None):
    """Boot `elf_path` to main(), hook every call to mat_add/mat_add__faulted,
    run the whole example_mayo() round trip to completion, and return one
    record per call in execution order.

    perturb: optional dict {"call_index": int, "pos": int, "delta": int}.
    If given, the secret input buffer `b` is XORed at byte `pos` by `delta`
    IN GUEST MEMORY right when the target call's hook fires (i.e. after
    capturing the original b[pos], before mat_add's body runs), so the
    captured `c` reflects the perturbed run.

    Each record: {which, call_index, m, n, a, b, c} where a/b/c are lists
    of ints (the field-element bytes actually seen by that call).
    """
    m = Machine.from_elf(elf_path)

    m.run_until("main")
    main_entry_pc = m.reg("pc") | 1
    return_addr = m.reg("lr") & ~1

    addrs = {name: m.addr_of(name) for name in FUT_NAMES}
    addr_to_name = {addr: name for name, addr in addrs.items()}

    calls = []          # completed records (both entry- and exit-captured)
    pending = []         # entry-captured records awaiting their exit capture
    return_hooks = {}    # ret_addr -> unicorn hook handle (registered lazily)
    entry_handles = []

    def entry_hook(machine, address, size):
        which = addr_to_name[address]
        a_ptr, b_ptr, c_ptr, m_val, n_val = _read_aapcs_pointer_call(machine)
        ret_addr = machine.reg("lr") & ~1
        idx = len(calls) + len(pending) + 1

        a_bytes = list(machine.read(a_ptr, m_val))
        b_bytes = list(machine.read(b_ptr, m_val))

        if perturb is not None and idx == perturb["call_index"]:
            pos = perturb["pos"]
            delta = perturb["delta"]
            if not (0 <= pos < m_val):
                raise ValueError(
                    f"perturb pos {pos} out of range for call {idx} (m={m_val})"
                )
            new_val = (b_bytes[pos] ^ delta) & 0xFF
            machine.write(b_ptr + pos, bytes([new_val]))
            b_bytes[pos] = new_val  # reflect the perturbation we just applied

        pending.append(
            {
                "which": which,
                "call_index": idx,
                "a_ptr": a_ptr,
                "b_ptr": b_ptr,
                "c_ptr": c_ptr,
                "m": m_val,
                "n": n_val,
                "a": a_bytes,
                "b": b_bytes,
            }
        )

        # Register a (non-one-shot) exit hook at this call site's return
        # address the first time we see it -- straight-line loop code with
        # no recursion means calls never nest/interleave, so a global FIFO
        # (oldest pending record first) always matches the right call.
        if ret_addr not in return_hooks:
            def exit_hook(machine, address, size):
                rec = pending.pop(0)
                rec["c"] = list(machine.read(rec["c_ptr"], rec["m"]))
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
        raise EmulationError(
            f"{len(pending)} mat_add call(s) entered but never returned "
            f"before main() finished -- exit hook mismatch?"
        )

    calls.sort(key=lambda r: r["call_index"])
    return calls


def check_equation(calls, label):
    """Test 1: per-position c[i] == a[i] XOR b[i], for every captured call."""
    violations = []
    for rec in calls:
        a, b, c = rec["a"], rec["b"], rec["c"]
        for i in range(rec["m"]):
            predicted = a[i] ^ b[i]
            if c[i] != predicted:
                violations.append(
                    {
                        "call_index": rec["call_index"],
                        "which": rec["which"],
                        "pos": i,
                        "a": a[i],
                        "b": b[i],
                        "predicted": predicted,
                        "actual": c[i],
                    }
                )
    print(
        f"[i] {label}: {len(calls)} mat_add call(s) captured, "
        f"{sum(r['m'] for r in calls)} coefficient(s) checked, "
        f"{len(violations)} equation violation(s)"
    )
    for v in violations[:20]:
        print(
            f"    call#{v['call_index']} ({v['which']}) pos {v['pos']}: "
            f"a={v['a']:#04x} b={v['b']:#04x} predicted={v['predicted']:#04x} "
            f"actual={v['actual']:#04x}"
        )
    if len(violations) > 20:
        print(f"    ... and {len(violations) - 20} more")
    return violations


def run_linearity_probe(elf_path, call_index, pos, delta=0x01):
    """Test 2: finite-difference sensitivity of c[pos] to b[pos] at a chosen
    call, comparing an unperturbed run against a run where b[pos] is XORed
    by `delta` right before the call executes."""
    baseline = capture_mat_add_calls(elf_path, perturb=None)
    perturbed = capture_mat_add_calls(
        elf_path, perturb={"call_index": call_index, "pos": pos, "delta": delta}
    )

    base_rec = next(r for r in baseline if r["call_index"] == call_index)
    pert_rec = next(r for r in perturbed if r["call_index"] == call_index)

    base_c = base_rec["c"][pos]
    pert_c = pert_rec["c"][pos]
    observed_delta = base_c ^ pert_c
    linear_ok = observed_delta == delta

    return {
        "call_index": call_index,
        "which": base_rec["which"],
        "pos": pos,
        "delta_applied": delta,
        "c_baseline": base_c,
        "c_perturbed": pert_c,
        "observed_delta": observed_delta,
        "linear_ok": linear_ok,
    }


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--correct-elf", default=DEFAULT_CORRECT_ELF)
    ap.add_argument("--faulty-elf", default=DEFAULT_FAULTY_ELF)
    ap.add_argument(
        "--fault-call-index", type=int, default=1,
        help="1-based mat_add call index the fault is armed on "
             "(matches @__fi_target_mat_add=1 in both gated .ll files).",
    )
    ap.add_argument(
        "--fault-pos", type=int, default=0,
        help="byte position within that call believed to be affected "
             "(matches the fnSkip_add_f_line8 diff: iteration 0).",
    )
    ap.add_argument(
        "--control-pos", type=int, default=1,
        help="a second position in the SAME call used as a negative "
             "control -- should remain linear even in the faulty binary, "
             "confirming the weakness is localized rather than global.",
    )
    ap.add_argument("--report", default=None, help="optional path to write a JSON report to.")
    args = ap.parse_args()

    for label, path in (("correct ELF", args.correct_elf), ("faulty ELF", args.faulty_elf)):
        if not os.path.isfile(path):
            print(f"[!] {label} not found: {path}", file=sys.stderr)
            sys.exit(1)

    print("=" * 70)
    print("Test 1: direct equation check  c[i] == a[i] XOR b[i]")
    print("=" * 70)
    try:
        correct_calls = capture_mat_add_calls(args.correct_elf)
        faulty_calls = capture_mat_add_calls(args.faulty_elf)
    except EmulationError as e:
        print(f"[!] emulation failed: {e}", file=sys.stderr)
        sys.exit(2)

    correct_violations = check_equation(correct_calls, "correct binary")
    faulty_violations = check_equation(faulty_calls, "faulty binary")

    # Positions where the correct binary is right but the faulty one is
    # wrong: this coefficient's dependency on the secret has been lost.
    correct_bad_positions = {(v["call_index"], v["pos"]) for v in correct_violations}
    weak_positions = [
        v for v in faulty_violations
        if (v["call_index"], v["pos"]) not in correct_bad_positions
    ]

    print()
    print(f"[i] {len(weak_positions)} coefficient(s) satisfy the spec equation "
          f"under the correct binary but fail it under the faulty binary "
          f"(candidate weak-system positions).")
    for v in weak_positions[:20]:
        print(
            f"    call#{v['call_index']} ({v['which']}) pos {v['pos']}: "
            f"faulty c={v['actual']:#04x} == a={v['a']:#04x}  "
            f"(secret byte b={v['b']:#04x} dropped from the equation)"
        )

    print()
    print("=" * 70)
    print("Test 2: live perturbation / finite-difference linearity probe")
    print("=" * 70)

    probe_results = []
    for elf_label, elf_path in (("correct", args.correct_elf), ("faulty", args.faulty_elf)):
        for pos_label, pos in (("fault-pos", args.fault_pos), ("control-pos", args.control_pos)):
            r = run_linearity_probe(elf_path, args.fault_call_index, pos)
            r["elf"] = elf_label
            r["pos_label"] = pos_label
            probe_results.append(r)
            status = "LINEAR (full-rank)" if r["linear_ok"] else "FROZEN (rank-deficient)"
            print(
                f"[i] {elf_label:7s} elf, call#{r['call_index']} ({r['which']}), "
                f"{pos_label} (byte {pos}): "
                f"c[base]={r['c_baseline']:#04x} c[perturbed]={r['c_perturbed']:#04x} "
                f"observed_delta={r['observed_delta']:#04x} "
                f"(expected {r['delta_applied']:#04x}) -> {status}"
            )

    print()
    print("=" * 70)
    print("Verdict")
    print("=" * 70)

    faulty_fault_pos = next(
        r for r in probe_results if r["elf"] == "faulty" and r["pos_label"] == "fault-pos"
    )
    faulty_control_pos = next(
        r for r in probe_results if r["elf"] == "faulty" and r["pos_label"] == "control-pos"
    )
    correct_fault_pos = next(
        r for r in probe_results if r["elf"] == "correct" and r["pos_label"] == "fault-pos"
    )

    weak_system_detected = (
        len(weak_positions) > 0
        and not faulty_fault_pos["linear_ok"]
        and correct_fault_pos["linear_ok"]
        and faulty_control_pos["linear_ok"]
    )

    if weak_system_detected:
        print(
            f"[!] WEAK SYSTEM DETECTED: call#{args.fault_call_index} "
            f"({faulty_fault_pos['which']}) byte {args.fault_pos} of the "
            f"assembled signature block permanently lost its dependency on "
            f"the secret input (O) under the faulty binary, while remaining "
            f"a healthy full-rank coefficient in the correct binary and at "
            f"the control position in the SAME faulty call. This is a "
            f"structural, secret-independent rank-1 loss in the "
            f"MAYO.Sign 's_i = v_i + O*x_i' assembly step -- not a generic "
            f"output corruption."
        )
        exit_code = 1
    else:
        print("[i] no localized weak-system signature detected with these parameters.")
        exit_code = 0

    if args.report:
        report = {
            "correct_elf": args.correct_elf,
            "faulty_elf": args.faulty_elf,
            "equation_check": {
                "correct_violations": correct_violations,
                "faulty_violations": faulty_violations,
                "weak_positions": weak_positions,
            },
            "linearity_probe": probe_results,
            "weak_system_detected": weak_system_detected,
        }
        with open(args.report, "w") as f:
            json.dump(report, f, indent=2)
        print(f"[i] report written to {args.report}")

    sys.exit(exit_code)


if __name__ == "__main__":
    main()
