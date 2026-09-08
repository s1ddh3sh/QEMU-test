"""
resolve.py
----------
Two jobs:

1. resolve_to_param(fn, ssa_name): walk an SSA value backward through
   load / getelementptr / phi(passthrough) instructions until it bottoms out
   at one of the function's own formal parameters (or a global / dead end).
   Returns (param_name_or_None, purity) where purity is:
     'raw'   - the value is an *unmodified* copy of the parameter (only
               loads/geps/phi-passthroughs in the chain) - e.g. `%a` itself,
               or `load (gep %buf, i)`.
     'mixed' - the chain passed through at least one arithmetic/logic op
               (xor/and/mul/shl/...) before bottoming out - e.g. mul_f's
               `%2 = and %xor1, 2` where %xor1 already mixed two inputs.
   Only a 'raw' resolution licenses the simple secret/public erasure rule;
   a 'mixed' resolution means we are inside a multi-gate circuit and must
   fall back to the isolatable-term / dilution analysis instead.

2. resolve_secret_param_via_callsites(manifest, funcs, callsite_index, func):
   for a function whose manifest secret-buf name doesn't match any of its own
   formal parameters (e.g. mat_add's "Ox"), search every call site to that
   function in the module for an argument literally named after the manifest
   string, and map that argument's *position* to the callee's own formal
   parameter name at that position. Caches the result on the manifest so it
   only has to be found once. Returns the resolved parameter name, or None if
   no call site could confirm it (in which case classification for that
   function's binops stays 'unresolved-manifest' and the tool must fall back
   to the older heuristic rather than guess).
"""

ARITH_KINDS = {'binop'}


def resolve_to_param(fn, ssa_name, _seen=None):
    """Returns (base_name_or_None, purity: 'raw'|'mixed'|None).

    'base_name' is either one of fn's formal parameters, OR the SSA name of a
    local `alloca` (a named local buffer, e.g. compute_A's %A or shake256's
    %t). Both count as a legitimate resolution target: the manifest-driven
    secret/public rule only ever looks up *parameter* names (a local alloca
    will simply never match a manifest secret-buf name and so classifies as
    'other'), while the general-purpose dilution check in this module treats
    either kind of base interchangeably - what matters there is just "which
    named buffer does this ultimately touch".
    """
    if _seen is None:
        _seen = set()
    if ssa_name is None:
        return None, None
    if ssa_name.lstrip('-').isdigit():
        return None, None  # a literal constant, not a buffer reference
    bare = ssa_name.lstrip('%')
    if bare in fn.params:
        return bare, 'raw'
    if ssa_name in _seen:
        return None, None
    _seen.add(ssa_name)

    definer = next((i for i in fn.instrs if i.defines == ssa_name), None)
    if definer is None:
        return None, None  # e.g. a global, or genuinely unresolved

    if definer.kind == 'alloca':
        return ssa_name, 'raw'
    if definer.kind == 'load':
        return resolve_to_param(fn, definer.ptr, _seen)
    if definer.kind == 'gep':
        base = definer.uses[0] if definer.uses else None
        return resolve_to_param(fn, base, _seen)
    if definer.kind == 'phi':
        # Try each incoming value; prefer the first one that resolves cleanly
        # (in every case seen so far, the "outer"/entry-edge value - which is
        # what a first-iteration fault actually touches - is listed first).
        best = (None, None)
        for v in definer.phi_values:
            p, purity = resolve_to_param(fn, v, set(_seen))
            if p is not None:
                return p, purity
        return best
    if definer.kind in ARITH_KINDS:
        # Passed through arithmetic: whatever we find further back is 'mixed',
        # even if that deeper value would itself have been 'raw' in isolation.
        for operand in definer.uses:
            p, _ = resolve_to_param(fn, operand, set(_seen))
            if p is not None:
                return p, 'mixed'
        return None, None
    if definer.kind == 'call':
        # A call result is definitionally mixed (opaque w.r.t. its inputs).
        return None, 'mixed'
    return None, None


def base_buffer(fn, ssa_name):
    """Convenience: just the resolved base name (parameter or local alloca),
    ignoring purity. Used by the general dilution check below."""
    b, _ = resolve_to_param(fn, ssa_name)
    return b


def buffer_touched_again(fn, base, after_index):
    """
    General-purpose dilution check, used for BOTH direct load/store faults
    AND fnSkip faults on calls (including void calls with no return value).

    Counts how many instructions *after* `after_index` in `fn` touch the same
    base buffer as `base` - either by storing to a pointer that resolves to
    it, or by passing an argument that resolves to it into another call
    (covering the case where a later stage writes into the buffer only
    indirectly, through a callee, rather than via a direct `store` in `fn`
    itself).

    Deliberately intra-function only: this cannot see whether the buffer was
    *already* populated by an even earlier, different function before `fn`
    was ever called (see the P1_times_O / mayo_keypair discussion in the
    accompanying write-up for why that one extra hop matters and is NOT
    performed here).
    """
    if base is None:
        return 0
    count = 0
    for ins in fn.instrs:
        if ins.index <= after_index:
            continue
        if ins.kind == 'store' and base_buffer(fn, ins.ptr) == base:
            count += 1
        elif ins.kind == 'call':
            if any(base_buffer(fn, a) == base for a in ins.call_args):
                count += 1
    return count


def has_data_accumulator(fn):
    """
    Does this function carry a genuine *data* value across loop iterations
    (like lincomb's running-sum `ret.0`), as opposed to only loop-control phis
    (index counters, advancing pointers used purely for addressing)?

    Heuristic: a phi counts as a data accumulator if its defined value is used
    directly (one hop) as a call argument or as the value of a `ret`. Pure
    index/pointer-advance phis are only ever consumed by icmp/gep/add-by-1 and
    never flow into a call or return themselves.

    This matters because the secret/public load-fault split derived from
    mat_add (secret load = exploitable, public load = not) was validated on a
    *flat* combine with independent per-position outputs; a function with a
    genuine running accumulator (lincomb) behaves differently - corrupting
    either raw input to the very first accumulation step is exploitable
    regardless of which one is the manifest secret, because what matters is
    isolating the first term of the sum, not which buffer it came from.
    """
    for ins in fn.instrs:
        if ins.kind != 'phi' or ins.defines is None:
            continue
        for consumer in fn.instrs:
            if ins.defines in consumer.uses or ins.defines in consumer.call_args:
                if consumer.kind in ('call', 'ret'):
                    return True
    return False


def resolve_secret_param_via_callsites(manifest, funcs, callsite_index, func):
    """Best-effort: find the manifest's secret-buf name as a literal argument
    at some call site to `func`, and map its position to func's own formal
    parameter name. Caches + returns the resolved name, or None."""
    cached = manifest.resolved_secret_param(func)
    if cached is not None:
        return cached
    secret_name = manifest.secret_buf_name(func)
    if not secret_name:
        return None
    fn = funcs.get(func)
    if fn is None:
        return None
    if secret_name in fn.params:
        # direct match; no call-site search needed (classify_param handles this
        # path already, but we cache it here too for uniformity)
        manifest.set_resolved_secret_param(func, secret_name)
        return secret_name

    for caller_name, arg_names in callsite_index.get(func, []):
        for pos, arg in enumerate(arg_names):
            if arg.lstrip('%') == secret_name:
                if pos < len(fn.params):
                    resolved = fn.params[pos]
                    manifest.set_resolved_secret_param(func, resolved)
                    return resolved
    return None