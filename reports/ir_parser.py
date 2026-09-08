"""
ir_parser.py (v2)
------------------
Same regex-based textual .ll reader as before, extended with:

  * Function.params      - ordered list of formal parameter SSA names (no %),
                            parsed from the `define ...(...)` line.
  * Instr.phi_values      - for phi instructions, the list of *incoming value*
                            operands only (block-label operands stripped out).
                            Needed so parameter resolution doesn't get
                            confused by basic-block labels that also happen
                            to be %-prefixed identifiers.
  * CallSite records      - module-level list of (caller, callee, arg_names)
                            so manifest secret-buf names that only appear at
                            a call site (not in the callee's own signature,
                            e.g. mat_add's "Ox") can be resolved by position.

Everything else (kind classification, load/store ptr extraction, etc.) is
unchanged from v1.
"""

import re
from dataclasses import dataclass, field
from typing import Optional


_FUNC_DEF_RE = re.compile(r'^\s*define\b.*@([A-Za-z0-9_.$]+)\s*\(')
_ASSIGN_RE = re.compile(r'^\s*(%[A-Za-z0-9_.$]+)\s*=\s*(.*)$')
_LABEL_RE = re.compile(r'^\s*([A-Za-z0-9_.$]+):')
_SSA_USE_RE = re.compile(r'%[A-Za-z0-9_.$]+')
_CALLEE_RE = re.compile(r'call\b.*?@([A-Za-z0-9_.$]+)\s*\(')
_PHI_PAIR_RE = re.compile(r'\[\s*([^,\[\]]+?)\s*,\s*%[A-Za-z0-9_.$]+\s*\]')
# a formal parameter in a `define` argument list: possibly preceded by type
# and attributes, ending in %name
_PARAM_NAME_RE = re.compile(r'%[A-Za-z0-9_.$]+(?=\s*[,)])')
# a call's argument list item ending in a %name (used for call-site scanning)
_CALL_ARG_RE = re.compile(r'%[A-Za-z0-9_.$]+(?=\s*[,)])')


def _classify(rest: str) -> str:
    r = rest.strip()
    if r.startswith('alloca'):
        return 'alloca'
    if r.startswith('load'):
        return 'load'
    if r.startswith('store'):
        return 'store'
    if r.startswith('getelementptr'):
        return 'gep'
    if r.startswith('phi'):
        return 'phi'
    if r.startswith('call') or ' call ' in ' ' + r:
        return 'call'
    for op in ('xor', 'and', 'or ', 'add', 'sub', 'mul', 'shl', 'lshr', 'ashr', 'select'):
        if r.startswith(op):
            return 'binop'
    if r.startswith('ret'):
        return 'ret'
    if r.startswith('br') or r.startswith('icmp'):
        return 'control'
    return 'other'


@dataclass
class Instr:
    index: int
    text: str
    kind: str
    defines: Optional[str] = None
    uses: list = field(default_factory=list)
    callee: Optional[str] = None
    ptr: Optional[str] = None
    stored_value: Optional[str] = None
    phi_values: list = field(default_factory=list)   # incoming VALUES only
    call_args: list = field(default_factory=list)     # for CallInst: arg SSA names in order


@dataclass
class Function:
    name: str
    params: list                # ordered list of formal-parameter names (no '%')
    instrs: list
    by_index: dict


def _parse_store(rest: str):
    core = rest.split('!', 1)[0]
    m = re.search(r'store\s+[^,]*?\s+(%[A-Za-z0-9_.$]+|[-0-9]+)\s*,\s*ptr\s+(%[A-Za-z0-9_.$]+)', core)
    if not m:
        m2 = re.search(r',\s*ptr\s+(%[A-Za-z0-9_.$]+)', core)
        ptr = m2.group(1) if m2 else None
        return None, ptr
    val = m.group(1) if m.group(1).startswith('%') else None
    return val, m.group(2)


def _parse_load_ptr(rest: str):
    core = rest.split('!', 1)[0]
    m = re.search(r'load\s+[^,]*?,\s*ptr\s+(%[A-Za-z0-9_.$]+)', core)
    return m.group(1) if m else None


def _uses_in(text_after_eq_or_full: str, exclude_def: Optional[str]):
    body = text_after_eq_or_full.split('!', 1)[0]
    seen = []
    for m in _SSA_USE_RE.finditer(body):
        name = m.group(0)
        if name == exclude_def:
            continue
        if name not in seen:
            seen.append(name)
    return seen


def _parse_phi_values(rest: str):
    """Extract only the *value* half of each [value, %label] pair."""
    core = rest.split('!', 1)[0]
    vals = []
    for m in _PHI_PAIR_RE.finditer(core):
        v = m.group(1).strip()
        if v not in vals:
            vals.append(v)
    return vals


def _parse_call_args(rest: str):
    """Best-effort ordered list of %-prefixed argument SSA names in a call."""
    core = rest.split('!', 1)[0]
    # isolate the parenthesised argument list of the call (first '(' ... last ')')
    lp = core.find('(')
    rp = core.rfind(')')
    if lp == -1 or rp == -1 or rp < lp:
        return []
    arglist = core[lp + 1:rp]
    args = []
    for m in _CALL_ARG_RE.finditer(arglist):
        args.append(m.group(0))
    return args


_AT_NAME_RE = re.compile(r'@[A-Za-z0-9_.$]+')


def _parse_params(define_line: str):
    """Extract the ordered formal-parameter %names from a `define ...(...)` line.

    IMPORTANT: the return type can itself contain a parenthesised attribute
    before the function name, e.g.
        define ... range(i8 0, 16) i8 @mul_f(i8 %a, i8 %b) ...
    so the argument list's opening '(' must be found *after* the `@name`
    token, not just as the first '(' in the line (which would wrongly grab
    the `range(...)` attribute instead).
    """
    name_m = _AT_NAME_RE.search(define_line)
    search_from = name_m.end() if name_m else 0
    lp = define_line.find('(', search_from)
    if lp == -1:
        return []
    depth = 0
    end = None
    for i in range(lp, len(define_line)):
        if define_line[i] == '(':
            depth += 1
        elif define_line[i] == ')':
            depth -= 1
            if depth == 0:
                end = i
                break
    if end is None:
        end = len(define_line)
    arglist = define_line[lp + 1:end]
    names = []
    for m in _PARAM_NAME_RE.finditer(arglist + ')'):
        names.append(m.group(0).lstrip('%'))
    return names


def iter_function_instructions(lines):
    idx = 0
    for raw in lines:
        s = raw.rstrip('\n')
        stripped = s.strip()
        if not stripped:
            continue
        if stripped.startswith(';'):
            continue
        if stripped.startswith('#dbg') or stripped.startswith('#loc'):
            continue
        if stripped in ('{', '}'):
            continue

        m = _ASSIGN_RE.match(s)
        if m:
            defines, rest = m.group(1), m.group(2)
        else:
            if re.match(r'^[A-Za-z0-9_.$]+:', stripped):
                continue
            defines, rest = None, stripped

        kind = _classify(rest)
        instr = Instr(index=idx, text=stripped, kind=kind, defines=defines)

        if kind == 'call':
            cm = _CALLEE_RE.search(rest)
            instr.callee = cm.group(1) if cm else None
            instr.call_args = _parse_call_args(rest)
        if kind == 'load':
            instr.ptr = _parse_load_ptr(rest)
        if kind == 'store':
            instr.stored_value, instr.ptr = _parse_store(rest)
        if kind == 'phi':
            instr.phi_values = _parse_phi_values(rest)

        instr.uses = _uses_in(rest, defines)
        yield instr
        idx += 1


def parse_ll(path):
    with open(path) as f:
        text = f.readlines()

    funcs = {}
    i = 0
    n = len(text)
    while i < n:
        m = _FUNC_DEF_RE.match(text[i])
        if not m:
            i += 1
            continue
        name = m.group(1)
        define_line = text[i]
        # define lines can wrap; join forward until we see the opening '{'
        j = i
        joined = define_line
        while '{' not in joined and j + 1 < n:
            j += 1
            joined += text[j]
        params = _parse_params(joined)

        body = []
        i = j + 1
        depth = 1
        while i < n and depth > 0:
            line = text[i]
            depth += line.count('{') - line.count('}')
            if depth <= 0:
                break
            body.append(line)
            i += 1
        i += 1

        instrs = list(iter_function_instructions(body))
        funcs[name] = Function(name=name, params=params, instrs=instrs,
                               by_index={ins.index: ins for ins in instrs})
    return funcs


def build_callsite_index(funcs):
    """
    Module-wide index: callee_name -> list of (caller_name, [arg_names_in_order]).
    Used to resolve manifest secret-buf names that only exist as a caller-side
    variable name (not as one of the callee's own formal parameters).
    """
    index = {}
    for caller_name, fn in funcs.items():
        for ins in fn.instrs:
            if ins.kind == 'call' and ins.callee:
                index.setdefault(ins.callee, []).append((caller_name, ins.call_args))
    return index


if __name__ == '__main__':
    import sys
    fns = parse_ll(sys.argv[1])
    for name, fn in fns.items():
        print(f'== {name}({", ".join(fn.params)}) ({len(fn.instrs)} instrs) ==')