"""
features.py (v2)
-----------------
Builds the feature vector for one fault site. Two tiers of analysis, applied
in order:

TIER 1 - manifest-driven secret/public erasure (only when BOTH operands of a
binop resolve 'raw' to a named parameter/global, i.e. this instruction is a
"leaf combine" of two untouched inputs, like `xor %a, %b`):
    - faulting the operand that resolves to the function's SECRET parameter
      erases the secret from the result -> NOT exploitable.
    - faulting the operand that resolves to a FIXED-scalar or any other
      (non-secret) parameter/global leaves the result equal to the secret,
      or a known function of it -> exploitable.

TIER 2 - isolatable-term / dilution analysis (used whenever tier 1 doesn't
apply: at least one operand is 'mixed' - i.e. we are inside a multi-gate
circuit like mul_f's bit-slicing, or a genuine accumulation loop like
compute_A/m_vec_add). This reuses the patterns established earlier:
    - fresh, undiluted single-term corruption -> exploitable
    - resetting an accumulator operand -> exploitable
    - operand/store that keeps getting further legitimate writes -> diluted,
      not exploitable
    - undef/zero forcing a known constant -> exploitable if undiluted

fnSkip / load / store fault kinds use the same setup-skip / known-map-skip /
final-serialize-skip / accumulator-skip patterns from before, now ALSO
consulting the manifest for load/store faults (does this load/store touch
the secret buffer, a fixed scalar, or neither - see LOAD/STORE tier 1 below).
"""

from dataclasses import dataclass, field

from resolve import (resolve_to_param, resolve_secret_param_via_callsites,
                      base_buffer, buffer_touched_again, has_data_accumulator)


LINEAR_OPS = {'xor', 'add'}
KNOWN_MAP_CALLEES = {'transpose_16x16_nibbles', 'decode'}
PUBLIC_FIELD_CALLEES = {'mul_f', 'add_f', 'mul_f.23', 'sub_f'}
SETUP_CALLEES = {'mayo_memset'}
PUBLIC_CONSTANTS = {
    '1229782938247303441', '72057594037927935', '72057594037927936',
}


@dataclass
class FaultSite:
    func: str
    index: int
    fault_kind: str
    raw_label: str


@dataclass
class Features:
    func: str
    index: int
    fault_kind: str
    kind: str = 'other'
    role: str = 'unknown'                 # fresh_term | accumulator | public_const
                                           #   | secret_erased | secret_preserved | call_result
    dilution_count: int = 0
    linear_path: bool = True
    reaches_output: bool = True
    operand_role: str = None
    is_public_operand: bool = False
    is_setup_skip: bool = False
    is_known_map_skip: bool = False
    is_final_serialize_skip: bool = False
    callee: str = None
    tier: str = None                      # '1-manifest' | '2-structural'
    param_classes: dict = field(default_factory=dict)   # ssa_name -> 'secret'|'fixed'|'other'|'unresolved-manifest'
    notes: list = field(default_factory=list)


def _classify_ssa_value(fn, manifest, func, ssa_name):
    """Resolve an SSA value to (param_name, purity, class) where class is one
    of 'secret' | 'fixed' | 'other' | 'unresolved-manifest' | None (unresolved)."""
    param, purity = resolve_to_param(fn, ssa_name)
    if param is None:
        return None, purity, None
    cls = manifest.classify_param(func, param, fn.params) if manifest and manifest.has(func) else 'other'
    return param, purity, cls


def _is_public_value(fn, name):
    if name is None:
        return False
    if name.lstrip('-').isdigit():
        return True
    for ins in fn.instrs:
        if ins.defines == name:
            for c in PUBLIC_CONSTANTS:
                if c in ins.text:
                    return True
            return False
    return False


def _pointer_written_again_after(fn, ptr, after_index):
    if ptr is None:
        return 0
    count = 0
    for ins in fn.instrs:
        if ins.index <= after_index:
            continue
        if ins.kind == 'store' and ins.ptr == ptr:
            count += 1
    return count


def _accumulator_via_phi(fn, name):
    for ins in fn.instrs:
        if ins.defines == name and ins.kind == 'phi':
            return True
    return False


def _reaches_ret_or_out_store(fn, name):
    frontier = {name}
    seen = set()
    while frontier:
        v = frontier.pop()
        if v in seen:
            continue
        seen.add(v)
        for ins in fn.instrs:
            if v in ins.uses:
                if ins.kind == 'ret':
                    return True
                if ins.kind == 'store':
                    return True
                if ins.defines:
                    frontier.add(ins.defines)
    return False


def _path_is_linear(fn, name):
    for ins in fn.instrs:
        if name in ins.uses:
            if ins.kind == 'binop':
                head = ins.text.split()[0]
                if head in ('mul', 'and', 'or', 'select'):
                    return False
            if ins.kind == 'call' and ins.callee not in (PUBLIC_FIELD_CALLEES | KNOWN_MAP_CALLEES):
                return False
    return True


def _structural_binop_roles(fn, ins):
    """Tier-2 fallback role guess (accumulator vs fresh) - unchanged from v1,
    used only when tier-1 manifest classification doesn't resolve both sides."""
    roles = {}
    for op in ins.uses:
        if op.lstrip('-').isdigit():
            roles[op] = 'constant'
            continue
        if _accumulator_via_phi(fn, op):
            roles[op] = 'accumulator'
            continue
        definer = next((d for d in fn.instrs if d.defines == op), None)
        if definer is not None and definer.kind == 'load' and definer.ptr:
            if _pointer_written_again_after(fn, definer.ptr, ins.index) or \
               any(s.kind == 'store' and s.ptr == definer.ptr and s.index > ins.index
                   for s in fn.instrs):
                roles[op] = 'accumulator'
                continue
        roles[op] = 'fresh'
    return roles


def extract(fn, site: FaultSite, manifest=None, funcs=None, callsite_index=None) -> Features:
    ins = fn.by_index.get(site.index)
    f = Features(func=site.func, index=site.index, fault_kind=site.fault_kind)
    if ins is None:
        f.notes.append('instruction index not found in parsed IR')
        return f
    f.kind = ins.kind

    # Ensure call-site-only secret names (e.g. mat_add's "Ox") get resolved once.
    if manifest and manifest.has(site.func) and funcs is not None and callsite_index is not None:
        resolve_secret_param_via_callsites(manifest, funcs, callsite_index, site.func)

    # ---- function-skip faults --------------------------------------------
    if site.fault_kind.startswith('fnSkip:'):
        callee = site.fault_kind.split(':', 1)[1] if ':' in site.fault_kind else ins.callee
        f.callee = callee
        f.role = 'call_result'
        if callee in SETUP_CALLEES:
            f.is_setup_skip = True
            f.notes.append(f'{callee} only clears a buffer; skip substitutes no known value')
        elif callee in KNOWN_MAP_CALLEES:
            if callee == 'transpose_16x16_nibbles':
                f.is_known_map_skip = True
                f.notes.append('public invertible permutation; skip is a known re-indexing')
            elif callee == 'decode':
                f.is_final_serialize_skip = True
                f.notes.append('final serialization of one output block; clean drop')
        elif callee in PUBLIC_FIELD_CALLEES:
            f.role = 'fresh_term'
            f.notes.append(f'{callee} produces a fresh field value on the dataflow chain')

        if ins.defines:
            feeds_accumulator_phi = any(
                p.kind == 'phi' and ins.defines in p.uses for p in fn.instrs
            )
            if feeds_accumulator_phi:
                f.role = 'accumulator'
                f.dilution_count = 1
                f.notes.append('skipped call writes the loop-carried accumulator; '
                               'omission corrupts the running sum for all later iterations')
            else:
                # value-returning call, not loop-carried: check whether the
                # store that consumes its result gets overwritten again later
                consumer_store = next((s for s in fn.instrs
                                       if s.kind == 'store' and s.stored_value == ins.defines), None)
                if consumer_store is not None:
                    base = base_buffer(fn, consumer_store.ptr)
                    f.dilution_count = buffer_touched_again(fn, base, consumer_store.index)
                else:
                    f.dilution_count = 0
                if f.role == 'call_result':
                    f.role = 'fresh_term'
                    f.notes.append('skipped call produces a value consumed exactly once '
                                   '(e.g. stored into one output cell); not loop-carried')
            f.reaches_output = _reaches_ret_or_out_store(fn, ins.defines)
        else:
            # void call: does ANY argument's underlying buffer get touched
            # again later in this same function (by a store or by being
            # passed into a later call)? If not, this call was that buffer's
            # only writer *within this function* and the skip is a clean,
            # undiluted "buffer stays at its known prior state" fault.
            bases_touched = 0
            for arg in ins.call_args:
                base = base_buffer(fn, arg)
                bases_touched += buffer_touched_again(fn, base, site.index)
            f.dilution_count = bases_touched
            if bases_touched == 0:
                f.role = 'fresh_term'
                f.notes.append('void call whose output buffer(s) are not touched again '
                               'anywhere later in this function (intra-function check only - '
                               'see write-up caveat about buffers pre-populated by an even '
                               'earlier caller, which this cannot see)')
            else:
                f.role = 'accumulator'
                f.notes.append(f'void call whose output buffer is touched again '
                               f'{bases_touched} time(s) later in this function')
            f.reaches_output = True
        return f

    # ---- load / store faults -----------------------------------------------
    if site.fault_kind in ('load', 'store'):
        # IMPORTANT POLARITY NOTE (opposite of the binop rule below):
        # a load/store fault models *skipping the memory access* (the value
        # is left stale/attacker-uncontrolled), not "zeroing one operand of a
        # combine". Empirically (validated against mat_add's line5 vs line7,
        # and m_vec_add's line5), a fresh/undiluted access that touches the
        # SECRET buffer directly is what gives an isolatable lever on that
        # secret -> EXPLOITABLE. A fresh/undiluted access to a non-secret
        # buffer disturbs an off-target quantity -> NOT exploitable. This is
        # the mirror image of the binop opA/opB erasure rule, where corrupting
        # the secret OPERAND erases it. Dilution (the cell/buffer being
        # touched again later) still takes priority over this and makes it
        # NOT exploitable regardless of secret/public status.
        ptr = ins.ptr
        param, purity, cls = _classify_ssa_value(fn, manifest, site.func, ptr) if ptr else (None, None, None)
        f.param_classes[ptr] = cls
        stored_back = _pointer_written_again_after(fn, ptr, site.index) or \
            any(s.kind == 'store' and s.ptr == ptr and s.index > site.index for s in fn.instrs)

        fn_has_accumulator = has_data_accumulator(fn)

        if stored_back:
            f.role = 'accumulator'
            f.dilution_count = _pointer_written_again_after(fn, ptr, site.index)
            f.notes.append(f'{site.fault_kind} touches a cell written back / re-accumulated '
                           f'later - dilution takes priority over secret/public status')
        elif site.fault_kind == 'store':
            # A store fault corrupts the *observable output* wherever it lands;
            # that is generically exploitable if undiluted, regardless of
            # whether the destination buffer happens to be the manifest's
            # secret or not (see mat_add_line10/mat_mul_line11 validation -
            # the secret/public split is a LOAD-only phenomenon) - UNLESS this
            # store completes a read-modify-write (the same address was loaded
            # earlier in this function, i.e. this is an accumulate: acc[i] =
            # load(acc[i]) op something; store back). In that case, skipping
            # the store just discards the newly-computed update and leaves the
            # cell at its untouched prior value - functionally identical to
            # erasing the new contribution's effect (see m_vec_add's line9,
            # which completes the RMW started by its own line7 load, vs.
            # mat_add/mat_mul/decode's stores into pure write-only output
            # cells that are never read from beforehand).
            is_rmw = any(other.kind == 'load' and other.ptr == ptr and other.index < site.index
                        for other in fn.instrs)
            if is_rmw:
                f.role = 'accumulator'
                f.dilution_count = 1
                f.notes.append('store completes a read-modify-write (this address was loaded '
                               'earlier in the function): skipping it discards the newly '
                               "computed update, leaving the cell at its prior, already-"
                               'accounted-for value - functionally an erasure, not a fresh write')
            else:
                f.role = 'fresh_term'
                f.notes.append('store fault writing to a pure write-only output cell (never '
                               'read from earlier in this function); corrupts the observable '
                               'output directly with a known default value')
        elif fn_has_accumulator:
            # Genuine running accumulator (e.g. lincomb's ret.0): the first,
            # undiluted touch of either raw input to the accumulation is
            # exploitable regardless of secret/public status - what matters
            # here is isolating the first term of the sum.
            f.role = 'fresh_term'
            f.notes.append('function carries a genuine data accumulator across loop '
                           'iterations; an undiluted first-touch load feeding it is '
                           'exploitable independent of secret/public status')
        elif cls == 'secret' and purity == 'raw':
            f.role = 'secret_touched'
            f.notes.append(f'{site.fault_kind} directly touches the secret parameter '
                           f'"{param}" with no dilution - an isolatable disturbance of '
                           f'exactly the tested quantity')
        elif cls in ('fixed', 'other') and purity == 'raw' and param in fn.params:
            # NOTE the `param in fn.params` guard: a resolved base that is a
            # local alloca (e.g. shake256's tail-staging buffer %t) is only
            # classified 'other' by exclusion, not because the manifest
            # verified it as public - it isn't one of the function's own
            # parameters at all. Applying the public-touch "not exploitable"
            # verdict there was wrong (see shake256_line17 validation); such
            # locals fall through to the structural default below instead.
            f.role = 'public_touched'
            f.notes.append(f'{site.fault_kind} touches non-secret parameter "{param}"; '
                           f'disturbs an off-target quantity, no leverage on the secret')
        else:
            f.role = 'fresh_term'
            f.notes.append(f'{site.fault_kind} of a fresh value feeding its first use '
                           f'(manifest could not classify the underlying buffer)')
        if ins.defines:
            f.reaches_output = _reaches_ret_or_out_store(fn, ins.defines)
            f.linear_path = _path_is_linear(fn, ins.defines)
        return f

    # ---- binop faults (opA/opB/undef/zero) ---------------------------------
    if site.fault_kind.startswith('binop:'):
        variant = site.fault_kind.split(':', 1)[1]

        if variant in ('undef', 'zero'):
            f.operand_role = 'constant'
            f.role = 'fresh_term'
            f.notes.append(f'{variant} forces a known-constant result (isolatable drop)')
            if ins.defines:
                consumer_store = next((s for s in fn.instrs
                                       if s.kind == 'store' and s.stored_value == ins.defines), None)
                if consumer_store is not None:
                    f.dilution_count = _pointer_written_again_after(fn, consumer_store.ptr, consumer_store.index)
                f.reaches_output = _reaches_ret_or_out_store(fn, ins.defines)
            return f

        if variant == 'opC':
            f.operand_role = 'opcode'
            f.role = 'fresh_term'
            f.linear_path = False
            f.notes.append('opcode change breaks predictable linear relation')
            return f

        ssa_ops = [u for u in ins.uses if not u.lstrip('-').isdigit()]
        target = None
        if variant == 'opA' and len(ssa_ops) >= 1:
            target = ssa_ops[0]
        elif variant == 'opB' and len(ssa_ops) >= 2:
            target = ssa_ops[1]

        if target is None:
            f.notes.append(f'{variant}: operand not resolvable; defaulting to fresh_term')
            f.role = 'fresh_term'
            return f

        # --- TIER 1: is this a leaf combine of two RAW named values? -------
        classes = {}
        purities = {}
        for op in ssa_ops[:2]:
            p, purity, cls = _classify_ssa_value(fn, manifest, site.func, op)
            classes[op] = cls
            purities[op] = purity
            f.param_classes[op] = cls

        # Gate on the TARGET operand's own resolution only - it does not
        # matter whether the sibling operand also resolves cleanly (e.g.
        # mul_f's compiler-barrier blocker load never resolves to a named
        # parameter at all, but that doesn't stop the target %a from being a
        # clean raw reference to the secret whose corruption is analysable
        # on its own terms).
        target_raw = purities.get(target) == 'raw' and classes.get(target) is not None

        if target_raw:
            f.tier = '1-manifest'
            target_class = classes.get(target)
            if target_class == 'secret':
                f.operand_role = 'secret'
                f.role = 'secret_erased'
                f.notes.append('leaf combine of two raw parameters; faulted operand IS '
                               "the function's manifest secret-buf -> result loses "
                               'dependence on the secret')
            elif target_class in ('fixed', 'other'):
                f.operand_role = 'public'
                f.role = 'secret_preserved'
                f.notes.append('leaf combine of two raw parameters; faulted operand is '
                               'the non-secret side -> result collapses to (a known '
                               "function of) the secret, unchanged information-wise")
            else:  # unresolved-manifest
                f.operand_role = 'unresolved'
                f.notes.append('manifest secret-buf name does not match this function\'s '
                               'own parameters and no call site confirmed it; falling back '
                               'to structural analysis')
                f.tier = '2-structural'
                target_raw = False  # fall through to tier 2 below

        if not target_raw:
            f.tier = '2-structural'
            roles = _structural_binop_roles(fn, ins)
            r = roles.get(target, 'fresh')
            f.operand_role = r
            f.is_public_operand = _is_public_value(fn, target)
            if r == 'accumulator':
                f.role = 'accumulator'
                f.notes.append('mixed/circuit value; faulting the accumulator operand '
                               'resets the partial sum (isolatable)')
            elif f.is_public_operand:
                f.role = 'public_const'
                f.notes.append('mixed/circuit value; faulted operand is a public '
                               'constant/shift amount -> known re-indexing/offset')
            else:
                f.role = 'fresh_term'
                f.notes.append('mixed/circuit value; faulting the fresh-term operand '
                               '(first touch inside a multi-gate computation)')

        if ins.defines:
            consumer_store = next((s for s in fn.instrs
                                   if s.kind == 'store' and s.stored_value == ins.defines), None)
            if consumer_store is not None:
                f.dilution_count = _pointer_written_again_after(fn, consumer_store.ptr, consumer_store.index)
            f.reaches_output = _reaches_ret_or_out_store(fn, ins.defines)
            f.linear_path = f.linear_path and _path_is_linear(fn, ins.defines)
        return f

    f.notes.append('unhandled fault kind')
    return f