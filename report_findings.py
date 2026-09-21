#!/usr/bin/env python3
"""
report_findings.py — scan tests_mayo/, tests_kyber/, tests_dilithium/ for
fault-leakage test results and collate them into one CSV per scheme.

Two result-file conventions exist side by side and are BOTH scanned,
independently, per fault folder (a folder can have either, both, or
neither -- e.g. a function tested via both the full paired-sweep
pipeline (run_tests.sh / run_tests_unicorn.sh) and the early-stop
pipeline (run_combined.sh / run_combined_unicorn.sh, Dilithium/Kyber
only) gets one row per test per source file it actually has):

  test_result.txt (Dilithium/Kyber only -- written by dist_and_test.py /
  early_stop_sweep_unicorn.py):
      [RESULT] ineffective test: DETECTED at pos 0 (s1=256 ineffective, s2=0 effective)
      [RESULT] correction test: DETECTED at pos 0 (s1=0 Delta=116, s2=256 Delta=0)
  or, when nothing was found in the swept range:
      [RESULT] ineffective test: no disagreement found in range swept
      [RESULT] correction test: no disagreement found in range swept

  ineffective_paired_result.txt / correction_paired_result.txt (all three
  schemes -- written by run_ineffective_paired.sh / run_correction_paired.sh,
  wrapping ineffective_<algo>.py / correction_<algo>.py): a "DETECTED" verdict
  isn't printed explicitly -- presence of at least one
      pos N: X/Y pairs disagree
  line with X > 0 anywhere in the file IS the detection (see report.sh,
  which this script supersedes for the paired-result format and extends
  with Dilithium + the test_result.txt format + machine-readable CSV
  output).

A fault folder's name is its path relative to the function's tests_<algo>/
<func_name>/ directory (e.g. "loopOrFuncSkip/<faulty_stem>" for a nested
Dilithium/Kyber fault, or "add_f_line0_opA" for a flat MAYO one), so
nested layouts are preserved instead of collapsed to a basename.

Usage:
    python3 report_findings.py [--outdir DIR] [--schemes mayo,kyber,dilithium]

Writes <outdir>/fault_report_<scheme>.csv for each scheme that has any
tests_<scheme>/ directory, plus a combined fault_report_all.csv, and
prints a short per-scheme detected/total summary to stdout.
"""

import argparse
import csv
import os
import re
import sys

PAIRED_FILENAMES = {
    "ineffective_paired_result.txt": "ineffective",
    "correction_paired_result.txt": "correction",
}
PAIRED_HIT_RE = re.compile(r"^pos (\d+): (\d+)/(\d+) pairs disagree", re.MULTILINE)

TEST_RESULT_FILENAME = "test_result.txt"
TEST_RESULT_RE = re.compile(
    r"^\[RESULT\] (ineffective|correction) test: (DETECTED.*|no disagreement.*)$",
    re.MULTILINE,
)

FIELDNAMES = ["scheme", "function", "fault", "source", "test", "detected", "detail"]

# Status colors (fixed, never themed) and the two-test categorical pair, from
# the project's dataviz palette: slot-1 blue / slot-2 orange for the
# ineffective/correction series identity, status-critical red used only for
# the scalar "faults with NO leak detected by either test" callout.
COLOR_INEFFECTIVE = "#2a78d6"   # categorical slot 1 (blue)
COLOR_CORRECTION = "#eb6834"    # categorical slot 2 (orange)
COLOR_UNDETECTED = "#d03b3b"    # status critical (used sparingly, labeled)
COLOR_GRID = "#d9d8d2"
COLOR_TEXT = "#0b0b0b"
COLOR_TEXT_MUTED = "#52514e"


def parse_paired_result(path):
    """Returns [(detected: bool, detail: str)] -- at most one row, since a
    paired-result file is one test's ENTIRE verdict, not per-position."""
    try:
        text = open(path, errors="replace").read()
    except OSError as e:
        return [(False, f"(unreadable: {e})")]
    hits = PAIRED_HIT_RE.findall(text)
    positive = [(pos, x, y) for pos, x, y in hits if int(x) > 0]
    if positive:
        pos, x, y = positive[0]
        extra = f" (+{len(positive) - 1} more position(s))" if len(positive) > 1 else ""
        return [(True, f"pos {pos}: {x}/{y} pairs disagree{extra}")]
    return [(False, "no position with disagreeing pairs")]


def parse_test_result(path):
    """Returns [(test, detected, detail), ...] for whichever of
    ineffective/correction have a [RESULT] line in this file (normally
    both, but don't assume it)."""
    try:
        text = open(path, errors="replace").read()
    except OSError as e:
        return [("ineffective", False, f"(unreadable: {e})"), ("correction", False, f"(unreadable: {e})")]
    out = []
    for test, verdict in TEST_RESULT_RE.findall(text):
        detected = verdict.startswith("DETECTED")
        out.append((test, detected, verdict.strip()))
    return out


def fault_name(func_dir, result_path):
    rel = os.path.relpath(os.path.dirname(result_path), func_dir)
    rel = rel.replace(os.sep, "/")
    return "(root)" if rel == "." else rel


def scan_scheme(scheme, tests_root):
    """Yields dicts matching FIELDNAMES for every result file found under
    tests_root (a tests_<scheme>/ directory, symlink-followed)."""
    if not os.path.isdir(tests_root):
        return
    for func_name in sorted(os.listdir(tests_root)):
        func_dir = os.path.join(tests_root, func_name)
        if not os.path.isdir(func_dir):
            continue
        for dirpath, _dirnames, filenames in os.walk(func_dir, followlinks=True):
            for fn in filenames:
                if fn in PAIRED_FILENAMES:
                    path = os.path.join(dirpath, fn)
                    test = PAIRED_FILENAMES[fn]
                    fault = fault_name(func_dir, path)
                    for detected, detail in parse_paired_result(path):
                        yield {
                            "scheme": scheme,
                            "function": func_name,
                            "fault": fault,
                            "source": fn,
                            "test": test,
                            "detected": "yes" if detected else "no",
                            "detail": detail,
                        }
                elif fn == TEST_RESULT_FILENAME:
                    path = os.path.join(dirpath, fn)
                    fault = fault_name(func_dir, path)
                    for test, detected, detail in parse_test_result(path):
                        yield {
                            "scheme": scheme,
                            "function": func_name,
                            "fault": fault,
                            "source": fn,
                            "test": test,
                            "detected": "yes" if detected else "no",
                            "detail": detail,
                        }


def aggregate_detection_rates(rows):
    """Collapses `rows` (as written to the CSV) to one (detected: bool) per
    (function, fault, test) -- if EITHER source file for a given fault+test
    says detected, it counts as detected once, so a fault tested via both
    the paired-sweep and early-stop pipelines isn't double-counted or
    allowed to cancel itself out. Returns {function: {test: (n_detected,
    n_total)}}."""
    verdict = {}  # (function, fault, test) -> bool (OR'd across sources)
    for r in rows:
        key = (r["function"], r["fault"], r["test"])
        is_hit = r["detected"] == "yes"
        verdict[key] = verdict.get(key, False) or is_hit

    counts = {}  # function -> test -> [n_detected, n_total]
    for (func, _fault, test), detected in verdict.items():
        bucket = counts.setdefault(func, {"ineffective": [0, 0], "correction": [0, 0]})
        bucket[test][1] += 1
        if detected:
            bucket[test][0] += 1
    return counts


def plot_scheme(scheme, rows, out_path):
    """Horizontal grouped bar chart: one row per function that has at least
    one tested fault, two bars (ineffective/correction detection rate).
    Requires matplotlib -- raises a clear RuntimeError if it isn't
    installed, rather than a bare ImportError traceback."""
    try:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
    except ImportError as e:
        raise RuntimeError(
            "matplotlib is required for --plot (pip install matplotlib)"
        ) from e

    counts = aggregate_detection_rates(rows)
    # Drop functions with zero tested faults for BOTH tests -- nothing to
    # plot, and they'd otherwise render as two zero-length bars.
    funcs = [f for f, c in counts.items() if c["ineffective"][1] or c["correction"][1]]
    if not funcs:
        raise RuntimeError(f"no plottable data for scheme {scheme!r}")

    def rate(func, test):
        n_hit, n_total = counts[func][test]
        return (100.0 * n_hit / n_total) if n_total else 0.0

    # Sort by combined detection rate descending, so the functions with the
    # most leakage lead -- the headline a reader wants first.
    funcs.sort(key=lambda f: (rate(f, "ineffective") + rate(f, "correction")), reverse=True)

    n = len(funcs)
    fig_h = max(3.0, 0.34 * n + 1.5)
    fig, ax = plt.subplots(figsize=(10, fig_h), dpi=150)
    fig.patch.set_facecolor("#fcfcfb")
    ax.set_facecolor("#fcfcfb")

    y = range(n)
    bar_h = 0.36
    ineff_rates = [rate(f, "ineffective") for f in funcs]
    corr_rates = [rate(f, "correction") for f in funcs]

    ax.barh([i + bar_h / 2 + 0.02 for i in y], ineff_rates, height=bar_h,
            color=COLOR_INEFFECTIVE, label="ineffective test", zorder=3)
    ax.barh([i - bar_h / 2 - 0.02 for i in y], corr_rates, height=bar_h,
            color=COLOR_CORRECTION, label="correction test", zorder=3)

    # Direct labels: "n/N" so the bar carries the real counts, not just a
    # rate that could be misread as a percentage of ALL faults in the repo.
    for i, f in enumerate(funcs):
        for offset, test, color in (
            (bar_h / 2 + 0.02, "ineffective", COLOR_INEFFECTIVE),
            (-bar_h / 2 - 0.02, "correction", COLOR_CORRECTION),
        ):
            n_hit, n_total = counts[f][test]
            if n_total == 0:
                continue
            r = rate(f, test)
            ax.text(r + 1.5, i + offset, f"{n_hit}/{n_total}",
                    va="center", ha="left", fontsize=7.5, color=COLOR_TEXT_MUTED)

    ax.set_yticks(list(y))
    ax.set_yticklabels(funcs, fontsize=8.5, color=COLOR_TEXT)
    ax.invert_yaxis()
    ax.set_xlim(0, 108)
    ax.set_xlabel("faults with the leak DETECTED (%)", fontsize=9, color=COLOR_TEXT_MUTED)
    ax.set_title(
        f"{scheme}: fault-leakage detection rate by function\n"
        f"(counts = distinct faults tested, OR'd across every result source found)",
        fontsize=11, color=COLOR_TEXT, loc="left", pad=12,
    )
    ax.grid(axis="x", color=COLOR_GRID, linewidth=0.7, zorder=0)
    ax.set_axisbelow(True)
    for spine in ("top", "right", "left"):
        ax.spines[spine].set_visible(False)
    ax.spines["bottom"].set_color(COLOR_GRID)
    ax.tick_params(left=False, bottom=False)
    ax.legend(
        loc="lower right", frameon=False, fontsize=8.5,
        labelcolor=COLOR_TEXT_MUTED,
    )

    fig.tight_layout()
    fig.savefig(out_path, facecolor=fig.get_facecolor())
    plt.close(fig)
    return out_path


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", default=".", help="repo root (default: cwd)")
    ap.add_argument("--outdir", default=".", help="where to write CSVs (default: cwd)")
    ap.add_argument(
        "--schemes", default="mayo,kyber,dilithium",
        help="comma-separated subset of mayo,kyber,dilithium (default: all three)",
    )
    ap.add_argument(
        "--plot", action="store_true",
        help="also write fault_report_<scheme>.png: a horizontal bar chart "
             "of ineffective/correction detection rate by function "
             "(requires matplotlib).",
    )
    args = ap.parse_args()

    schemes = [s.strip() for s in args.schemes.split(",") if s.strip()]
    os.makedirs(args.outdir, exist_ok=True)

    all_rows = []
    for scheme in schemes:
        tests_root = os.path.join(args.root, f"tests_{scheme}")
        rows = list(scan_scheme(scheme, tests_root))
        all_rows.extend(rows)

        out_path = os.path.join(args.outdir, f"fault_report_{scheme}.csv")
        with open(out_path, "w", newline="") as f:
            w = csv.DictWriter(f, fieldnames=FIELDNAMES)
            w.writeheader()
            for row in sorted(rows, key=lambda r: (r["function"], r["fault"], r["test"], r["source"])):
                w.writerow(row)

        n_detected = sum(1 for r in rows if r["detected"] == "yes")
        n_faults = len({(r["function"], r["fault"]) for r in rows})
        n_funcs = len({r["function"] for r in rows})
        if rows:
            print(f"[{scheme}] {out_path}: {len(rows)} test result(s) across "
                  f"{n_faults} fault(s) in {n_funcs} function(s) -- "
                  f"{n_detected} DETECTED")
        else:
            print(f"[{scheme}] {out_path}: no result files found under {tests_root}")

        if args.plot and rows:
            png_path = os.path.join(args.outdir, f"fault_report_{scheme}.png")
            try:
                plot_scheme(scheme, rows, png_path)
                print(f"[{scheme}] {png_path}: detection-rate-by-function chart")
            except RuntimeError as e:
                print(f"[{scheme}] [!] plot skipped: {e}")

    combined_path = os.path.join(args.outdir, "fault_report_all.csv")
    with open(combined_path, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=FIELDNAMES)
        w.writeheader()
        for row in sorted(all_rows, key=lambda r: (r["scheme"], r["function"], r["fault"], r["test"], r["source"])):
            w.writerow(row)
    print(f"[all] {combined_path}: {len(all_rows)} total test result(s)")


if __name__ == "__main__":
    sys.exit(main())
