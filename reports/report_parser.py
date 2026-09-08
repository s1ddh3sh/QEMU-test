"""
report_parser.py
-----------------
Parses the "Fault Detection Report" markdown (### <func> headings followed by
a `| Fault | Correction test | Ineffective test |` table) into, per function:
    label -> (correction_bool, ineffective_bool)

and decodes each fault label into a FaultSite (function, instruction index,
fault_kind) using the three label grammars established across the whole
conversation:
    {func}_fnSkip_{callee}_line{idx}
    {func}_line{idx}_mem
    {func}_line{idx}_{opA|opB|opC|undef|zero}

Some function names in the report contain digits/dots themselves
(mul_f.23, lincomb.24, ...); the decoder is careful to strip the function
name prefix first (it's given by the section heading) rather than re-deriving
it from the label, so those names cause no ambiguity.
"""

import re
from dataclasses import dataclass

from features import FaultSite

_SECTION_RE = re.compile(r'^###\s+(\S+)\s*$', re.M)
_ROW_RE = re.compile(r'^\|\s*`([^`]+)`\s*\|\s*([✅—-]+)\s*\|\s*([✅—-]+)\s*\|', re.M)

_FNSKIP_RE = re.compile(r'_fnSkip_(.+)_line(\d+)$')
# NOTE: these two match against `rest` (the label with the function-name
# prefix already stripped), so there is NO leading underscore before "line".
_MEM_RE = re.compile(r'^line(\d+)_mem$')
_BINOP_RE = re.compile(r'^line(\d+)_(opA|opB|opC|undef|zero)$')


@dataclass
class ReportEntry:
    label: str
    correction: bool
    ineffective: bool


def _cell_is_check(cell):
    return '✅' in cell


def parse_report(path):
    """Returns {func_name: {label: ReportEntry}} for every ### section that
    has an actual fault table (sections with "_No result files found._" are
    skipped since they carry no ground truth)."""
    with open(path) as f:
        text = f.read()

    sections = {}
    matches = list(_SECTION_RE.finditer(text))
    for i, m in enumerate(matches):
        func = m.group(1)
        start = m.end()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(text)
        body = text[start:end]
        rows = {}
        for rm in _ROW_RE.finditer(body):
            label, corr_cell, ineff_cell = rm.group(1), rm.group(2), rm.group(3)
            rows[label] = ReportEntry(label, _cell_is_check(corr_cell), _cell_is_check(ineff_cell))
        if rows:
            # a function may appear in multiple report sections (e.g. tests_mayo
            # and tests_kyber); merge, keeping first-seen on collision
            sections.setdefault(func, {}).update(rows)
    return sections


def decode_label(func, label):
    """Strip the function-name prefix and parse the remainder into a FaultSite.
    Returns None if the label doesn't match a known grammar (shouldn't happen
    for well-formed reports, but fails soft rather than raising)."""
    prefix = func + '_'
    if not label.startswith(prefix):
        return None
    rest = label[len(prefix):]

    m = _FNSKIP_RE.search(label)
    if m:
        callee, idx = m.group(1), int(m.group(2))
        # callee group may have swallowed a leading "fnSkip_" duplicate-safe;
        # re-derive cleanly:
        after_fnskip = label.split('_fnSkip_', 1)[1]
        callee2, idxstr = after_fnskip.rsplit('_line', 1)
        return FaultSite(func, int(idxstr), f'fnSkip:{callee2}', label)

    m = _MEM_RE.search(rest)
    if m:
        return FaultSite(func, int(m.group(1)), 'load_or_store', label)

    m = _BINOP_RE.search(rest)
    if m:
        idx, variant = int(m.group(1)), m.group(2)
        return FaultSite(func, idx, f'binop:{variant}', label)

    return None