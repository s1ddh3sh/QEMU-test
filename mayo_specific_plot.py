#!/usr/bin/env python3
"""
Scan every UOV-based scheme (MAYO, MAYO-round3, SNOVA, QR-UOV) for its two
scheme-specific fault reports and plot both per function, one panel per scheme:

  1. weak-system (linearity) faults -- weak_system_*_report.json with
     "weak_system_detected": true. The function's output collapsed from a
     GF(q)-nonlinear map in the correct binary to a GF(q)-linear map in the
     faulty binary (the adversary then solves a linear system for the oil O).

  2. vinegar (entropy) faults -- vinegar_dist_report.json with
     "collapse_detected": true. As the swept seed varies the correct build's
     vinegar carries high entropy per position, while the faulty build freezes
     it (near 0 bits), so the vinegar becomes predictable. For MAYO/SNOVA the
     swept seed is the private key; for QR-UOV (randomized vinegar) it is the
     ephemeral vinegar seed seed_y.

Each scheme's results live in its own repo; the folder convention within a root
is the same as report.sh's traversal:

    <root>/<function>/<fault-class>/.../<fault-folder>/<report>.json

<function>     -- top-level folder directly under the scheme root
<fault-folder> -- the report's immediate parent dir

Usage:
    python3 mayo_specific_plot.py
    python3 mayo_specific_plot.py --out reports/faults/specific/uov_based_specific_faults.png
"""
import argparse
import glob
import json
import os
import sys
from collections import Counter

DEFAULT_OUT = "reports/faults/specific/uov_based_specific_faults.png"

WEAK_REPORT = "weak_system_*_report.json"     # compute_P3 (MAYO) / snova / ...
VINEGAR_REPORT = "vinegar_dist_report.json"

# UOV-based schemes and the root each one's result tree lives under. The data
# lives in the per-scheme repos, so these are absolute paths.
SCHEMES = [
    ("MAYO",        "/home/siddhesh/Desktop/test_qemu/tests_mayo"),
    ("MAYO-round3", "/home/siddhesh/Desktop/MAYO-C_Round3/MAYO-C/llvm/test_mayo"),
    ("SNOVA",       "/home/siddhesh/Desktop/SNOVA_LLVM/SNOVA/llvm/test_snova"),
    ("QR-UOV",      "/home/siddhesh/Desktop/QRUOV_LLVM/round2/llvm/test_qruov"),
]

# Shared categorical palette (matches generic_tests_plot.py).
COLOR_WEAK = "#eb6834"     # weak-system / linearity collapse (orange)
COLOR_VINEGAR = "#2a78d6"  # vinegar entropy collapse         (blue)
COLOR_GRID = "#d9d8d2"
COLOR_TEXT = "#0b0b0b"
COLOR_TEXT_MUTED = "#52514e"
COLOR_BG = "#fcfcfb"


def find_reports(root, name):
    # follow symlinks (tests_mayo is a symlink into the MAYO-C repo)
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


def collect_scheme(root):
    """Return a dict with weak/vinegar flagged lists and scan counts."""
    present = os.path.isdir(root)
    weak, n_weak = collect(root, WEAK_REPORT, "weak_system_detected") if present else ([], 0)
    vinegar, n_vin = collect(root, VINEGAR_REPORT, "collapse_detected") if present else ([], 0)
    return {"present": present, "root": root,
            "weak": weak, "n_weak": n_weak,
            "vinegar": vinegar, "n_vin": n_vin}


def print_report(label, res):
    print(f"== {label} ==")
    if not res["present"]:
        print(f"  root not found: {res['root']}\n")
        return
    weak_by = Counter(i["function"] for i in res["weak"])
    vin_by = Counter(i["function"] for i in res["vinegar"])
    funcs = sorted(set(weak_by) | set(vin_by),
                   key=lambda f: (-(weak_by[f] + vin_by[f]), f))
    if not funcs:
        print(f"  {res['n_weak']} weak + {res['n_vin']} vinegar report(s) scanned, "
              "0 flagged.\n")
        return
    for function in funcs:
        parts = []
        if weak_by[function]:
            parts.append(f"weak-system: {weak_by[function]}")
        if vin_by[function]:
            parts.append(f"vinegar: {vin_by[function]}")
        print(f"  {function}: {weak_by[function] + vin_by[function]} flagged "
              f"({', '.join(parts)})")
    print(f"  -> {len(res['weak'])} weak-system + {len(res['vinegar'])} vinegar "
          f"across {len(funcs)} function(s) of "
          f"{res['n_weak'] + res['n_vin']} scanned.\n")


def _panel(ax, label, res):
    ax.set_facecolor(COLOR_BG)
    weak_by = Counter(i["function"] for i in res["weak"])
    vin_by = Counter(i["function"] for i in res["vinegar"])
    funcs = sorted(set(weak_by) | set(vin_by),
                   key=lambda f: (weak_by[f] + vin_by[f], f))  # bottom-up

    if not funcs:
        msg = (f"no leaks flagged\n({res['n_weak'] + res['n_vin']} report(s) scanned)"
               if res["present"] else f"root not found:\n{res['root']}")
        ax.text(0.5, 0.5, msg, ha="center", va="center", fontsize=10,
                color=COLOR_TEXT_MUTED, transform=ax.transAxes)
        ax.set_title(label, fontsize=12, color=COLOR_TEXT, loc="left", pad=10)
        ax.set_xticks([])
        ax.set_yticks([])
        for sp in ax.spines.values():
            sp.set_visible(False)
        return

    import matplotlib.ticker
    y = list(range(len(funcs)))
    h = 0.38
    wv = [weak_by[f] for f in funcs]
    vv = [vin_by[f] for f in funcs]
    ax.barh([yi + h / 2 for yi in y], wv, height=h, color=COLOR_WEAK, zorder=3,
            label="weak-system (linearity)")
    ax.barh([yi - h / 2 for yi in y], vv, height=h, color=COLOR_VINEGAR, zorder=3,
            label="vinegar (entropy collapse)")

    ax.set_yticks(y)
    ax.set_yticklabels(funcs, fontsize=7.5, color=COLOR_TEXT)
    ax.set_xlabel("faults flagged", fontsize=9, color=COLOR_TEXT_MUTED)
    ax.set_title(f"{label}: {len(res['weak'])} weak-system + {len(res['vinegar'])} "
                 f"vinegar across {len(funcs)} function(s)",
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
            ax.text(v + 0.05, yi + h / 2, str(v), va="center", fontsize=7,
                    color=COLOR_TEXT_MUTED)
    for yi, v in zip(y, vv):
        if v:
            ax.text(v + 0.05, yi - h / 2, str(v), va="center", fontsize=7,
                    color=COLOR_TEXT_MUTED)
    ax.legend(loc="lower right", frameon=False, fontsize=8,
              labelcolor=COLOR_TEXT_MUTED)


def plot(results, out_path):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    def nfuncs(res):
        fs = {i["function"] for i in res["weak"]} | {i["function"] for i in res["vinegar"]}
        return max(1, len(fs))

    n_rows = [nfuncs(results[label]) for label, _ in SCHEMES]
    fig_h = sum(0.42 * n + 1.5 for n in n_rows)
    fig, axes = plt.subplots(
        nrows=len(SCHEMES), ncols=1,
        figsize=(11, max(5.0, fig_h)),
        gridspec_kw={"height_ratios": n_rows}, dpi=150)
    if len(SCHEMES) == 1:
        axes = [axes]
    fig.patch.set_facecolor(COLOR_BG)

    for ax, (label, _) in zip(axes, SCHEMES):
        _panel(ax, label, results[label])

    tot_weak = sum(len(results[l]["weak"]) for l, _ in SCHEMES)
    tot_vin = sum(len(results[l]["vinegar"]) for l, _ in SCHEMES)
    fig.suptitle(f"UOV-based scheme-specific faults: "
                 f"{tot_weak} weak-system + {tot_vin} vinegar flagged "
                 f"across {len(SCHEMES)} scheme(s)",
                 fontsize=13, color=COLOR_TEXT, x=0.01, ha="left")
    fig.tight_layout(rect=[0, 0, 1, 0.985])
    os.makedirs(os.path.dirname(out_path) or ".", exist_ok=True)
    fig.savefig(out_path, facecolor=fig.get_facecolor())
    print(f"[+] wrote {out_path}")


def main():
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--out", default=DEFAULT_OUT,
                    help=f"output image path (default: {DEFAULT_OUT})")
    args = ap.parse_args()

    results = {}
    any_root = False
    for label, root in SCHEMES:
        if os.path.isdir(root):
            any_root = True
        results[label] = collect_scheme(root)

    if not any_root:
        print("[!] none of the scheme roots were found", file=sys.stderr)
        sys.exit(1)

    for label, _ in SCHEMES:
        print_report(label, results[label])
    plot(results, args.out)


if __name__ == "__main__":
    main()
