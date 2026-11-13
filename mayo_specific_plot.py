#!/usr/bin/env python3
"""
Scan tests_mayo/ for the two MAYO scheme-specific fault reports and plot both,
per function, in one grouped bar chart:

  1. weak-system (linearity) faults -- weak_system_compute_P3_report.json with
     "weak_system_detected": true. The function's output collapsed from a
     GF(16)-nonlinear map in the correct binary to a GF(16)-linear map in the
     faulty binary (the adversary then solves a linear system for the oil O).

  2. vinegar (entropy) faults -- vinegar_dist_report.json with
     "collapse_detected": true. As the secret seed varies the correct build's
     vinegar carries ~log2(16)=4 bits of entropy per position, while the faulty
     build freezes it (near 0 bits), so the vinegar becomes secret-independent.

Folder convention (see report.sh for the equivalent traversal):

    tests_mayo/<function>/<fault-class>/.../<fault-folder>/<report>.json

<function>     -- top-level folder directly under tests_mayo/, e.g. P1_times_O
<fault-folder> -- the report's immediate parent dir

Usage:
    python3 mayo_specific_plot.py
    python3 mayo_specific_plot.py --root tests_mayo --out reports/faults/specific/mayo_specific_faults.png
"""
import argparse
import glob
import json
import os
import sys
from collections import Counter

DEFAULT_OUT = "reports/faults/specific/mayo_specific_faults.png"

WEAK_REPORT = "weak_system_compute_P3_report.json"
VINEGAR_REPORT = "vinegar_dist_report.json"

# Shared categorical palette (matches generic_tests_plot.py).
COLOR_WEAK = "#eb6834"     # weak-system / linearity collapse (orange)
COLOR_VINEGAR = "#2a78d6"  # vinegar entropy collapse         (blue)
COLOR_GRID = "#d9d8d2"
COLOR_TEXT = "#0b0b0b"
COLOR_TEXT_MUTED = "#52514e"
COLOR_BG = "#fcfcfb"


def find_reports(root, name):
    return sorted(glob.glob(os.path.join(root, "**", name), recursive=True))


def _loc(path, root):
    """(function, fault) from a report path, per the folder convention."""
    rel = os.path.relpath(path, root)
    parts = rel.split(os.sep)
    function = parts[0]
    fault = parts[-2] if len(parts) >= 2 else "(root)"
    return function, fault


def collect(root, name, detected_key):
    """Return (flagged, n_scanned). flagged: list of {function, fault, path}."""
    flagged = []
    n_scanned = 0
    for path in find_reports(root, name):
        n_scanned += 1
        try:
            with open(path) as f:
                data = json.load(f)
        except (OSError, json.JSONDecodeError) as e:
            print(f"[!] skipping unreadable report {path}: {e}", file=sys.stderr)
            continue
        if not data.get(detected_key):
            continue
        function, fault = _loc(path, root)
        flagged.append({"function": function, "fault": fault, "path": path})
    return flagged, n_scanned


def print_report(label, flagged, n_scanned):
    print(f"== {label} ==")
    if n_scanned == 0:
        print("  no reports found.\n")
        return
    by_func = Counter(i["function"] for i in flagged)
    if not flagged:
        print(f"  {n_scanned} report(s) scanned, 0 flagged.\n")
        return
    for function in sorted(by_func, key=lambda f: (-by_func[f], f)):
        print(f"  {function}: {by_func[function]} flagged")
    print(f"  -> {len(flagged)} flagged across {len(by_func)} function(s) "
          f"of {n_scanned} scanned.\n")


def plot(weak, vinegar, out_path):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    import matplotlib.ticker

    weak_by = Counter(i["function"] for i in weak)
    vin_by = Counter(i["function"] for i in vinegar)
    funcs = sorted(set(weak_by) | set(vin_by),
                   key=lambda f: (weak_by[f] + vin_by[f], f))  # bottom-up

    if not funcs:
        print("Nothing to plot (no weak-system or vinegar faults flagged).")
        return

    fig, ax = plt.subplots(figsize=(11, max(3.2, 0.5 * len(funcs) + 1.6)), dpi=150)
    fig.patch.set_facecolor(COLOR_BG)
    ax.set_facecolor(COLOR_BG)

    y = list(range(len(funcs)))
    h = 0.38
    wv = [weak_by[f] for f in funcs]
    vv = [vin_by[f] for f in funcs]
    ax.barh([yi + h / 2 for yi in y], wv, height=h, color=COLOR_WEAK, zorder=3,
            label="weak-system (linearity)")
    ax.barh([yi - h / 2 for yi in y], vv, height=h, color=COLOR_VINEGAR, zorder=3,
            label="vinegar (entropy collapse)")

    ax.set_yticks(y)
    ax.set_yticklabels(funcs, fontsize=8, color=COLOR_TEXT)
    ax.set_xlabel("faults flagged", fontsize=9, color=COLOR_TEXT_MUTED)
    ax.set_title(f"MAYO scheme-specific faults: "
                 f"{len(weak)} weak-system + {len(vinegar)} vinegar "
                 f"across {len(funcs)} function(s)",
                 fontsize=12, color=COLOR_TEXT, loc="left", pad=10)
    ax.set_xlim(0, max(wv + vv) + 1)
    ax.xaxis.set_major_locator(matplotlib.ticker.MaxNLocator(integer=True))
    ax.grid(axis="x", color=COLOR_GRID, linewidth=0.8, zorder=0)
    ax.set_axisbelow(True)
    for sp in ("top", "right"):
        ax.spines[sp].set_visible(False)
    for sp in ("left", "bottom"):
        ax.spines[sp].set_color(COLOR_GRID)
    for yi, v in zip(y, wv):
        if v:
            ax.text(v + 0.05, yi + h / 2, str(v), va="center", fontsize=7.5,
                    color=COLOR_TEXT_MUTED)
    for yi, v in zip(y, vv):
        if v:
            ax.text(v + 0.05, yi - h / 2, str(v), va="center", fontsize=7.5,
                    color=COLOR_TEXT_MUTED)
    ax.legend(loc="lower right", frameon=False, fontsize=9,
              labelcolor=COLOR_TEXT_MUTED)

    fig.tight_layout()
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    fig.savefig(out_path, facecolor=fig.get_facecolor())
    print(f"[+] wrote {out_path}")


def main():
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--root", default="tests_mayo",
                    help="root folder to scan (default: tests_mayo)")
    ap.add_argument("--out", default=DEFAULT_OUT,
                    help=f"output image path (default: {DEFAULT_OUT})")
    args = ap.parse_args()

    if not os.path.isdir(args.root):
        print(f"[!] root not found: {args.root}", file=sys.stderr)
        sys.exit(1)

    weak, n_weak = collect(args.root, WEAK_REPORT, "weak_system_detected")
    vinegar, n_vin = collect(args.root, VINEGAR_REPORT, "collapse_detected")

    print_report("weak-system (linearity)", weak, n_weak)
    print_report("vinegar (entropy collapse)", vinegar, n_vin)
    plot(weak, vinegar, args.out)


if __name__ == "__main__":
    main()
