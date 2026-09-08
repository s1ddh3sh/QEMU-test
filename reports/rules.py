"""
rules.py (v2)
-------------
Ordered decision list. New at the top: the two manifest-driven patterns
(M1/M2) for leaf combines of raw parameters. Everything below is the
structural tier-2 rule set from v1, used whenever tier 1 doesn't apply
(mixed/circuit values, accumulators, fnSkip/setup/permutation patterns).
"""

from features import Features


def apply_rules(f: Features):
    # ======== TIER 1: manifest-driven secret/public erasure ================
    if f.role == 'secret_erased' and f.tier == '1-manifest':
        return ('M1:secret-operand-erased', False,
                'Leaf combine of two raw, unmodified parameters (no arithmetic in '
                'between): the faulted operand IS the manifest-designated secret '
                'buffer. Corrupting it makes the result collapse to (a function of) '
                'the *public* operand only - the secret is erased outright, giving '
                'no correctable offset and no meaningful "was-it-zero" signal.')

    if f.role == 'secret_preserved' and f.tier == '1-manifest':
        return ('M2:secret-operand-preserved', True,
                'Leaf combine of two raw, unmodified parameters: the faulted operand '
                'is the non-secret (public/fixed) side. Corrupting it makes the '
                'result collapse to (a function of) the secret operand alone - the '
                'secret value is now exposed/isolated in the output, a clean '
                'correctable signature (and ineffective exactly when that public '
                'operand was already the value the fault forces it to).')

    # ---- load/store faults: OPPOSITE polarity from binop erasure -----------
    # (a skip-access fault disturbs whichever buffer it touches; touching the
    # secret directly, undiluted, is what gives an isolatable lever on it)
    if f.role == 'secret_touched' and f.fault_kind in ('load', 'store'):
        return ('M3:secret-access-touched', True,
                'This load/store directly accesses the secret buffer with no dilution '
                '(the cell is not written again later): skipping the access disturbs '
                "exactly the tested quantity's own representation, giving a correctable, "
                'isolatable lever on the secret.')

    if f.role == 'public_touched' and f.fault_kind in ('load', 'store'):
        return ('M4:public-access-touched', False,
                'This load/store accesses a non-secret (public/fixed) buffer: skipping it '
                'perturbs an off-target quantity and gives no leverage on the specific '
                'secret this test is targeting.')

    # ======== TIER 2: structural (mixed values, accumulators, fnSkip) ======
    if f.is_setup_skip:
        return ('P4:setup-skip', False,
                'Skipping a buffer-clear substitutes no attacker-known value; with an '
                'already-zero buffer the fault is simply not activated.')

    if f.is_known_map_skip:
        return ('P3:known-permutation', True,
                'The skipped call is a fixed, public, invertible permutation; omitting '
                'it yields a deterministic, attacker-precomputable re-indexing.')

    if f.is_final_serialize_skip:
        return ('P1:final-serialize-skip', True,
                'The skipped call is the last operation writing one output block; '
                'the block stays at a known prior constant.')

    if f.operand_role == 'opcode':
        return ('P4:opcode-change', False,
                'Changing the opcode breaks the predictable linear relation between '
                'fault and output.')

    if f.kind == 'gep':
        return ('P4:address-fault', False,
                'Fault on an address/index computation, not a value.')

    if (f.fault_kind.startswith('fnSkip') and f.role == 'accumulator'
            and f.dilution_count >= 1):
        return ('P2:skip-breaks-accumulator', False,
                'The skipped call produces the loop-carried accumulator; omitting it '
                'corrupts the running sum fed to every later iteration.')

    if f.role == 'accumulator' and f.kind in ('load', 'store') and f.dilution_count >= 1:
        where = 'read from' if f.kind == 'load' else 'written to'
        return ('P2:diluted-accumulator', False,
                f'The faulted cell is the running accumulator {where} a live buffer '
                f'written again {f.dilution_count} time(s) before leaving the function.')

    if f.dilution_count >= 1 and f.role not in ('public_const',):
        return ('P2:diluted', False,
                f'The corrupted value feeds a cell written again {f.dilution_count} '
                f'time(s) before leaving the function.')

    # NOTE: there is deliberately no longer a blanket "opB of a structural-tier
    # binop is diluted" rule here. That pattern only actually held for
    # instructions whose *own result* gets written into a cell that receives
    # further legitimate writes later (compute_A's accumulating xor into A[pos])
    # - and that case is already caught by the f.dilution_count>=1 check above.
    # A plain, straight-line multiply inside a circuit like mul_f's bit-slicing
    # has dilution_count==0 (nothing ever overwrites its result-consuming cell)
    # and both its operands are genuinely undiluted single-term contributions;
    # forcing opB to 'not exploitable' there was wrong (see mul_f validation).

    if f.role == 'public_const' or f.is_public_operand:
        return ('P3:public-operand', True,
                'The faulted operand is a public constant/shift amount; the term still '
                'lands at a predictable place/value.')

    if f.role in ('fresh_term',) and f.dilution_count == 0 and f.linear_path and f.reaches_output:
        return ('P1:isolatable-fresh-term', True,
                'First/clean touch of a value on a linear path to output, with no '
                'further dilution: a correctable single-term offset.')

    if f.role == 'accumulator' and f.kind == 'binop' and f.dilution_count == 0:
        return ('P1:accumulator-reset', True,
                'Faulting the accumulator operand resets the partial sum right before '
                'the fresh term is folded in, leaving a known, isolatable result.')

    if f.operand_role == 'constant' and f.dilution_count == 0 and f.reaches_output:
        return ('P1:forced-constant', True,
                'undef/zero forces the result to a known constant with no subsequent '
                'dilution.')

    return ('P?:unclassified', False,
            'No pattern matched confidently; defaulting to not-exploitable. '
            'Flag for manual review.')