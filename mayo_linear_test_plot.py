#!/usr/bin/env python3
"""
Scan tests_mayo/ for weak_system_compute_P3_report.json files and plot the
faults where a "weak system" was detected (i.e. the function's output
collapsed from a GF(16)-nonlinear map in the correct binary to a GF(16)-linear
map in the faulty binary).

Folder convention (see report.sh for the equivalent traversal used for the
correction/ineffective reports):

    tests_mayo/<function>/<fault-class>/.../<fault-folder>/weak_system_compute_P3_report.json

<function>   -- top-level folder directly under tests_mayo/, e.g. P1_times_O
<fault-folder> -- the report's immediate parent dir, e.g.
                  gated_P1_times_O_fnSkip_mul_add_m_upper_triangular_mat_x_mat_line0

Usage:
    python3 mayo_linear_test_plot.py [--root tests_mayo] [--out mayo_weak_system_faults.png]
"""
import argparse
import glob
import json
import os
import sys
from collections import defaultdict

# Palette slots 1 (blue) and 2 (orange) from the shared categorical palette --
# used here for the two-series "correct vs faulty" comparison.
COLOR_CORRECT = "#2a78d6"
COLOR_FAULTY = "#eb6834"


def find_reports(root):
    pattern = os.path.join(root, "**", "weak_system_compute_P3_report.json")
    return sorted(glob.glob(pattern, recursive=True))


def residual_pct(entries):
    """entries is the one-element list under results.correct / results.faulty."""
    e = entries[0]
    if e["n_nibbles"] == 0:
        return 0.0
    return 100.0 * e["nonzero_residual"] / e["n_nibbles"]


def collect_flagged(root):
    """Returns list of dicts: function, fault, correct_pct, faulty_pct, path."""
    flagged = []
    for path in find_reports(root):
        with open(path) as f:
            data = json.load(f)
        if not data.get("weak_system_detected"):
            continue
        rel = os.path.relpath(path, root)
        parts = rel.split(os.sep)
        function = parts[0]
        fault = parts[-2] if len(parts) >= 2 else "(root)"
        flagged.append({
            "function": function,
            "fault": fault,
            "correct_pct": residual_pct(data["results"]["correct"]),
            "faulty_pct": residual_pct(data["results"]["faulty"]),
            "path": path,
        })
    return flagged


def print_report(flagged):
    by_func = defaultdict(list)
    for item in flagged:
        by_func[item["function"]].append(item)

    if not flagged:
        print("No weak-system faults detected under this root.")
        return

    print("Weak-system faults detected (correct output is nonlinear in the")
    print("secret, faulty output collapses to linear):\n")
    for function in sorted(by_func):
        print(f"== {function} ==")
        for item in by_func[function]:
            print(f"  {item['fault']}")
        print(f"  -> {len(by_func[function])} flagged")
        print()
    print(f"Total flagged faults: {len(flagged)} across {len(by_func)} function(s).")


def plot(flagged, out_path):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    import matplotlib.ticker

    if not flagged:
        print("Nothing to plot.")
        return

    counts = defaultdict(int)
    for d in flagged:
        counts[d["function"]] += 1
    funcs = sorted(counts, key=lambda f: (-counts[f], f))
    vals = [counts[f] for f in funcs]

    fig, ax = plt.subplots(figsize=(10, max(3.0, 0.45 * len(funcs) + 1.5)))
    y = list(range(len(funcs)))
    ax.barh(y, vals, height=0.6, color=COLOR_FAULTY, zorder=3)
    ax.set_yticks(y)
    ax.set_yticklabels(funcs, fontsize=8)
    ax.invert_yaxis()
    ax.set_xlabel("faults flagged as weak system (output collapsed to linear)")
    ax.set_title(f"MAYO weak-system faults: {len(flagged)} flagged across "
                 f"{len(funcs)} function(s)")
    ax.set_xlim(0, max(vals) + 1)
    ax.xaxis.set_major_locator(matplotlib.ticker.MaxNLocator(integer=True))
    ax.grid(axis="x", color="#dddddd", linewidth=0.8, zorder=0)
    ax.set_axisbelow(True)
    for spine in ("top", "right"):
        ax.spines[spine].set_visible(False)
    for yi, v in zip(y, vals):
        ax.text(v + 0.05, yi, str(v), va="center", fontsize=8, color="#333333")

    fig.tight_layout()
    fig.savefig(out_path, dpi=150)
    print(f"[+] wrote {out_path}")


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                  formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--root", default="tests_mayo",
                     help="root folder to scan (default: tests_mayo)")
    ap.add_argument("--out", default="mayo_weak_system_faults.png",
                     help="output image path (default: mayo_weak_system_faults.png)")
    args = ap.parse_args()

    if not os.path.isdir(args.root):
        print(f"[!] root not found: {args.root}", file=sys.stderr)
        sys.exit(1)

    flagged = collect_flagged(args.root)
    print_report(flagged)
    plot(flagged, args.out)


if __name__ == "__main__":
    main()
