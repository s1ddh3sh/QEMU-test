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


def _panel(ax, scheme, flagged, n_scanned):
    by_func = defaultdict(Counter)
    for item in flagged:
        by_func[item["function"]][item["category"]] += 1
    funcs = sorted(by_func, key=lambda f: (sum(by_func[f].values()), f))  # bottom-up
    ax.set_facecolor(COLOR_BG)

    if not funcs:
        msg = (f"no leaks flagged\n({n_scanned} report(s) scanned)"
               if n_scanned else
               f"no reports under tests_{scheme}/")
        ax.text(0.5, 0.5, msg, ha="center", va="center", fontsize=10,
                color=COLOR_TEXT_MUTED, transform=ax.transAxes)
        ax.set_title(f"{scheme}", fontsize=12, color=COLOR_TEXT, loc="left", pad=10)
        ax.set_xticks([])
        ax.set_yticks([])
        for sp in ax.spines.values():
            sp.set_visible(False)
        return

    y = list(range(len(funcs)))
    left = [0] * len(funcs)
    for cat, label, color in CATEGORIES:
        vals = [by_func[f].get(cat, 0) for f in funcs]
        if not any(vals):
            continue
        ax.barh(y, vals, left=left, height=0.62, color=color, zorder=3,
                label=label)
        left = [l + v for l, v in zip(left, vals)]

    ax.set_yticks(y)
    ax.set_yticklabels(funcs, fontsize=8, color=COLOR_TEXT)
    ax.set_xlabel("faults flagged as leak", fontsize=9, color=COLOR_TEXT_MUTED)
    total = len(flagged)
    ax.set_title(f"{scheme}: {total} flagged across {len(funcs)} function(s) "
                 f"(of {n_scanned} scanned)",
                 fontsize=12, color=COLOR_TEXT, loc="left", pad=10)
    import matplotlib.ticker
    ax.xaxis.set_major_locator(matplotlib.ticker.MaxNLocator(integer=True))
    ax.set_xlim(0, max(left) + 1)
    ax.grid(axis="x", color=COLOR_GRID, linewidth=0.8, zorder=0)
    ax.set_axisbelow(True)
    for sp in ("top", "right"):
        ax.spines[sp].set_visible(False)
    for sp in ("left", "bottom"):
        ax.spines[sp].set_color(COLOR_GRID)
    for yi, tot in zip(y, left):
        ax.text(tot + 0.05, yi, str(int(tot)), va="center", fontsize=8,
                color=COLOR_TEXT_MUTED)
    ax.legend(loc="lower right", frameon=False, fontsize=8,
              labelcolor=COLOR_TEXT_MUTED)


def plot(results, out_path):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    # Panel heights proportional to the number of functions (min 1 row each).
    n_rows = [max(1, len({i["function"] for i in results[s][0]})) for s in SCHEMES]
    fig_h = sum(0.42 * n + 1.4 for n in n_rows)
    fig, axes = plt.subplots(
        nrows=len(SCHEMES), ncols=1,
        figsize=(11, max(4.0, fig_h)),
        gridspec_kw={"height_ratios": n_rows}, dpi=150)
    if len(SCHEMES) == 1:
        axes = [axes]
    fig.patch.set_facecolor(COLOR_BG)

    for ax, scheme in zip(axes, SCHEMES):
        flagged, n_scanned = results[scheme]
        _panel(ax, scheme, flagged, n_scanned)

    total = sum(len(results[s][0]) for s in SCHEMES)
    fig.suptitle(f"Kyber / Dilithium scheme-specific faults "
                 f"(nonce-reuse + entropy + out-of-range): "
                 f"{total} flagged as leak",
                 fontsize=13, color=COLOR_TEXT, x=0.01, ha="left")
    fig.tight_layout(rect=[0, 0, 1, 0.98])
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
