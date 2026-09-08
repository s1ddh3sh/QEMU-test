"""
diagnose.py
-----------
Run this AFTER interpret.py has written its --out JSON (default
interpretation_v2.json). Breaks accuracy down per function, and separately
reports how many fault sites per function had NO manifest entry at all
(meaning Tier-1 M1-M4 rules could never fire for them) - the fastest way to
tell whether the accuracy collapse is "unvalidated complex functions with
real dilution my checks miss" vs "no manifest coverage" vs "index
misalignment concentrated in a few functions".

Usage:
  python diagnose.py interpretation_v2.json mayo.json
"""
import json
import sys
from collections import defaultdict


def main():
    results_path, manifest_path = sys.argv[1], sys.argv[2]
    rows = json.load(open(results_path))
    manifest = json.load(open(manifest_path))

    per_func = defaultdict(lambda: {'tp': 0, 'tn': 0, 'fp': 0, 'fn': 0,
                                    'patterns': defaultdict(int)})

    for r in rows:
        func = r['func']
        pred, actual = r['predicted_exploitable'], r['actual_exploitable']
        d = per_func[func]
        d['patterns'][r['pattern']] += 1
        if pred and actual:
            d['tp'] += 1
        elif not pred and not actual:
            d['tn'] += 1
        elif pred and not actual:
            d['fp'] += 1
        else:
            d['fn'] += 1

    print(f'{"function":45} {"n":>4} {"acc":>6} {"TP":>4} {"TN":>4} {"FP":>4} {"FN":>4}  manifest?  top pattern')
    for func, d in sorted(per_func.items(), key=lambda kv: -(kv[1]['fp'])):
        n = d['tp'] + d['tn'] + d['fp'] + d['fn']
        acc = (d['tp'] + d['tn']) / n if n else 0
        has_manifest = 'yes' if func in manifest else 'NO'
        top_pattern = max(d['patterns'].items(), key=lambda kv: kv[1])[0]
        print(f'{func:45} {n:4} {acc:6.2f} {d["tp"]:4} {d["tn"]:4} {d["fp"]:4} {d["fn"]:4}  '
              f'{has_manifest:>9}  {top_pattern}')


if __name__ == '__main__':
    main()