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

# Per-scheme categorical palette: each scheme gets one colour, reused across
# both test panels so a scheme reads the same everywhere.
# Palette shared with reports/timings/summarize_timings.py so a scheme keeps
# the same colour across the timing and fault plots.
SCHEME_COLORS = {
    "MAYO":        "#1baf7a",  # green  (round 2)
    "MAYO-round3": "#eda100",  # yellow (round 3)
    "SNOVA":       "#e87ba4",  # pink
    "QR-UOV":      "#6250d6",  # purple
}
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


def _scheme_breakdown(results, test_key):
    """Per-scheme function breakdown for one test ('weak' or 'vinegar').

    Returns a list of {scheme, funcs} where funcs is a list of (function, count)
    sorted descending by count, kept only for schemes with at least one flag.
    Order follows SCHEMES.
    """
    out = []
    for label, _ in SCHEMES:
        by = Counter(i["function"] for i in results[label][test_key])
        if not by:
            continue
        funcs = sorted(by.items(), key=lambda kv: (-kv[1], kv[0]))
        out.append({"scheme": label, "funcs": funcs})
    return out


def _shade(hex_color, t):
    """Blend hex_color toward white by fraction t in [0, 1] (0 = base)."""
    h = hex_color.lstrip("#")
    r, g, b = (int(h[i:i + 2], 16) for i in (0, 2, 4))
    r = int(r + (255 - r) * t)
    g = int(g + (255 - g) * t)
    b = int(b + (255 - b) * t)
    return f"#{r:02x}{g:02x}{b:02x}"


def _test_panel(ax, title, blocks, matplotlib):
    """One bar per scheme, segmented (stacked) by function."""
    ax.set_facecolor(COLOR_BG)
    ax.set_title(title, fontsize=12, color=COLOR_TEXT, loc="left", pad=10)

    if not blocks:
        ax.text(0.5, 0.5, "no leaks flagged", ha="center", va="center",
                fontsize=11, color=COLOR_TEXT_MUTED, transform=ax.transAxes)
        ax.set_xticks([])
        ax.set_yticks([])
        for sp in ax.spines.values():
            sp.set_visible(False)
        return

    y = list(range(len(blocks)))
    totals = [sum(c for _, c in b["funcs"]) for b in blocks]
    xmax = max(totals) + 1

    for yi, blk in zip(y, blocks):
        base = SCHEME_COLORS.get(blk["scheme"], "#888888")
        n = len(blk["funcs"])
        left = 0
        for idx, (fn, cnt) in enumerate(blk["funcs"]):
            # successive segments lighten so boundaries read within one bar
            t = 0.0 if n == 1 else 0.45 * idx / (n - 1)
            ax.barh(yi, cnt, left=left, height=0.6, color=_shade(base, t),
                    edgecolor=COLOR_BG, linewidth=1.2, zorder=3)
            # label the segment with its function + count when it is wide enough
            if cnt >= 0.14 * xmax:
                ax.text(left + cnt / 2, yi, f"{fn}\n({cnt})", ha="center",
                        va="center", fontsize=6.5, color=COLOR_TEXT, zorder=4)
            left += cnt
        ax.text(left + 0.06, yi, str(totals[y.index(yi)]), va="center",
                ha="left", fontsize=8, fontweight="bold",
                color=COLOR_TEXT_MUTED, zorder=4)

    ax.set_yticks(y)
    ax.set_yticklabels([b["scheme"] for b in blocks], fontsize=9,
                       color=COLOR_TEXT)
    ax.set_ylim(-0.6, len(blocks) - 0.4)
    ax.set_xlabel("faults flagged", fontsize=9, color=COLOR_TEXT_MUTED)
    ax.set_xlim(0, xmax)
    ax.xaxis.set_major_locator(matplotlib.ticker.MaxNLocator(integer=True))
    ax.grid(axis="x", color=COLOR_GRID, linewidth=0.8, zorder=1)
    ax.set_axisbelow(True)
    for sp in ("top", "right"):
        ax.spines[sp].set_visible(False)
    for sp in ("left", "bottom"):
        ax.spines[sp].set_color(COLOR_GRID)


def plot(results, out_path):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    import matplotlib.ticker
    from matplotlib.patches import Patch

    weak_blocks = _scheme_breakdown(results, "weak")
    vin_blocks = _scheme_breakdown(results, "vinegar")
    tot_weak = sum(len(results[l]["weak"]) for l, _ in SCHEMES)
    tot_vin = sum(len(results[l]["vinegar"]) for l, _ in SCHEMES)

    n_weak = max(1, len(weak_blocks))
    n_vin = max(1, len(vin_blocks))
    fig_h = max(4.0, 0.9 * (n_weak + n_vin) + 2.2)
    fig, axes = plt.subplots(
        nrows=2, ncols=1, figsize=(12, fig_h),
        gridspec_kw={"height_ratios": [n_vin, n_weak]}, dpi=150)
    fig.patch.set_facecolor(COLOR_BG)

    _test_panel(axes[0],
                f"vinegar (entropy collapse): {tot_vin} flagged",
                vin_blocks, matplotlib)
    _test_panel(axes[1],
                f"weak-system (linearity): {tot_weak} flagged",
                weak_blocks, matplotlib)

    # One shared scheme-colour legend for the whole figure.
    present = [l for l, _ in SCHEMES
               if any(b["scheme"] == l for b in weak_blocks + vin_blocks)]
    handles = [Patch(facecolor=SCHEME_COLORS[l], label=l) for l in present]
    if handles:
        fig.legend(handles=handles, loc="upper right", frameon=False,
                   fontsize=8.5, labelcolor=COLOR_TEXT_MUTED,
                   title="scheme", title_fontsize=9,
                   bbox_to_anchor=(0.995, 0.995))

    fig.suptitle(f"UOV-based scheme-specific faults: "
                 f"{tot_vin} vinegar + {tot_weak} weak-system flagged "
                 f"across {len(SCHEMES)} scheme(s)",
                 fontsize=13, color=COLOR_TEXT, x=0.01, ha="left")
    fig.tight_layout(rect=[0, 0, 1, 0.97])
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
