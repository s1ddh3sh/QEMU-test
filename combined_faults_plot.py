#!/usr/bin/env python3
"""
combined_faults_plot.py -- plot the fault-leakage detection results for every
scheme together, from the collated CSVs in reports/faults/.

Unlike generic_tests_plot.py (which SCANS tests_<scheme>/ result files and
writes the CSVs), this script only reads the already-collated, up-to-date
fault_report_<scheme>.csv files and renders cross-scheme plots. No scanning,
no CSV rewriting. It reuses generic_tests_plot.py's palette, aggregation and
per-function plotters so the visual language is identical.

Each fault_report_<scheme>.csv carries all three tests (ineffective,
correction, direct_leak) in the shared schema
    scheme,function,fault,source,test,detected,detail
The scheme SERIES is taken from the FILENAME (not the csv's scheme column), so
MAYO Round2 (this repo) and MAYO Round3 (fault_report_mayo_round3.csv) stay
distinct even though both label their rows "mayo".

Inputs (reports/faults/, fault_report_all.csv excluded):
    fault_report_mayo.csv          -> mayo (round2)
    fault_report_mayo_round3.csv   -> mayo (round3)
    fault_report_kyber.csv         -> kyber
    fault_report_dilithium.csv     -> dilithium
    fault_report_snova.csv         -> snova
    fault_report_qruov.csv         -> qruov

Usage
-----
    python3 combined_faults_plot.py                 # combined plots -> reports/faults/plots/
    python3 combined_faults_plot.py --per-scheme    # also the per-function plots per scheme
    python3 combined_faults_plot.py --reports-dir reports/faults --outdir reports/faults/plots

Outputs (reports/faults/plots/)
    combined_faults_detection.png   # grouped bars: detected/tested per test, per scheme
    combined_faults_heatmap.png     # scheme x test detection-rate heatmap
    combined_faults_rates.png       # detection-rate dot plot per test, per scheme
    <scheme>_faults.png / _heatmap / _summary   # only with --per-scheme
"""

from __future__ import annotations

import argparse
import csv
import os
import sys

import generic_tests_plot as gt  # palette, TESTS, aggregate_detection_rates, per-scheme plotters

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_REPORTS = os.path.join(HERE, "reports", "faults")

# filename (in the reports dir) -> scheme series label + a filesystem-safe slug.
# Order here is the plotting order. fault_report_all.csv is intentionally absent.
SCHEME_FILES = [
    ("fault_report_mayo.csv",         "mayo (round2)", "mayo_round2"),
    ("fault_report_mayo_round3.csv",  "mayo (round3)", "mayo_round3"),
    ("fault_report_kyber.csv",        "kyber",         "kyber"),
    ("fault_report_dilithium.csv",    "dilithium",     "dilithium"),
    ("fault_report_snova.csv",        "snova",         "snova"),
    ("fault_report_qruov.csv",        "qruov",         "qruov"),
]

VALID_DETECTED = {"yes", "no", "timeout"}


# --------------------------------------------------------------------------
# Loading
# --------------------------------------------------------------------------
def load_scheme_rows(path):
    """Read one fault_report CSV into generic_tests_plot's row schema, with
    detected normalised to yes/no/timeout (error-with-timeout -> timeout;
    skip / other error dropped)."""
    rows, dropped = [], 0
    with open(path, newline="") as fh:
        for r in csv.DictReader(fh):
            status = (r.get("detected") or "").strip().lower()
            if status == "error" and "timeout" in (r.get("detail") or "").lower():
                status = "timeout"
            if status not in VALID_DETECTED:
                dropped += 1
                continue
            rows.append({
                "scheme": r.get("scheme", ""),
                "function": r.get("function", ""),
                "fault": r.get("fault", ""),
                "source": r.get("source", ""),
                "test": (r.get("test") or "").strip().lower(),
                "detected": status,
                "detail": r.get("detail", ""),
            })
    return rows, dropped


def load_all(reports_dir):
    """Returns ordered list of (label, slug, rows) for every scheme file found."""
    out = []
    for fname, label, slug in SCHEME_FILES:
        path = os.path.join(reports_dir, fname)
        if not os.path.isfile(path):
            print(f"[!] missing: {os.path.relpath(path)}", file=sys.stderr)
            continue
        rows, dropped = load_scheme_rows(path)
        d = f", {dropped} dropped" if dropped else ""
        print(f"[i] {label}: {len(rows)} verdict rows{d}")
        out.append((label, slug, rows))
    return out


def scheme_totals(rows):
    """{test: [hit, timeout, total]} summed over all functions of one scheme,
    deduplicated per (function, fault, test) via generic_tests_plot's rule."""
    counts = gt.aggregate_detection_rates(rows)
    totals = {t: [0, 0, 0] for t in gt.TESTS}
    for _func, bucket in counts.items():
        for t in gt.TESTS:
            for k in range(3):
                totals[t][k] += bucket[t][k]
    return totals


# --------------------------------------------------------------------------
# Combined plots
# --------------------------------------------------------------------------
def _mpl():
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    return plt


def plot_combined_detection(data, out_path):
    """Grouped horizontal bars: one group per scheme, one bar per test
    (ineffective/correction/direct leak). Each bar = detected (hue) + timeout
    (hatched grey) over a faint 'faults tested' track, labelled detected/tested."""
    plt = _mpl()
    labels = [lbl for lbl, _slug, _rows in data]
    totals = [scheme_totals(rows) for _lbl, _slug, rows in data]
    tests = [t for t in gt.TESTS if any(tt[t][2] for tt in totals)]

    n = len(labels)
    max_total = max((tt[t][2] for tt in totals for t in tests), default=1) or 1
    bar_h = 0.80 / len(tests)
    fig_h = max(3.5, 0.52 * len(tests) * n + 1.6)
    fig, ax = plt.subplots(figsize=(11, fig_h), dpi=150)
    fig.patch.set_facecolor("#fcfcfb")
    ax.set_facecolor("#fcfcfb")

    y = range(n)
    for k, t in enumerate(tests):
        offset = (k - (len(tests) - 1) / 2) * (bar_h + 0.015)
        pos = [i + offset for i in y]
        hit = [totals[i][t][0] for i in range(n)]
        to = [totals[i][t][1] for i in range(n)]
        tot = [totals[i][t][2] for i in range(n)]
        ax.barh(pos, tot, height=bar_h, color=gt.COLOR_GRID, alpha=0.55, zorder=2,
                label="faults tested" if k == 0 else None)
        ax.barh(pos, hit, height=bar_h, color=gt.TEST_COLORS[t], zorder=3,
                label=f"{gt.TEST_LABELS[t]} test")
        ax.barh(pos, to, left=hit, height=bar_h, color=gt.COLOR_TIMEOUT,
                hatch="///", edgecolor="#fcfcfb", linewidth=0, zorder=3,
                label="timeout" if k == 0 else None)
        for i in range(n):
            if tot[i] == 0:
                continue
            pct = 100.0 * hit[i] / tot[i]
            lab = f"{hit[i]}/{tot[i]} ({pct:.0f}%)" + (f" +{to[i]} TO" if to[i] else "")
            ax.text(tot[i] + 0.01 * max_total, i + offset, lab, va="center",
                    ha="left", fontsize=7.5, color=gt.COLOR_TEXT_MUTED)

    ax.set_yticks(list(y))
    ax.set_yticklabels(labels, fontsize=10, color=gt.COLOR_TEXT)
    ax.invert_yaxis()
    ax.set_xlim(0, max_total * 1.32)
    ax.set_xlabel("number of faults  (bar = leak DETECTED, hatched = timed out, "
                  "faint track = tested)", fontsize=9, color=gt.COLOR_TEXT_MUTED)
    ax.set_title("Fault-leakage detections per scheme\n"
                 "(distinct faults, OR'd across every result source)",
                 fontsize=12, color=gt.COLOR_TEXT, loc="left", pad=12)
    ax.grid(axis="x", color=gt.COLOR_GRID, linewidth=0.7, zorder=0)
    ax.set_axisbelow(True)
    for spine in ("top", "right", "left"):
        ax.spines[spine].set_visible(False)
    ax.spines["bottom"].set_color(gt.COLOR_GRID)
    ax.tick_params(left=False, bottom=False)
    ax.legend(loc="lower right", frameon=False, fontsize=9, labelcolor=gt.COLOR_TEXT_MUTED)
    fig.tight_layout()
    fig.savefig(out_path, facecolor=fig.get_facecolor())
    plt.close(fig)
    print(f"[i] plot -> {os.path.relpath(out_path)}")


def plot_combined_heatmap(data, out_path):
    """Scheme (rows) x test (cols) heatmap; cell shaded by detection rate in
    the test's own hue, annotated detected/tested (+N TO)."""
    plt = _mpl()
    from matplotlib.patches import Rectangle
    from matplotlib.colors import LinearSegmentedColormap

    labels = [lbl for lbl, _slug, _rows in data]
    totals = [scheme_totals(rows) for _lbl, _slug, rows in data]
    tests = [t for t in gt.TESTS if any(tt[t][2] for tt in totals)]
    cmaps = {t: LinearSegmentedColormap.from_list(f"d_{t}", ["#f1f0ec", gt.TEST_COLORS[t]])
             for t in tests}

    n = len(labels)
    fig_h = max(2.6, 0.5 * n + 1.8)
    fig, ax = plt.subplots(figsize=(1.7 * len(tests) + 2.5, fig_h), dpi=150)
    fig.patch.set_facecolor("#fcfcfb")
    ax.set_facecolor("#fcfcfb")

    for i in range(n):
        for j, t in enumerate(tests):
            hit, to, tot = totals[i][t]
            if tot == 0:
                continue
            rate = hit / tot
            ax.add_patch(Rectangle((j, i), 1, 1, facecolor=cmaps[t](rate),
                                   edgecolor="#fcfcfb", linewidth=1.8, zorder=2))
            if to:
                ax.add_patch(Rectangle((j, i), 1, 1, facecolor="none",
                                       edgecolor=gt.COLOR_TIMEOUT, hatch="////",
                                       linewidth=0, zorder=3, alpha=0.8))
            txt = f"{hit}/{tot}\n{rate*100:.0f}%" + (f" +{to}TO" if to else "")
            ax.text(j + 0.5, i + 0.5, txt, ha="center", va="center", fontsize=8,
                    color="white" if rate > 0.55 else gt.COLOR_TEXT, zorder=4)

    ax.set_xlim(0, len(tests))
    ax.set_ylim(n, 0)
    ax.set_xticks([j + 0.5 for j in range(len(tests))])
    ax.set_xticklabels([f"{gt.TEST_LABELS[t]}" for t in tests], fontsize=10, color=gt.COLOR_TEXT)
    ax.xaxis.tick_top()
    ax.set_yticks([i + 0.5 for i in range(n)])
    ax.set_yticklabels(labels, fontsize=10, color=gt.COLOR_TEXT)
    ax.tick_params(left=False, top=False)
    for spine in ax.spines.values():
        spine.set_visible(False)
    fig.suptitle("Fault-leakage detection rate: scheme x test\n"
                 "cell = detected/tested, shade = rate, hatched = includes timeouts",
                 x=0.01, ha="left", fontsize=10, color=gt.COLOR_TEXT)
    fig.tight_layout(rect=(0, 0, 1, 1 - 0.4 / fig_h))
    fig.savefig(out_path, facecolor=fig.get_facecolor())
    plt.close(fig)
    print(f"[i] plot -> {os.path.relpath(out_path)}")


def plot_combined_rates(data, out_path):
    """Detection-rate dot plot: x = rate (0-100%), one row per scheme, one
    marker per test (coloured by test). Compact cross-scheme comparison."""
    plt = _mpl()
    labels = [lbl for lbl, _slug, _rows in data]
    totals = [scheme_totals(rows) for _lbl, _slug, rows in data]
    tests = [t for t in gt.TESTS if any(tt[t][2] for tt in totals)]

    n = len(labels)
    fig_h = max(2.8, 0.55 * n + 1.4)
    fig, ax = plt.subplots(figsize=(9, fig_h), dpi=150)
    fig.patch.set_facecolor("#fcfcfb")
    ax.set_facecolor("#fcfcfb")

    y = range(n)
    for i in y:
        ax.plot([0, 100], [i, i], color=gt.COLOR_GRID, linewidth=1, zorder=1)
    for t in tests:
        xs, ys = [], []
        for i in range(n):
            hit, _to, tot = totals[i][t]
            if tot == 0:
                continue
            xs.append(100.0 * hit / tot)
            ys.append(i)
        ax.scatter(xs, ys, s=90, color=gt.TEST_COLORS[t], zorder=3,
                   edgecolors="#fcfcfb", linewidths=0.8, label=f"{gt.TEST_LABELS[t]} test")
    ax.set_yticks(list(y))
    ax.set_yticklabels(labels, fontsize=10, color=gt.COLOR_TEXT)
    ax.invert_yaxis()
    ax.set_xlim(-2, 108)
    ax.set_xlabel("leak detection rate  (detected / tested, %)", fontsize=9,
                  color=gt.COLOR_TEXT_MUTED)
    ax.set_title("Fault-leakage detection rate per scheme", fontsize=12,
                 color=gt.COLOR_TEXT, loc="left", pad=10)
    ax.grid(axis="x", color=gt.COLOR_GRID, linewidth=0.7, zorder=0)
    ax.set_axisbelow(True)
    for spine in ("top", "right", "left"):
        ax.spines[spine].set_visible(False)
    ax.spines["bottom"].set_color(gt.COLOR_GRID)
    ax.tick_params(left=False, bottom=False)
    ax.legend(loc="lower right", frameon=False, fontsize=9, labelcolor=gt.COLOR_TEXT_MUTED)
    fig.tight_layout()
    fig.savefig(out_path, facecolor=fig.get_facecolor())
    plt.close(fig)
    print(f"[i] plot -> {os.path.relpath(out_path)}")


# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------
def print_summary(data):
    print("\nscheme            test          detected/tested   rate")
    print("-" * 58)
    for lbl, _slug, rows in data:
        tot = scheme_totals(rows)
        for t in gt.TESTS:
            hit, to, n = tot[t]
            if n == 0:
                continue
            extra = f"  (+{to} TO)" if to else ""
            print(f"{lbl:<17} {gt.TEST_LABELS[t]:<13} {hit:>6}/{n:<7} {100.0*hit/n:6.1f}%{extra}")


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--reports-dir", default=DEFAULT_REPORTS,
                    help="folder with the fault_report_<scheme>.csv files")
    ap.add_argument("--outdir", default=None,
                    help="where to write PNGs (default: <reports-dir>/plots)")
    ap.add_argument("--per-scheme", action="store_true",
                    help="also render generic_tests_plot's per-function plots for each scheme")
    args = ap.parse_args(argv)

    reports_dir = os.path.abspath(args.reports_dir)
    outdir = os.path.abspath(args.outdir) if args.outdir else os.path.join(reports_dir, "plots")
    os.makedirs(outdir, exist_ok=True)

    data = load_all(reports_dir)
    if not data:
        print("[!] no fault_report_<scheme>.csv files found", file=sys.stderr)
        return 1

    print_summary(data)

    plot_combined_detection(data, os.path.join(outdir, "combined_faults_detection.png"))
    plot_combined_heatmap(data, os.path.join(outdir, "combined_faults_heatmap.png"))
    plot_combined_rates(data, os.path.join(outdir, "combined_faults_rates.png"))

    if args.per_scheme:
        for lbl, slug, rows in data:
            try:
                gt.plot_scheme(lbl, rows, os.path.join(outdir, f"{slug}_faults.png"))
                gt.plot_scheme_heatmap(lbl, rows, os.path.join(outdir, f"{slug}_faults_heatmap.png"))
                gt.plot_scheme_summary(lbl, rows, os.path.join(outdir, f"{slug}_faults_summary.png"))
                print(f"[i] per-scheme plots -> {slug}_faults*.png")
            except RuntimeError as e:
                print(f"[!] {lbl}: {e}", file=sys.stderr)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
