"""
interpret.py (v2)
------------------
Ties everything together and validates against the REAL fault-detection
report (not a hand-built fixture):

  1. parse the .ll (subset or full module)
  2. parse the markdown report -> {func: {label: ReportEntry}}
  3. for every label in every requested function, decode it into a FaultSite,
     look up the actual instruction kind at that index to disambiguate
     "_mem" into 'load' or 'store', extract features (manifest-aware), apply
     rules, and compare the predicted verdict to the report's ground truth.

Usage:
  python interpret.py mayo1_subset.ll report.md mayo.json --funcs add_f,sub_f,...
"""

import argparse
import sys
from collections import Counter

from ir_parser import parse_ll, build_callsite_index
from manifest import Manifest
from features import FaultSite, extract
from rules import apply_rules
from report_parser import parse_report, decode_label


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('ll')
    ap.add_argument('report')
    ap.add_argument('manifest')
    ap.add_argument('--funcs', default=None,
                    help='comma-separated function names to validate; default = all '
                         'functions present in both the .ll and the report')
    ap.add_argument('--out', default='interpretation.json')
    args = ap.parse_args()

    funcs_ir = parse_ll(args.ll)
    callsite_index = build_callsite_index(funcs_ir)
    manifest = Manifest(args.manifest)
    report = parse_report(args.report)

    if args.funcs:
        target_funcs = [f.strip() for f in args.funcs.split(',')]
    else:
        target_funcs = [f for f in report if f in funcs_ir]

    confusion = Counter()
    pattern_counts = Counter()
    rows = []

    for func in target_funcs:
        if func not in funcs_ir:
            print(f'[skip] {func}: not present in parsed .ll', file=sys.stderr)
            continue
        if func not in report:
            print(f'[skip] {func}: no report entries', file=sys.stderr)
            continue
        fn = funcs_ir[func]
        print(f'\n### {func}({", ".join(fn.params)})')
        for label, entry in sorted(report[func].items()):
            site = decode_label(func, label)
            if site is None:
                print(f'  [warn] could not decode label: {label}', file=sys.stderr)
                continue
            # disambiguate 'load_or_store' using the real instruction kind
            if site.fault_kind == 'load_or_store':
                real_ins = fn.by_index.get(site.index)
                if real_ins is None:
                    print(f'  [warn] {label}: index {site.index} not found in {func}', file=sys.stderr)
                    continue
                site.fault_kind = real_ins.kind  # 'load' or 'store'
                if site.fault_kind not in ('load', 'store'):
                    print(f'  [warn] {label}: report expects a load/store at index '
                         f'{site.index}, but the parser found a {site.fault_kind!r} '
                         f'instruction there instead ({real_ins.text!r}). This usually '
                         f'means the report\'s line numbering and this .ll\'s instruction '
                         f'numbering have drifted apart for {func} - verdict below is '
                         f'unreliable for this site.', file=sys.stderr)

            feats = extract(fn, site, manifest=manifest, funcs=funcs_ir,
                            callsite_index=callsite_index)
            pattern, pred, reason = apply_rules(feats)
            pattern_counts[pattern] += 1

            actual = bool(entry.correction or entry.ineffective)
            confusion[(pred, actual)] += 1
            mark = 'EXPL' if pred else 'safe'
            chk = 'OK' if pred == actual else '<== MISMATCH'
            print(f'  {label:70} {pattern:28} {mark:4} {chk}')

            rows.append({
                'label': label, 'func': func, 'index': site.index,
                'fault_kind': site.fault_kind, 'pattern': pattern,
                'predicted_exploitable': pred, 'actual_exploitable': actual,
                'tier': feats.tier, 'role': feats.role,
                'operand_role': feats.operand_role,
                'param_classes': feats.param_classes,
                'reason': reason,
            })

    print('\n== pattern distribution ==')
    for p, n in pattern_counts.most_common():
        print(f'  {p:32} {n}')

    if confusion:
        tp = confusion[(True, True)]
        tn = confusion[(False, False)]
        fp = confusion[(True, False)]
        fn_ = confusion[(False, True)]
        total = tp + tn + fp + fn_
        print('\n== validation against real report ==')
        print(f'  accuracy       : {(tp+tn)/total:.3f}  ({tp+tn}/{total})')
        print(f'  true-positive  : {tp}   false-positive: {fp}')
        print(f'  true-negative  : {tn}   false-negative: {fn_}')

    import json
    with open(args.out, 'w') as f:
        json.dump(rows, f, indent=2)
    print(f'\nwrote {args.out} ({len(rows)} fault sites)')


if __name__ == '__main__':
    main()