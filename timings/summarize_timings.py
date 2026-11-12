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
REPO = os.path.dirname(HERE)
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
    "mayo":         os.path.join(REPO, "tests_mayo"),
    "mayo(round3)": "/home/siddhesh/Desktop/MAYO-C_Round3/MAYO-C/llvm/test_mayo",
    "snova":        "/home/siddhesh/Desktop/SNOVA_LLVM/SNOVA/llvm/test_snova",
    "qruov":        "/home/siddhesh/Desktop/QRUOV_LLVM/round2/llvm/test_qruov",
}

# scheme -> CSV filename inside this timings/ folder. Order here is the order
# used for plots and the fixed categorical colour assignment.
SCHEME_FILES = {
    "kyber":         "timing_kyber.csv",
    "dilithium":     "timing_dilithium.csv",
    "mayo":          "timing_mayo.csv",          # Round2 (== dist_tests/mayo)
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


def plot_combined(scheme_data, summary_rows, outpath):
    plt = _mpl()
    schemes = [r["scheme"] for r in summary_rows if r["scheme"] != "ALL"]
    colors = [color_for(s) for s in schemes]

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(15, 6.5))

    # Panel A: average time per scheme (linear bars start at 0).
    avgs = [next(r["avg_seconds"] for r in summary_rows if r["scheme"] == s) for s in schemes]
    x = range(len(schemes))
    ax1.bar(list(x), avgs, color=colors, width=0.68, zorder=3)
    ax1.set_xticks(list(x))
    ax1.set_xticklabels(schemes, rotation=25, ha="right", fontsize=9)
    ax1.set_ylabel("mean test wall time (seconds)")
    ax1.set_title("Average fault-test time per scheme", fontsize=12, pad=10)
    ax1.grid(axis="x", visible=False)
    for xi, a in zip(x, avgs):
        ax1.text(xi, a, f"{a:,.0f}s", ha="center", va="bottom", fontsize=8, color="#0b0b0b")
    for s in ("top", "right"):
        ax1.spines[s].set_visible(False)

    # Panel B: per-function spread per scheme (log y, jittered strip + median).
    import random
    rng = random.Random(0)
    for xi, s in enumerate(schemes):
        secs = [max(v, 1e-3) for _, v in scheme_data[s][0]]
        if not secs:
            continue
        xs = [xi + (rng.random() - 0.5) * 0.5 for _ in secs]
        ax2.scatter(xs, secs, s=16, color=color_for(s), alpha=0.6,
                    edgecolors="#fcfcfb", linewidths=0.4, zorder=3)
        med = statistics.median(secs)
        ax2.plot([xi - 0.32, xi + 0.32], [med, med], color="#0b0b0b",
                 linewidth=1.6, zorder=4)
    ax2.set_yscale("log")
    ax2.set_xticks(list(range(len(schemes))))
    ax2.set_xticklabels(schemes, rotation=25, ha="right", fontsize=9)
    ax2.set_ylabel("test wall time (seconds, log scale)")
    ax2.set_title("Per-function time distribution  (black bar = median)", fontsize=12, pad=10)
    ax2.grid(axis="x", visible=False)
    for s in ("top", "right"):
        ax2.spines[s].set_visible(False)

    fig.suptitle("PQC fault-test timings across schemes", fontsize=14, y=0.99)
    fig.tight_layout(rect=(0, 0, 1, 0.97))
    fig.savefig(outpath, dpi=150)
    plt.close(fig)
    print(f"[i] plot -> {os.path.relpath(outpath, HERE)}")


# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------
def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-combined", "--combined", dest="combined", action="store_true",
                    help="also render the combined cross-scheme plot")
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
        plot_combined(scheme_data, summary_rows, os.path.join(PLOTS_DIR, "combined_timing.png"))

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
