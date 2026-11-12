#!/usr/bin/env python3
"""
summarize_timings.py -- roll up per-function fault-test timing CSVs into one
cross-scheme summary, and render timing plots (per scheme, and combined).

Schemes covered (one CSV each, living in this timings/ folder):
    kyber, dilithium, mayo (Round2), mayo(round3), snova, qruov

The per-scheme CSVs use slightly different column names and status vocab:
    kyber/dilithium/mayo/mayo(round3):  function,status,seconds        (ok|test)
    snova:                              function,status,elapsed_seconds (ok|summary)
    qruov:                              function,outcome,time_seconds   (ok|skipped|build-failed|test-failed)

This script normalises all of that. Only rows whose status/outcome is "ok"
(a test that actually ran to completion) count toward the averages; failed,
skipped, and synthetic summary rows (e.g. snova's __total_wall_clock__) are
tallied separately and excluded from the timing statistics.

The authoritative source of the mayo(round3), snova and qruov CSVs is outside
this repo (see EXTERNAL_SOURCES). Pass --refresh to re-copy those into timings/
before summarising; otherwise the in-repo copies are used as-is.

Usage
-----
    python3 timings/summarize_timings.py                 # summary + per-scheme plots
    python3 timings/summarize_timings.py --combined      # ...also the combined plot
    python3 timings/summarize_timings.py -combined       # (single-dash alias)
    python3 timings/summarize_timings.py --refresh        # re-pull external CSVs first
    python3 timings/summarize_timings.py --no-plots       # summary CSV only
    python3 timings/summarize_timings.py --scheme kyber   # restrict per-scheme plot(s)

Outputs
-------
    timings/timing_schemes_summary.csv   # one row per scheme + a pooled ALL row
    timings/plots/<scheme>_timing.png    # per-function bars, one file per scheme
    timings/plots/combined_timing.png    # avg-per-scheme + per-function spread
"""

from __future__ import annotations

import argparse
import csv
import datetime as _dt
import os
import shutil
import statistics
import sys

# --------------------------------------------------------------------------
# Config
# --------------------------------------------------------------------------
HERE = os.path.dirname(os.path.abspath(__file__))


def _find_repo_root(start):
    """Walk up from `start` to the repo root (the dir holding tests_kyber),
    so this script keeps working wherever the timings/ folder is moved to."""
    d = start
    for _ in range(6):
        if os.path.isdir(os.path.join(d, "tests_kyber")):
            return d
        parent = os.path.dirname(d)
        if parent == d:
            break
        d = parent
    return os.path.dirname(start)


REPO = _find_repo_root(HERE)
PLOTS_DIR = os.path.join(HERE, "plots")
SUMMARY_CSV = os.path.join(HERE, "timing_schemes_summary.csv")
FAULTS_CSV = os.path.join(HERE, "faults_analyzed_summary.csv")

# scheme -> tests_<scheme> folder holding the per-function faulty LLVMs. The
# in-repo schemes live here; mayo(round3)/snova/qruov live in their own repos
# (note: those use the singular "test_" prefix). A faulty LLVM is any *.ll under
# a function dir EXCEPT the base <func>/<func>.ll and anything under a gated
# full_<scheme>[ _gated ] directory -- see count_faulty_llvms().
FAULT_TESTS_DIRS = {
    "kyber":        os.path.join(REPO, "tests_kyber"),
    "dilithium":    os.path.join(REPO, "tests_dilithium"),
    "mayo(round2)":         os.path.join(REPO, "tests_mayo"),
    "mayo(round3)": "/home/siddhesh/Desktop/MAYO-C_Round3/MAYO-C/llvm/test_mayo",
    "snova":        "/home/siddhesh/Desktop/SNOVA_LLVM/SNOVA/llvm/test_snova",
    "qruov":        "/home/siddhesh/Desktop/QRUOV_LLVM/round2/llvm/test_qruov",
}

# scheme -> CSV filename inside this timings/ folder. Order here is the order
# used for plots and the fixed categorical colour assignment.
SCHEME_FILES = {
    "kyber":         "timing_kyber.csv",
    "dilithium":     "timing_dilithium.csv",
    "mayo(round2)":          "timing_mayo.csv",          # Round2 (== dist_tests/mayo)
    "mayo(round3)":  "timing_mayo(round3).csv",
    "snova":         "timing_snova.csv",
    "qruov":         "timing_qruov.csv",
}

# Authoritative upstream locations for the schemes maintained outside this repo.
# `--refresh` copies these into timings/ (over the filename in SCHEME_FILES).
EXTERNAL_SOURCES = {
    "mayo(round3)": "/home/siddhesh/Desktop/MAYO-C_Round3/MAYO-C/llvm/dist_tests/mayo/timing_mayo.csv",
    "snova":        "/home/siddhesh/Desktop/SNOVA_LLVM/SNOVA/llvm/run_tests_all_timing.csv",
    "qruov":        "/home/siddhesh/Desktop/QRUOV_LLVM/round2/llvm/dist_tests/qruov/timing_report_main.csv",
}

# Categorical palette (dataviz skill default, light mode), assigned in the
# fixed SCHEME_FILES order -- colour follows the scheme, never its rank.
PALETTE = ["#2a78d6", "#eb6834", "#1baf7a", "#eda100", "#e87ba4", "#6250d6",
           "#008300", "#e34948"]

# Column-name aliases (lowercased) for the three logical fields.
FUNC_KEYS = ("function", "func", "name")
STATUS_KEYS = ("status", "outcome", "result")
TIME_KEYS = ("seconds", "time_seconds", "elapsed_seconds", "time", "wall_seconds")

SUCCESS = "ok"  # the only status/outcome that counts as a completed test


# --------------------------------------------------------------------------
# Parsing
# --------------------------------------------------------------------------
def _find_key(fieldnames, aliases):
    lower = {(f or "").strip().lower(): f for f in fieldnames}
    for a in aliases:
        if a in lower:
            return lower[a]
    return None


def load_scheme_csv(path):
    """Return (ok_rows, tally) for one scheme CSV.

    ok_rows: list of (function, seconds) for rows whose status == 'ok'.
    tally:   dict of status -> count for every non-synthetic row (incl. ok).
    Synthetic rows (function matching __...__) are ignored entirely.
    """
    ok_rows = []
    tally = {}
    with open(path, newline="") as fh:
        reader = csv.DictReader(fh)
        if not reader.fieldnames:
            return ok_rows, tally
        fkey = _find_key(reader.fieldnames, FUNC_KEYS) or reader.fieldnames[0]
        skey = _find_key(reader.fieldnames, STATUS_KEYS)
        tkey = _find_key(reader.fieldnames, TIME_KEYS)
        if tkey is None:
            raise ValueError(f"{path}: no recognised time column in {reader.fieldnames}")
        for row in reader:
            func = (row.get(fkey) or "").strip()
            if not func or (func.startswith("__") and func.endswith("__")):
                continue  # skip blanks and synthetic summary rows
            status = (row.get(skey) or "").strip().lower() if skey else SUCCESS
            tally[status] = tally.get(status, 0) + 1
            if status == SUCCESS:
                try:
                    secs = float(row.get(tkey))
                except (TypeError, ValueError):
                    continue
                ok_rows.append((func, secs))
    return ok_rows, tally


def count_faulty_llvms(tests_dir):
    """Count faulty LLVM files under a tests_<scheme> folder.

    Faulty = every *.ll EXCEPT the per-function base <func>/<func>.ll and any
    file inside a gated full_<scheme>[_gated] directory. Returns
    (faulty_count, num_function_dirs_with_faults).
    """
    faulty = 0
    func_dirs = set()
    for root, dirs, files in os.walk(tests_dir):
        # never descend into gated full_* subtrees
        dirs[:] = [d for d in dirs if not d.startswith("full_")]
        rel = os.path.relpath(root, tests_dir)
        parts = [] if rel == "." else rel.split(os.sep)
        if any(p.startswith("full_") for p in parts):
            continue
        for f in files:
            if not f.endswith(".ll"):
                continue
            # base driver sits directly in the function dir as <func>/<func>.ll
            if len(parts) == 1 and f[:-3] == parts[0]:
                continue
            if not parts:
                continue  # stray .ll at the tests root (not expected)
            faulty += 1
            func_dirs.add(parts[0])
    return faulty, len(func_dirs)


def refresh_external():
    for scheme, src in EXTERNAL_SOURCES.items():
        dst = os.path.join(HERE, SCHEME_FILES[scheme])
        if not os.path.isfile(src):
            print(f"[!] refresh: source missing for {scheme}: {src}", file=sys.stderr)
            continue
        shutil.copyfile(src, dst)
        print(f"[i] refreshed {scheme}: {src} -> {os.path.relpath(dst, HERE)}")


# --------------------------------------------------------------------------
# Summary
# --------------------------------------------------------------------------
def build_summary(scheme_data):
    """scheme_data: dict scheme -> (ok_rows, tally). Returns list of dict rows."""
    rows = []
    pooled_secs = []
    for scheme in SCHEME_FILES:
        if scheme not in scheme_data:
            continue
        ok_rows, tally = scheme_data[scheme]
        secs = [s for _, s in ok_rows]
        n = len(secs)
        total = sum(tally.values())
        ssum = sum(secs)
        rows.append({
            "scheme": scheme,
            "functions": n,
            "avg_seconds": round(ssum / n, 3) if n else 0.0,
            "median_seconds": round(statistics.median(secs), 3) if n else 0.0,
            "min_seconds": round(min(secs), 3) if n else 0.0,
            "max_seconds": round(max(secs), 3) if n else 0.0,
            "sum_seconds": round(ssum, 3),
            "failed": tally.get("test", 0) + tally.get("build", 0)
                      + tally.get("build-failed", 0) + tally.get("test-failed", 0),
            "skipped": tally.get("skipped", 0),
            "total_rows": total,
        })
        pooled_secs.extend(secs)

    if pooled_secs:
        n = len(pooled_secs)
        ssum = sum(pooled_secs)
        rows.append({
            "scheme": "ALL",
            "functions": n,
            "avg_seconds": round(ssum / n, 3),
            "median_seconds": round(statistics.median(pooled_secs), 3),
            "min_seconds": round(min(pooled_secs), 3),
            "max_seconds": round(max(pooled_secs), 3),
            "sum_seconds": round(ssum, 3),
            "failed": sum(r["failed"] for r in rows),
            "skipped": sum(r["skipped"] for r in rows),
            "total_rows": sum(r["total_rows"] for r in rows),
        })
    return rows


def write_summary(rows):
    cols = ["scheme", "functions", "avg_seconds", "median_seconds", "min_seconds",
            "max_seconds", "sum_seconds", "failed", "skipped", "total_rows", "updated"]
    stamp = _dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    tmp = SUMMARY_CSV + ".tmp"
    with open(tmp, "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=cols)
        w.writeheader()
        for r in rows:
            r = dict(r)
            r["updated"] = stamp
            w.writerow(r)
    os.replace(tmp, SUMMARY_CSV)
    print(f"[i] wrote summary -> {os.path.relpath(SUMMARY_CSV, HERE)} ({len(rows)} row(s))")


def build_faults_summary(summary_rows):
    """Merge the faulty-LLVM counts with the per-scheme timing statistics.

    Returns (rows, cols). One row per scheme + a pooled ALL row; timing stats
    are carried over from the schemes summary (keyed by scheme).
    """
    by_scheme = {r["scheme"]: r for r in summary_rows}
    cols = ["scheme", "faults_analyzed", "functions_with_faults", "functions_timed",
            "avg_seconds", "median_seconds", "min_seconds", "max_seconds",
            "sum_seconds", "failed", "skipped"]
    rows = []
    total_faults = 0
    total_funcs = 0
    for scheme in SCHEME_FILES:
        tests_dir = FAULT_TESTS_DIRS.get(scheme)
        if not tests_dir or not os.path.isdir(tests_dir):
            print(f"[!] faults: tests dir missing for {scheme}: {tests_dir}", file=sys.stderr)
            faults, nfunc = "", ""
        else:
            faults, nfunc = count_faulty_llvms(tests_dir)
            total_faults += faults
            total_funcs += nfunc
        t = by_scheme.get(scheme, {})
        rows.append({
            "scheme": scheme,
            "faults_analyzed": faults,
            "functions_with_faults": nfunc,
            "functions_timed": t.get("functions", ""),
            "avg_seconds": t.get("avg_seconds", ""),
            "median_seconds": t.get("median_seconds", ""),
            "min_seconds": t.get("min_seconds", ""),
            "max_seconds": t.get("max_seconds", ""),
            "sum_seconds": t.get("sum_seconds", ""),
            "failed": t.get("failed", ""),
            "skipped": t.get("skipped", ""),
        })
    allt = by_scheme.get("ALL", {})
    rows.append({
        "scheme": "ALL",
        "faults_analyzed": total_faults,
        "functions_with_faults": total_funcs,
        "functions_timed": allt.get("functions", ""),
        "avg_seconds": allt.get("avg_seconds", ""),
        "median_seconds": allt.get("median_seconds", ""),
        "min_seconds": allt.get("min_seconds", ""),
        "max_seconds": allt.get("max_seconds", ""),
        "sum_seconds": allt.get("sum_seconds", ""),
        "failed": allt.get("failed", ""),
        "skipped": allt.get("skipped", ""),
    })
    return rows, cols


def write_faults_summary(rows, cols):
    stamp = _dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    cols = cols + ["updated"]
    tmp = FAULTS_CSV + ".tmp"
    with open(tmp, "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=cols)
        w.writeheader()
        for r in rows:
            r = dict(r)
            r["updated"] = stamp
            w.writerow(r)
    os.replace(tmp, FAULTS_CSV)
    print(f"[i] wrote faults summary -> {os.path.relpath(FAULTS_CSV, HERE)} ({len(rows)} row(s))")


# --------------------------------------------------------------------------
# Plotting
# --------------------------------------------------------------------------
def _mpl():
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    plt.rcParams.update({
        "figure.facecolor": "#fcfcfb",
        "axes.facecolor": "#fcfcfb",
        "axes.edgecolor": "#c3c2b7",
        "axes.labelcolor": "#0b0b0b",
        "text.color": "#0b0b0b",
        "xtick.color": "#52514e",
        "ytick.color": "#52514e",
        "font.size": 10,
        "axes.grid": True,
        "grid.color": "#e7e6e1",
        "grid.linewidth": 0.8,
    })
    return plt


def color_for(scheme):
    order = list(SCHEME_FILES)
    return PALETTE[order.index(scheme) % len(PALETTE)]


def plot_per_scheme(scheme, ok_rows, outpath):
    plt = _mpl()
    rows = sorted(ok_rows, key=lambda t: t[1], reverse=True)
    labels = [f for f, _ in rows]
    vals = [max(s, 1e-3) for _, s in rows]  # clamp for log axis
    n = len(vals)
    height = max(2.5, 0.28 * n + 1.2)
    fig, ax = plt.subplots(figsize=(10, height))
    y = range(n)
    ax.barh(list(y), vals, color=color_for(scheme), height=0.72, zorder=3)
    ax.set_yticks(list(y))
    ax.set_yticklabels(labels, fontsize=7)
    ax.invert_yaxis()
    ax.set_xscale("log")
    ax.set_xlabel("test wall time (seconds, log scale)")
    ax.grid(axis="y", visible=False)
    if n:
        mean = statistics.mean(vals)
        ax.axvline(mean, color="#52514e", linestyle="--", linewidth=1, zorder=4)
        ax.text(mean, -0.6, f"mean {mean:,.0f}s", color="#52514e",
                fontsize=8, ha="center", va="bottom")
    ax.set_title(f"{scheme}: per-function fault-test time  ({n} function(s))",
                 fontsize=12, color="#0b0b0b", pad=10)
    for s in ("top", "right"):
        ax.spines[s].set_visible(False)
    fig.tight_layout()
    fig.savefig(outpath, dpi=150)
    plt.close(fig)
    print(f"[i] plot -> {os.path.relpath(outpath, HERE)}")


COMBINED_STYLES = ("ecdf", "box", "ranked", "dashboard")


def _scheme_secs(scheme_data, scheme):
    return [v for _, v in scheme_data[scheme][0]]


def _iqr(secs):
    """(q1, q3) or None if too few points."""
    if len(secs) < 2:
        return None
    q = statistics.quantiles(secs, n=4)
    return q[0], q[2]


def _style_scheme_axis(ax, schemes):
    ax.set_xticks(list(range(len(schemes))))
    ax.set_xticklabels(schemes, rotation=25, ha="right", fontsize=9)
    for s in ("top", "right"):
        ax.spines[s].set_visible(False)


def _mean_median_bars(ax, scheme_data, summary_rows, schemes):
    """Grouped mean (solid) + median (faded) bars with an IQR whisker on the
    median bar. Shared by the 'ecdf', 'box' and 'dashboard' styles."""
    from matplotlib.patches import Patch
    width = 0.38
    for xi, s in enumerate(schemes):
        row = next(r for r in summary_rows if r["scheme"] == s)
        mean, med = row["avg_seconds"], row["median_seconds"]
        c = color_for(s)
        ax.bar(xi - width / 2, mean, width, color=c, zorder=3)
        ax.bar(xi + width / 2, med, width, color=c, alpha=0.45, zorder=3)
        iqr = _iqr(_scheme_secs(scheme_data, s))
        if iqr:
            q1, q3 = iqr
            ax.errorbar(xi + width / 2, med, yerr=[[max(med - q1, 0)], [max(q3 - med, 0)]],
                        fmt="none", ecolor="#52514e", capsize=3, lw=1, zorder=4)
        ax.text(xi - width / 2, mean, f"{mean:,.0f}", ha="center", va="bottom",
                fontsize=7, color="#0b0b0b")
        ax.text(xi + width / 2, med, f"{med:,.0f}", ha="center", va="bottom",
                fontsize=7, color="#52514e")
    _style_scheme_axis(ax, schemes)
    ax.set_ylabel("test wall time (seconds)")
    ax.set_title("Mean vs median function-test time  (whisker = IQR)", fontsize=12, pad=10)
    ax.grid(axis="x", visible=False)
    ax.legend(handles=[Patch(facecolor="#52514e", label="mean"),
                       Patch(facecolor="#52514e", alpha=0.45, label="median")],
              frameon=False, fontsize=8, loc="upper left")


def _combined_ecdf(plt, scheme_data, summary_rows, schemes):
    """Panel A: ECDF (share of functions completing within t seconds, log x),
    one step curve per scheme. Panel B: mean-vs-median bars with IQR whiskers."""
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(15, 6.5))
    for s in schemes:
        secs = sorted(max(v, 1e-3) for v in _scheme_secs(scheme_data, s))
        if not secs:
            continue
        n = len(secs)
        ys = [100.0 * (i + 1) / n for i in range(n)]
        ax1.step([secs[0]] + secs, [0] + ys, where="post", color=color_for(s),
                 linewidth=2, label=f"{s} (n={n})", zorder=3)
    ax1.set_xscale("log")
    ax1.set_xlabel("test wall time (seconds, log scale)")
    ax1.set_ylabel("functions completed within t  (%)")
    ax1.set_ylim(0, 101)
    ax1.set_title("Cumulative function-test time (ECDF)", fontsize=12, pad=10)
    ax1.grid(True, color="#e7e6e1", linewidth=0.8)
    ax1.legend(frameon=False, fontsize=8, loc="lower right")
    for sp in ("top", "right"):
        ax1.spines[sp].set_visible(False)
    _mean_median_bars(ax2, scheme_data, summary_rows, schemes)
    return fig


def _combined_box(plt, scheme_data, summary_rows, schemes):
    """Panel A: mean-vs-median bars. Panel B: box plot (median/IQR/whiskers/
    outliers) with jittered points overlaid, log y."""
    import random
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(15, 6.5))
    _mean_median_bars(ax1, scheme_data, summary_rows, schemes)
    data = [[max(v, 1e-3) for v in _scheme_secs(scheme_data, s)] for s in schemes]
    ax2.set_yscale("log")
    bp = ax2.boxplot(data, positions=range(len(schemes)), widths=0.55,
                     patch_artist=True, showfliers=False, zorder=2)
    for patch, s in zip(bp["boxes"], schemes):
        patch.set_facecolor(color_for(s))
        patch.set_alpha(0.35)
        patch.set_edgecolor(color_for(s))
    for med in bp["medians"]:
        med.set_color("#0b0b0b")
    rng = random.Random(0)
    for xi, s in enumerate(schemes):
        secs = [max(v, 1e-3) for v in _scheme_secs(scheme_data, s)]
        xs = [xi + (rng.random() - 0.5) * 0.4 for _ in secs]
        ax2.scatter(xs, secs, s=14, color=color_for(s), alpha=0.6,
                    edgecolors="#fcfcfb", linewidths=0.3, zorder=3)
    _style_scheme_axis(ax2, schemes)
    ax2.set_ylabel("test wall time (seconds, log scale)")
    ax2.set_title("Per-function distribution  (box = IQR, whiskers, points)", fontsize=12, pad=10)
    ax2.grid(axis="x", visible=False)
    return fig


def _combined_ranked(plt, scheme_data, summary_rows, schemes):
    """Single panel: horizontal box plots, schemes sorted by median, log x."""
    order = sorted(schemes, key=lambda s: next(
        r["median_seconds"] for r in summary_rows if r["scheme"] == s))
    data = [[max(v, 1e-3) for v in _scheme_secs(scheme_data, s)] for s in order]
    fig, ax = plt.subplots(figsize=(11, max(3.0, 0.7 * len(order) + 1.5)))
    ax.set_xscale("log")
    bp = ax.boxplot(data, positions=range(len(order)), widths=0.6, vert=False,
                    patch_artist=True, showfliers=True, zorder=2,
                    flierprops=dict(marker="o", markersize=3, alpha=0.5,
                                    markerfacecolor="#52514e", markeredgecolor="none"))
    for patch, s in zip(bp["boxes"], order):
        patch.set_facecolor(color_for(s))
        patch.set_alpha(0.45)
        patch.set_edgecolor(color_for(s))
    for med in bp["medians"]:
        med.set_color("#0b0b0b")
        med.set_linewidth(1.6)
    ax.set_yticks(list(range(len(order))))
    ax.set_yticklabels(order, fontsize=10)
    ax.set_xlabel("test wall time (seconds, log scale)")
    ax.set_title("Per-function test-time distribution, schemes ranked by median",
                 fontsize=12, pad=10)
    ax.grid(axis="x", color="#e7e6e1", linewidth=0.8)
    for sp in ("top", "right"):
        ax.spines[sp].set_visible(False)
    return fig


def _combined_dashboard(plt, scheme_data, summary_rows, schemes):
    """2x2: box+points distribution | mean-vs-median bars | total wall-time |
    function count."""
    import random
    fig, axes = plt.subplots(2, 2, figsize=(15, 11))
    ax_box, ax_mm, ax_tot, ax_cnt = axes[0, 0], axes[0, 1], axes[1, 0], axes[1, 1]

    # box + points (log y)
    data = [[max(v, 1e-3) for v in _scheme_secs(scheme_data, s)] for s in schemes]
    ax_box.set_yscale("log")
    bp = ax_box.boxplot(data, positions=range(len(schemes)), widths=0.55,
                        patch_artist=True, showfliers=False, zorder=2)
    for patch, s in zip(bp["boxes"], schemes):
        patch.set_facecolor(color_for(s)); patch.set_alpha(0.35); patch.set_edgecolor(color_for(s))
    for med in bp["medians"]:
        med.set_color("#0b0b0b")
    rng = random.Random(0)
    for xi, s in enumerate(schemes):
        secs = [max(v, 1e-3) for v in _scheme_secs(scheme_data, s)]
        ax_box.scatter([xi + (rng.random() - 0.5) * 0.4 for _ in secs], secs, s=12,
                       color=color_for(s), alpha=0.6, edgecolors="#fcfcfb", linewidths=0.3, zorder=3)
    _style_scheme_axis(ax_box, schemes)
    ax_box.set_ylabel("seconds (log)")
    ax_box.set_title("Per-function distribution", fontsize=11, pad=8)
    ax_box.grid(axis="x", visible=False)

    _mean_median_bars(ax_mm, scheme_data, summary_rows, schemes)

    # total wall-clock time (horizontal, sorted)
    sums = [(s, next(r["sum_seconds"] for r in summary_rows if r["scheme"] == s)) for s in schemes]
    sums.sort(key=lambda t: t[1])
    ax_tot.barh([s for s, _ in sums], [v for _, v in sums],
                color=[color_for(s) for s, _ in sums], zorder=3)
    for i, (s, v) in enumerate(sums):
        ax_tot.text(v, i, f" {v/3600:,.1f} h", va="center", fontsize=8, color="#0b0b0b")
    ax_tot.set_xlabel("total wall-clock time (seconds)")
    ax_tot.set_title("Total compute per scheme", fontsize=11, pad=8)
    ax_tot.grid(axis="y", visible=False)
    for sp in ("top", "right"):
        ax_tot.spines[sp].set_visible(False)

    # function count (horizontal, sorted)
    cnts = [(s, next(r["functions"] for r in summary_rows if r["scheme"] == s)) for s in schemes]
    cnts.sort(key=lambda t: t[1])
    ax_cnt.barh([s for s, _ in cnts], [v for _, v in cnts],
                color=[color_for(s) for s, _ in cnts], zorder=3)
    for i, (s, v) in enumerate(cnts):
        ax_cnt.text(v, i, f" {v}", va="center", fontsize=8, color="#0b0b0b")
    ax_cnt.set_xlabel("functions timed")
    ax_cnt.set_title("Corpus size per scheme", fontsize=11, pad=8)
    ax_cnt.grid(axis="y", visible=False)
    for sp in ("top", "right"):
        ax_cnt.spines[sp].set_visible(False)
    return fig


def plot_combined(scheme_data, summary_rows, outpath, style="ecdf"):
    plt = _mpl()
    schemes = [r["scheme"] for r in summary_rows if r["scheme"] != "ALL"]
    builders = {
        "ecdf": _combined_ecdf, "box": _combined_box,
        "ranked": _combined_ranked, "dashboard": _combined_dashboard,
    }
    fig = builders.get(style, _combined_ecdf)(plt, scheme_data, summary_rows, schemes)
    fig.suptitle(f"PQC fault-test timings across schemes  [{style}]", fontsize=14, y=0.995)
    fig.tight_layout(rect=(0, 0, 1, 0.97))
    fig.savefig(outpath, dpi=150)
    plt.close(fig)
    print(f"[i] plot -> {os.path.relpath(outpath, HERE)}  (style={style})")


# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------
def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-combined", "--combined", dest="combined", action="store_true",
                    help="also render the combined cross-scheme plot")
    ap.add_argument("--combined-style", choices=(*COMBINED_STYLES, "all"), default="ecdf",
                    help="combined-plot style (default: ecdf; 'all' renders every style)")
    ap.add_argument("--refresh", action="store_true",
                    help="re-copy the external mayo(round3)/snova/qruov CSVs first")
    ap.add_argument("--no-plots", action="store_true", help="write summary CSV only")
    ap.add_argument("--scheme", action="append", default=None,
                    help="restrict per-scheme plots to this scheme (repeatable)")
    args = ap.parse_args(argv)

    if args.refresh:
        refresh_external()

    scheme_data = {}
    for scheme, fname in SCHEME_FILES.items():
        path = os.path.join(HERE, fname)
        if not os.path.isfile(path):
            print(f"[!] missing CSV for {scheme}: {os.path.relpath(path, HERE)}", file=sys.stderr)
            continue
        scheme_data[scheme] = load_scheme_csv(path)
        ok_n = len(scheme_data[scheme][0])
        tally = scheme_data[scheme][1]
        extra = {k: v for k, v in tally.items() if k != SUCCESS}
        extra_s = (" + " + ", ".join(f"{v} {k}" for k, v in sorted(extra.items()))) if extra else ""
        print(f"[i] {scheme}: {ok_n} ok{extra_s}")

    if not scheme_data:
        print("[!] no scheme CSVs found in timings/", file=sys.stderr)
        return 1

    summary_rows = build_summary(scheme_data)
    write_summary(summary_rows)

    faults_rows, faults_cols = build_faults_summary(summary_rows)
    write_faults_summary(faults_rows, faults_cols)

    if args.no_plots:
        return 0

    os.makedirs(PLOTS_DIR, exist_ok=True)
    wanted = set(args.scheme) if args.scheme else None
    for scheme in SCHEME_FILES:
        if scheme not in scheme_data:
            continue
        if wanted and scheme not in wanted:
            continue
        ok_rows = scheme_data[scheme][0]
        if not ok_rows:
            print(f"[i] {scheme}: no ok rows, skipping plot")
            continue
        safe = scheme.replace("(", "_").replace(")", "").replace("/", "_")
        plot_per_scheme(scheme, ok_rows, os.path.join(PLOTS_DIR, f"{safe}_timing.png"))

    if args.combined:
        styles = COMBINED_STYLES if args.combined_style == "all" else [args.combined_style]
        for st in styles:
            suffix = "" if st == "ecdf" and args.combined_style != "all" else f"_{st}"
            plot_combined(scheme_data, summary_rows,
                          os.path.join(PLOTS_DIR, f"combined_timing{suffix}.png"), style=st)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
