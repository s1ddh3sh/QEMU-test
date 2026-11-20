#!/usr/bin/env python3
"""
Scan tests_kyber/ and tests_dilithium/ for the scheme-specific fault-test
reports and plot every fault flagged as a leak, one panel per scheme. Two tests
are merged into the same per-function stacked bars:

  1. distribution test (secret_vector_dist.py) -- nonce_reuse_dist_report.json
     with top-level "leak_detected": true. Raised by either part of T_DIST:
       - comparison test (nonce reuse): "nonce_reuse" -- a frozen sampling nonce
         makes two secret polynomials identical (s[i] == e[i] for Kyber,
         y[i] == y[j] for Dilithium); or "missing_secret_poly" -- a sampler call
         was skipped;
       - entropy test: "low_entropy" -- a sampled polynomial lost entropy vs the
         correct build (a biased/collapsed sampler), independent of any collision.

  2. range test (range_check.py) -- range_check_report.json with top-level
     "range_fault_detected": true. A fault pushed a variable that is, by
     specification, confined to a fixed range out of it -- e.g. the Dilithium
     "polytope / tail" fault emits a response z with ||z||_inf >= GAMMA1-BETA
     (the skipped rejection check), an out-of-range release.

Each flagged fault is bucketed by its primary reason (collision > missing poly >
low entropy > out-of-range) and the per-function counts are drawn as a stacked
bar, one panel per scheme.

Folder convention (same traversal as the mayo plot / report.sh):

    tests_<scheme>/<function>/<fault-class>/.../<fault-folder>/<report>.json

<function>     -- top-level folder directly under tests_<scheme>/
<fault-folder> -- the report's immediate parent dir

Usage:
    python3 kyber_dilithium_specific.py
    python3 kyber_dilithium_specific.py --out reports/faults/specific/kyber_dilithium_specific_faults.png
"""
import argparse
import glob
import json
import os
import sys
from collections import defaultdict, Counter

SCHEMES = ("kyber", "dilithium")
NONCE_REPORT_NAME = "nonce_reuse_dist_report.json"
RANGE_REPORT_NAME = "range_check_report.json"
DEFAULT_OUT = "reports/faults/specific/kyber_dilithium_specific_faults.png"

# Shared categorical palette (matches generic_tests_plot.py).
COLOR_COLLISION = "#eb6834"   # nonce-reuse collision   (orange)
COLOR_ENTROPY = "#2a78d6"     # low-entropy sampler     (blue)
COLOR_MISSING = "#1baf7a"     # skipped sampler poly    (aqua)
COLOR_RANGE = "#9b59b6"       # out-of-range release    (purple)
COLOR_GRID = "#d9d8d2"
COLOR_TEXT = "#0b0b0b"
COLOR_TEXT_MUTED = "#52514e"
COLOR_BG = "#fcfcfb"

# Buckets in draw order; a fault is assigned to the first that applies.
CATEGORIES = [
    ("collision", "nonce-reuse collision", COLOR_COLLISION),
    ("missing", "missing secret poly (zero initialized)", COLOR_MISSING),
    ("entropy", "low entropy", COLOR_ENTROPY),
    ("range", "out-of-range release", COLOR_RANGE),
]
CAT_LABEL = {k: lbl for k, lbl, _ in CATEGORIES}
CAT_COLOR = {k: c for k, _, c in CATEGORIES}


def find_reports(root, name):
    return sorted(glob.glob(os.path.join(root, "**", name), recursive=True))


def primary_category(cmp):
    """Primary leak reason, by priority collision > missing > entropy."""
    if cmp.get("nonce_reuse"):
        return "collision"
    if cmp.get("missing_secret_poly"):
        return "missing"
    if cmp.get("low_entropy"):
        return "entropy"
    return "entropy"  # leak_detected with no flag set: treat as entropy-only


def _load(path):
    try:
        with open(path) as f:
            return json.load(f)
    except (OSError, json.JSONDecodeError) as e:
        print(f"[!] skipping unreadable report {path}: {e}", file=sys.stderr)
        return None


def _record(flagged, root, path, category):
    rel = os.path.relpath(path, root)
    parts = rel.split(os.sep)
    flagged.append({
        "function": parts[0],
        "fault": parts[-2] if len(parts) >= 2 else "(root)",
        "category": category,
        "path": path,
    })


def collect_scheme(scheme):
    """Return (flagged, n_scanned) for one scheme, merging the distribution test
    (nonce-reuse / missing / entropy) and the range test (out-of-range release).
    flagged is a list of dicts: function, fault, category, path."""
    root = f"tests_{scheme}"
    flagged = []
    n_scanned = 0

    # 1. distribution test: nonce-reuse + entropy (secret_vector_dist.py)
    for path in find_reports(root, NONCE_REPORT_NAME):
        n_scanned += 1
        data = _load(path)
        if data is None or not data.get("leak_detected"):
            continue
        _record(flagged, root, path, primary_category(data.get("comparison", {})))

    # 2. range test: out-of-range release (range_check.py)
    for path in find_reports(root, RANGE_REPORT_NAME):
        n_scanned += 1
        data = _load(path)
        if data is None or not data.get("range_fault_detected"):
            continue
        _record(flagged, root, path, "range")

    return flagged, n_scanned


def print_report(scheme, flagged, n_scanned):
    print(f"== {scheme} ==")
    if n_scanned == 0:
        print(f"  no fault-test reports found under tests_{scheme}/ "
              f"(run dist_tests/{scheme}/run_nonce_reuse_dist.sh and/or "
              f"run_range_dist.sh first)\n")
        return
    if not flagged:
        print(f"  {n_scanned} report(s) scanned, 0 flagged as leak.\n")
        return
    by_func = defaultdict(Counter)
    for item in flagged:
        by_func[item["function"]][item["category"]] += 1
    for function in sorted(by_func, key=lambda f: (-sum(by_func[f].values()), f)):
        cats = by_func[function]
        detail = ", ".join(f"{CAT_LABEL[k]}: {cats[k]}" for k in cats)
        print(f"  {function}: {sum(cats.values())} flagged ({detail})")
    cat_tot = Counter(i["category"] for i in flagged)
    tot_detail = ", ".join(f"{CAT_LABEL[k]}: {cat_tot[k]}" for k in cat_tot)
    print(f"  -> {len(flagged)} flagged across {len(by_func)} function(s) "
          f"of {n_scanned} scanned ({tot_detail}).\n")


def _shade(hex_color, t):
    """Blend hex_color toward white by fraction t in [0, 1] (0 = base)."""
    h = hex_color.lstrip("#")
    r, g, b = (int(h[i:i + 2], 16) for i in (0, 2, 4))
    r = int(r + (255 - r) * t)
    g = int(g + (255 - g) * t)
    b = int(b + (255 - b) * t)
    return f"#{r:02x}{g:02x}{b:02x}"


def _segments(flagged):
    """Ordered (function, count, category) segments for one scheme's single bar.

    Grouped by CATEGORIES draw order, and within a category by descending count,
    so the bar reads collision -> missing -> entropy -> range, each a run of
    per-function segments coloured by that category.
    """
    by_fc = defaultdict(Counter)            # function -> category -> count
    for item in flagged:
        by_fc[item["function"]][item["category"]] += 1
    segs = []
    for cat, _, _ in CATEGORIES:
        fcs = [(fn, cc[cat]) for fn, cc in by_fc.items() if cc.get(cat)]
        for fn, cnt in sorted(fcs, key=lambda kv: (-kv[1], kv[0])):
            segs.append((fn, cnt, cat))
    return segs


def plot(results, out_path):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    import matplotlib.ticker
    from matplotlib.patches import Patch

    fig, ax = plt.subplots(figsize=(10, 6), dpi=150)
    fig.patch.set_facecolor(COLOR_BG)
    ax.set_facecolor(COLOR_BG)

    # per-scheme, per-category counts
    cat_by_scheme = {s: Counter(i["category"] for i in results[s][0])
                     for s in SCHEMES}
    totals = {s: len(results[s][0]) for s in SCHEMES}
    present_cats = [k for k, _, _ in CATEGORIES
                    if any(cat_by_scheme[s].get(k) for s in SCHEMES)]

    x = list(range(len(SCHEMES)))
    n = max(1, len(present_cats))
    bw = 0.8 / n                       # group width 0.8, one bar per category
    ymax = max([max(cat_by_scheme[s].values(), default=0) for s in SCHEMES] + [1])

    for j, cat in enumerate(present_cats):
        offs = (j - (n - 1) / 2) * bw
        vals = [cat_by_scheme[s].get(cat, 0) for s in SCHEMES]
        ax.bar([xi + offs for xi in x], vals, width=bw * 0.92,
               color=CAT_COLOR[cat], zorder=3, label=CAT_LABEL[cat])
        for xi, v in zip(x, vals):
            if v:
                ax.text(xi + offs, v + ymax * 0.015, str(v), ha="center",
                        va="bottom", fontsize=8, color=COLOR_TEXT_MUTED,
                        zorder=4)

    ax.set_xticks(x)
    ax.set_xticklabels([f"{s}\n({totals[s]} flagged)" for s in SCHEMES],
                       fontsize=10, color=COLOR_TEXT)
    ax.set_ylabel("faults flagged as leak", fontsize=9, color=COLOR_TEXT_MUTED)
    ax.set_ylim(0, ymax * 1.15)
    ax.yaxis.set_major_locator(matplotlib.ticker.MaxNLocator(integer=True))
    ax.grid(axis="y", color=COLOR_GRID, linewidth=0.8, zorder=0)
    ax.set_axisbelow(True)
    for sp in ("top", "right"):
        ax.spines[sp].set_visible(False)
    for sp in ("left", "bottom"):
        ax.spines[sp].set_color(COLOR_GRID)

    handles = [Patch(facecolor=CAT_COLOR[k], label=CAT_LABEL[k])
               for k in present_cats]
    if handles:
        ax.legend(handles=handles, loc="upper right", frameon=False,
                  fontsize=8.5, labelcolor=COLOR_TEXT_MUTED,
                  title="leak category", title_fontsize=9)

    total = sum(totals.values())
    fig.suptitle(f"Kyber / Dilithium scheme-specific faults "
                 f"(nonce-reuse + entropy + out-of-range): "
                 f"{total} flagged as leak",
                 fontsize=13, color=COLOR_TEXT, x=0.01, ha="left")
    fig.tight_layout(rect=[0, 0, 1, 0.96])
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
    for scheme in SCHEMES:
        root = f"tests_{scheme}"
        if not os.path.isdir(root):
            print(f"[!] {root}/ not found -- skipping {scheme}", file=sys.stderr)
            results[scheme] = ([], 0)
            continue
        any_root = True
        results[scheme] = collect_scheme(scheme)

    if not any_root:
        print("[!] neither tests_kyber/ nor tests_dilithium/ found", file=sys.stderr)
        sys.exit(1)

    for scheme in SCHEMES:
        print_report(scheme, *results[scheme])
    plot(results, args.out)


if __name__ == "__main__":
    main()
