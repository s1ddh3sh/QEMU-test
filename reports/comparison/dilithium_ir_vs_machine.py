#!/usr/bin/env python3
"""
dilithium_ir_vs_machine.py -- comparison plots + statistics for Dilithium fault
simulation across the two approaches:

  * IR-level  (this repo, test_qemu): single LLVM-IR instructions are mutated and
    scored with three detectors (ineffective / correction / direct_leak).
    Source of truth: reports/faults/fault_report_dilithium.csv (findings) and
    reports/timings/timing_dilithium.csv (timing).

  * Machine-level (sibling repo sweep-dilithium): every machine instruction of a
    Cortex-M4 ELF is skipped in a Unicorn emulator and scored with the SAME three
    detectors, for three builds compiled from the SAME dilithium2.ll (O0 / Os / O3).
    An IR finding "translates" when a skip of an instruction compiled from the same
    IR line is flagged by the same test.
    Source of truth: sweep-dilithium/results/{stats,timing_compare,elapsed}.csv and
    results/<build>/{report_rows,machine_faults}.csv.

The two repos answer the same question at different layers, so this script quantifies
(a) how many IR findings survive as machine-instruction skips, and
(b) how the wall-clock / per-unit cost compares.

Everything plotted is COMPUTED from the CSVs (no magic constants), so re-running the
sweep and re-running this script keeps the figures in sync.

Usage
-----
    python3 reports/comparison/dilithium_ir_vs_machine.py
    python3 reports/comparison/dilithium_ir_vs_machine.py --sweep-dir ~/Desktop/sweep-dilithium
    python3 reports/comparison/dilithium_ir_vs_machine.py --no-plots      # CSV summary only

Outputs (reports/comparison/)
-----------------------------
    comparison_summary.csv              one tidy table of every number plotted
    plots/translation_by_build.png      IR findings: translate / not / no-instruction
    plots/correspondence.png            simple % of IR findings confirmed on machine
    plots/translation_by_class.png      translation split by fault class and by test
    plots/agreement_metrics.png         agreement + Cohen's kappa vs random-PC baseline
    plots/blind_sweep_scale.png         blind machine sweep: instructions vs detections
    plots/timing_totals.png             sequential-equivalent time + elapsed on 32 cores
    plots/timing_per_function.png       per-function IR vs O0/Os/O3 seconds
    plots/timing_efficiency.png         cost per unit of work (IR s/fault vs machine s/PC)
"""

from __future__ import annotations

import argparse
import csv
import os
import sys

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter

# --------------------------------------------------------------------------
# Paths
# --------------------------------------------------------------------------
HERE = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
PLOTS_DIR = os.path.join(HERE, "plots")

IR_TIMING = os.path.join(REPO_ROOT, "reports", "timings", "timing_dilithium.csv")
IR_FAULTS = os.path.join(REPO_ROOT, "reports", "faults", "fault_report_dilithium.csv")

BUILDS = ["O0", "Os", "O3"]

# --------------------------------------------------------------------------
# Design-system palette (from the dataviz skill's validated default palette).
# Categorical hues assigned in fixed order, never cycled.
# --------------------------------------------------------------------------
C_BLUE = "#2a78d6"    # slot 1  -> "translates" / IR level
C_ORANGE = "#eb6834"  # slot 2  -> "does not translate" / machine level
C_AQUA = "#1baf7a"    # slot 3  -> O0 / call skips
C_YELLOW = "#eda100"  # slot 4
C_MAGENTA = "#e87ba4"
C_VIOLET = "#6250d6"
C_GREY = "#b7b6b1"    # "no instruction left to skip" (neutral/absent)
C_MUTED = "#8a8982"   # baseline / reference

INK = "#0b0b0b"
INK2 = "#52514e"
GRID = "#e4e3df"
SURFACE = "#fcfcfb"

# per-build categorical colors (fixed order O0, Os, O3)
BUILD_COLOR = {"O0": C_BLUE, "Os": C_ORANGE, "O3": C_AQUA}

plt.rcParams.update({
    "figure.facecolor": SURFACE,
    "axes.facecolor": SURFACE,
    "savefig.facecolor": SURFACE,
    "axes.edgecolor": INK2,
    "axes.labelcolor": INK,
    "text.color": INK,
    "xtick.color": INK2,
    "ytick.color": INK2,
    "axes.grid": True,
    "grid.color": GRID,
    "grid.linewidth": 0.8,
    "axes.axisbelow": True,
    "font.size": 11,
    "axes.titlesize": 13,
    "axes.titleweight": "bold",
    "figure.dpi": 110,
})


# --------------------------------------------------------------------------
# Small helpers
# --------------------------------------------------------------------------
def _read(path):
    with open(path, newline="") as f:
        return list(csv.DictReader(f))


def _f(x):
    """Parse a float, tolerating '', None and error strings -> None."""
    if x is None:
        return None
    x = str(x).strip()
    if not x:
        return None
    try:
        return float(x)
    except ValueError:
        return None


def _bars_with_labels(ax, bars, fmt="{:.0f}", color=INK, dy=0.0):
    for b in bars:
        h = b.get_height()
        if h is None:
            continue
        ax.text(b.get_x() + b.get_width() / 2, h + dy, fmt.format(h),
                ha="center", va="bottom", fontsize=9, color=color)


def _finish(fig, path):
    fig.tight_layout()
    fig.savefig(path, bbox_inches="tight")
    plt.close(fig)
    print("  wrote", os.path.relpath(path, REPO_ROOT))


# --------------------------------------------------------------------------
# Load everything
# --------------------------------------------------------------------------
def load_data(sweep_dir):
    res = os.path.join(sweep_dir, "results")
    data = {
        "stats": _read(os.path.join(res, "stats.csv")),
        "timing_compare": _read(os.path.join(res, "timing_compare.csv")),
        "elapsed": _read(os.path.join(res, "elapsed.csv")),
        "report_rows": {b: _read(os.path.join(res, b, "report_rows.csv")) for b in BUILDS},
        "machine_faults": {b: _read(os.path.join(res, b, "machine_faults.csv")) for b in BUILDS},
        "ir_snapshot_faults": _read(os.path.join(sweep_dir, "data", "fault_report_dilithium.csv")),
    }
    # this repo's own (current) copies, for context
    data["ir_faults_current"] = _read(IR_FAULTS) if os.path.exists(IR_FAULTS) else []
    data["ir_timing_current"] = _read(IR_TIMING) if os.path.exists(IR_TIMING) else []
    return data


# --------------------------------------------------------------------------
# Derived tables
# --------------------------------------------------------------------------
CALL_FAMILY = "loopOrFuncSkip"  # IR "call skip"; everything else is a "value fault"


def translation_by_build(data):
    """For each build: of the swept IR findings, how many translate / don't /
    have no machine instruction left to skip."""
    out = {}
    for b in BUILDS:
        rows = [r for r in data["report_rows"][b] if r["ir_detected"] == "yes"]
        swept = [r for r in rows if r["mc_any"] != "not swept"]
        yes = sum(1 for r in swept if r["mc_any"] == "yes")
        no = sum(1 for r in swept if r["mc_any"] == "no")
        gone = sum(1 for r in swept if r["mc_any"] == "unmapped")
        out[b] = {"swept": len(swept), "yes": yes, "no": no, "none": gone}
    return out


def translation_by_class(data):
    """Translation counts split by fault class (call skip vs value fault)."""
    out = {}
    for b in BUILDS:
        rows = [r for r in data["report_rows"][b]
                if r["ir_detected"] == "yes" and r["mc_any"] != "not swept"]
        d = {}
        for cls, pred in (("call skip", lambda r: r["family"] == CALL_FAMILY),
                          ("value fault", lambda r: r["family"] != CALL_FAMILY)):
            sel = [r for r in rows if pred(r)]
            d[cls] = {
                "total": len(sel),
                "yes": sum(1 for r in sel if r["mc_any"] == "yes"),
                "no": sum(1 for r in sel if r["mc_any"] == "no"),
                "none": sum(1 for r in sel if r["mc_any"] == "unmapped"),
            }
        out[b] = d
    return out


def translation_by_test(data):
    out = {}
    tests = ["ineffective", "correction", "direct_leak"]
    for b in BUILDS:
        rows = [r for r in data["report_rows"][b]
                if r["ir_detected"] == "yes" and r["mc_any"] != "not swept"]
        d = {}
        for t in tests:
            sel = [r for r in rows if r["test"] == t]
            d[t] = {"total": len(sel), "yes": sum(1 for r in sel if r["mc_any"] == "yes")}
        out[b] = d
    return out


def agreement_metrics(data):
    """Pull 'all rows' confusion + random-PC baseline from stats.csv."""
    out = {}
    for b in BUILDS:
        main = next(r for r in data["stats"]
                    if r["build"] == b and r["set"] == "all rows")
        base = next((r for r in data["stats"] if r["build"] == b
                     and r["set"] == "all rows: as many random PCs"), None)
        out[b] = {
            "n": int(main["n"]),
            "tp": int(main["tp"]), "fn": int(main["fn"]),
            "fp": int(main["fp"]), "tn": int(main["tn"]),
            "agree_rate": _f(main["agree_rate"]),
            "precision": _f(main["precision"]),
            "recall": _f(main["recall"]),
            "kappa": _f(main["kappa"]),
            "base_agree": _f(base["p_agree"]) if base else None,
            "base_kappa": _f(base["p_kappa"]) if base else None,
        }
    return out


def blind_sweep_scale(data):
    """Raw scale of the blind machine sweep per build vs the IR finding count."""
    out = {}
    for b in BUILDS:
        mf = data["machine_faults"][b]
        instr = len(mf)
        detected = sum(1 for r in mf
                       if "yes" in (r.get("ineffective", ""), r.get("correction", ""),
                                    r.get("direct_leak", "")))
        never = sum(1 for r in mf if _f(r.get("fired")) == 0)
        out[b] = {"instructions": instr, "any_detection": detected, "never_executed": never}
    return out


def timing_tables(data):
    """Per-function and total timing. Swept set = functions with an O0 PC count."""
    rows = data["timing_compare"]
    per_func = []
    tot = {"ir": 0.0, "O0": 0.0, "Os": 0.0, "O3": 0.0}
    units = {"ir_faults": 0, "O0_pcs": 0, "Os_pcs": 0, "O3_pcs": 0}
    for r in rows:
        o0_pcs = _f(r.get("O0_n_pcs"))
        if o0_pcs is None:          # not swept (no input sample, open, signature_internal)
            continue
        name = r["function"].replace("pqcrystals_dilithium2_ref_", "")
        rec = {
            "function": name,
            "ir": _f(r.get("ir_seconds")),
            "O0": _f(r.get("O0_seconds")),
            "Os": _f(r.get("Os_seconds")),
            "O3": _f(r.get("O3_seconds")),
            "ir_faults": _f(r.get("ir_faults")),
            "O0_pcs": o0_pcs,
            "Os_pcs": _f(r.get("Os_n_pcs")),
            "O3_pcs": _f(r.get("O3_n_pcs")),
        }
        per_func.append(rec)
        for k in ("ir", "O0", "Os", "O3"):
            if rec[k] is not None:
                tot[k] += rec[k]
        units["ir_faults"] += int(rec["ir_faults"] or 0)
        for b in BUILDS:
            units[f"{b}_pcs"] += int(rec[f"{b}_pcs"] or 0)
    elapsed = {r["build"]: _f(r["seconds_on_32_cores"]) for r in data["elapsed"]}
    return per_func, tot, units, elapsed


# --------------------------------------------------------------------------
# Plots
# --------------------------------------------------------------------------
def plot_translation_by_build(tbb, path):
    fig, ax = plt.subplots(figsize=(7.5, 5))
    x = range(len(BUILDS))
    yes = [tbb[b]["yes"] for b in BUILDS]
    no = [tbb[b]["no"] for b in BUILDS]
    none = [tbb[b]["none"] for b in BUILDS]
    total = tbb[BUILDS[0]]["swept"]

    b1 = ax.bar(x, yes, color=C_BLUE, label="translates (same test fires)", width=0.6)
    b2 = ax.bar(x, no, bottom=yes, color=C_ORANGE,
                label="does not translate", width=0.6)
    bot2 = [i + j for i, j in zip(yes, no)]
    ax.bar(x, none, bottom=bot2, color=C_GREY,
           label="no machine instruction left to skip", width=0.6)

    # direct labels on the "translates" segment, with % of total
    for i, b in enumerate(BUILDS):
        if yes[i]:
            ax.text(i, yes[i] / 2, f"{yes[i]}\n({yes[i]/total*100:.0f}%)",
                    ha="center", va="center", color="white", fontsize=11, fontweight="bold")
        if no[i]:
            ax.text(i, yes[i] + no[i] / 2, str(no[i]), ha="center", va="center",
                    color="white", fontsize=10)
        if none[i]:
            ax.text(i, bot2[i] + none[i] / 2, str(none[i]), ha="center", va="center",
                    color=INK2, fontsize=10)

    ax.set_xticks(list(x))
    ax.set_xticklabels([f"{b}" for b in BUILDS])
    ax.set_ylabel(f"IR findings (of {total}")
    ax.set_xlabel("machine build (all compiled from the same llvm)")
    ax.set_title("Do IR findings survive as machine-instruction skips?")
    ax.legend(frameon=False, loc="upper right", fontsize=9)
    ax.set_ylim(0, total * 1.12)
    ax.grid(axis="x", visible=False)
    _finish(fig, path)


def plot_correspondence(tbb, path):
    """The easy metric: of the IR findings in swept functions, what share is
    confirmed by a machine-instruction skip, per build. One number, no chance
    correction -- the plain-English companion to the kappa plot."""
    fig, ax = plt.subplots(figsize=(7.5, 5))
    total = tbb[BUILDS[0]]["swept"]
    pct = [tbb[b]["yes"] / total * 100 for b in BUILDS]
    ax.bar(BUILDS, pct, color=[BUILD_COLOR[b] for b in BUILDS], width=0.6)
    for i, b in enumerate(BUILDS):
        ax.text(i, pct[i] + 1.5, f"{pct[i]:.0f}%\n{tbb[b]['yes']}/{total}",
                ha="center", va="bottom", fontsize=11, fontweight="bold", color=INK2)
    ax.axhline(100, color=C_MUTED, linestyle="--", linewidth=1.3)
    ax.text(len(BUILDS) - 0.5, 100, "  all IR findings", va="bottom", ha="right",
            color=INK2, fontsize=9)
    ax.set_ylim(0, 115)
    ax.yaxis.set_major_formatter(FuncFormatter(lambda v, _: f"{v:.0f}%"))
    ax.set_ylabel(f"IR findings confirmed on machine (of {total})")
    ax.set_xlabel("machine build (all compiled from the same llvm)")
    ax.set_title("IR findings confirmed on machine")
    ax.grid(axis="x", visible=False)
    _finish(fig, path)


def plot_translation_by_class(tbc, tbt, path):
    fig, (axL, axR) = plt.subplots(1, 2, figsize=(13, 5))

    # --- left: by fault class, grouped (translate count out of class total) ---
    classes = ["call skip", "value fault"]
    width = 0.38
    xs = range(len(classes))
    for k, b in enumerate(BUILDS):
        vals = [tbc[b][c]["yes"] for c in classes]
        tots = [tbc[b][c]["total"] for c in classes]
        off = (k - 1) * width
        bars = axL.bar([i + off for i in xs], vals, width=width,
                       color=BUILD_COLOR[b], label=b)
        for i, (v, t) in enumerate(zip(vals, tots)):
            axL.text(i + off, v + 0.2, f"{v}/{t}", ha="center", va="bottom", fontsize=8.5,
                     color=INK2)
    axL.set_xticks(list(xs))
    axL.set_xticklabels(classes)
    axL.set_ylabel("findings that translate")
    axL.set_title("Translation by fault class")
    axL.legend(frameon=False, title="build", fontsize=9, title_fontsize=9)
    axL.grid(axis="x", visible=False)
    axL.set_ylim(0, max(tbc["O0"][c]["total"] for c in classes) * 1.25)

    # --- right: by test type ---
    tests = ["ineffective", "correction", "direct_leak"]
    xt = range(len(tests))
    for k, b in enumerate(BUILDS):
        vals = [tbt[b][t]["yes"] for t in tests]
        tots = [tbt[b][t]["total"] for t in tests]
        off = (k - 1) * width
        axR.bar([i + off for i in xt], vals, width=width, color=BUILD_COLOR[b], label=b)
        for i, (v, t) in enumerate(zip(vals, tots)):
            axR.text(i + off, v + 0.2, f"{v}/{t}", ha="center", va="bottom", fontsize=8.5,
                     color=INK2)
    axR.set_xticks(list(xt))
    axR.set_xticklabels(tests)
    axR.set_title("Translation by detector")
    axR.legend(frameon=False, title="build", fontsize=9, title_fontsize=9)
    axR.grid(axis="x", visible=False)
    axR.set_ylim(0, max(tbt["O0"][t]["total"] for t in tests) * 1.3)

    fig.suptitle("Which Dilithium IR findings translate to machine skips",
                 fontsize=14, fontweight="bold", y=1.02)
    _finish(fig, path)


def plot_agreement(am, path):
    fig, axL = plt.subplots(figsize=(7.5, 5))

    # stacked confusion (TP/FN/FP/TN) per build, as share of n
    labels = [("tp", "both agree (TP)", C_BLUE),
              ("fn", "IR yes, machine no (FN)", C_ORANGE),
              ("fp", "IR no, machine yes (FP)", C_YELLOW),
              ("tn", "both disagree (TN)", C_GREY)]
    bottom = [0] * len(BUILDS)
    for key, lab, col in labels:
        vals = [am[b][key] for b in BUILDS]
        axL.bar(BUILDS, vals, bottom=bottom, color=col, label=lab, width=0.6)
        bottom = [a + c for a, c in zip(bottom, vals)]
    axL.set_ylabel("all tested faults × tests")
    axL.set_title("IR vs machine agreement (O0/Os/O3)")
    axL.legend(frameon=False, fontsize=8.5, loc="upper right")
    axL.grid(axis="x", visible=False)

    # fig.suptitle("Statistical agreement between the two approaches",
    #              fontsize=14, fontweight="bold", y=1.02)
    _finish(fig, path)


def plot_blind_sweep(bss, ir_findings_swept, path):
    fig, ax = plt.subplots(figsize=(8.5, 5))
    xs = range(len(BUILDS))
    width = 0.38
    instr = [bss[b]["instructions"] for b in BUILDS]
    det = [bss[b]["any_detection"] for b in BUILDS]
    b1 = ax.bar([i - width / 2 for i in xs], instr, width=width, color=C_BLUE,
                label="machine instructions skipped (blind sweep)")
    b2 = ax.bar([i + width / 2 for i in xs], det, width=width, color=C_ORANGE,
                label="instructions flagged by ≥ 1 detector")
    _bars_with_labels(ax, b1)
    _bars_with_labels(ax, b2)
    ax.axhline(ir_findings_swept, color=C_MUTED, linestyle="--", linewidth=1.6)
    ax.text(len(BUILDS) - 0.5, ir_findings_swept, f"  IR findings = {ir_findings_swept}",
            va="bottom", ha="right", color=INK2, fontsize=9)
    ax.set_xticks(list(xs))
    ax.set_xticklabels(BUILDS)
    ax.set_ylabel("count (log scale)")
    ax.set_yscale("log")
    ax.set_title("The machine sweep is exhaustive and blind\n"
                 "(counts inflated by unrolling / inlining — not comparable across builds)")
    ax.legend(frameon=False, fontsize=9, loc="upper left")
    ax.grid(axis="x", visible=False)
    _finish(fig, path)


def plot_timing_totals(tot, elapsed, path):
    fig, (axL, axR) = plt.subplots(1, 2, figsize=(13, 5))

    cats = ["IR", "O0", "Os", "O3"]
    secs = [tot["ir"], tot["O0"], tot["Os"], tot["O3"]]
    cols = [C_MUTED, C_BLUE, C_ORANGE, C_AQUA]
    bars = axL.bar(cats, secs, color=cols, width=0.62)
    for b, s in zip(bars, secs):
        axL.text(b.get_x() + b.get_width() / 2, s, f"{s/3600:.1f} h\n{s:,.0f} s",
                 ha="center", va="bottom", fontsize=9, color=INK2)
    axL.set_ylabel("sequential-equivalent seconds")
    axL.set_title("Total work, 31 swept functions\n(sum of parallel work, one core)")
    axL.set_ylim(0, max(secs) * 1.18)
    axL.grid(axis="x", visible=False)

    # elapsed on 32 cores (machine builds only; IR has no parallel elapsed figure)
    eb = [b for b in BUILDS if elapsed.get(b) is not None]
    evals = [elapsed[b] for b in eb]
    bars2 = axR.bar(eb, evals, color=[BUILD_COLOR[b] for b in eb], width=0.55)
    for b, s in zip(bars2, evals):
        axR.text(b.get_x() + b.get_width() / 2, s, f"{s/60:.0f} min\n{s:,.0f} s",
                 ha="center", va="bottom", fontsize=9, color=INK2)
    axR.set_ylabel("seconds elapsed on 32 cores")
    axR.set_title("Machine sweep wall-clock (parallel)")
    axR.set_ylim(0, max(evals) * 1.2)
    axR.grid(axis="x", visible=False)

    fig.suptitle("Dilithium fault-simulation cost: IR level vs machine level",
                 fontsize=14, fontweight="bold", y=1.02)
    _finish(fig, path)


def plot_timing_per_function(per_func, path, top=18):
    rows = sorted([r for r in per_func if r["ir"] is not None],
                  key=lambda r: r["ir"], reverse=True)[:top]
    rows.reverse()
    names = [r["function"] for r in rows]
    y = range(len(names))
    h = 0.2
    fig, ax = plt.subplots(figsize=(10, max(5, 0.5 * len(names))))
    series = [("ir", "IR level", C_MUTED), ("O0", "O0", C_BLUE),
              ("Os", "Os", C_ORANGE), ("O3", "O3", C_AQUA)]
    for k, (key, lab, col) in enumerate(series):
        vals = [(r[key] or 0) for r in rows]
        off = (k - 1.5) * h
        ax.barh([i + off for i in y], vals, height=h, color=col, label=lab)
    ax.set_yticks(list(y))
    ax.set_yticklabels(names, fontsize=9)
    ax.set_xlabel("sequential-equivalent seconds (log scale)")
    ax.set_xscale("log")
    ax.set_title(f"Per-function time, IR vs machine builds (top {len(names)} by IR time)")
    ax.legend(frameon=False, fontsize=9, loc="lower right")
    ax.grid(axis="y", visible=False)
    _finish(fig, path)


def plot_timing_efficiency(per_func, tot, units, path):
    """Cost per unit of work: IR seconds per fault vs machine seconds per PC."""
    fig, (axL, axR) = plt.subplots(1, 2, figsize=(13, 5))

    # left: aggregate seconds-per-unit
    ir_per = tot["ir"] / units["ir_faults"] if units["ir_faults"] else 0
    cats = ["IR\n(per IR fault)", "O0\n(per PC)", "Os\n(per PC)", "O3\n(per PC)"]
    vals = [ir_per]
    cols = [C_MUTED]
    for b, c in zip(BUILDS, [C_BLUE, C_ORANGE, C_AQUA]):
        pcs = units[f"{b}_pcs"]
        vals.append(tot[b] / pcs if pcs else 0)
        cols.append(c)
    bars = axL.bar(cats, vals, color=cols, width=0.62)
    for b, v in zip(bars, vals):
        axL.text(b.get_x() + b.get_width() / 2, v, f"{v:,.1f} s",
                 ha="center", va="bottom", fontsize=9, color=INK2)
    axL.set_ylabel("seconds per fault / per instruction")
    axL.set_title("Cost per unit of work\n(aggregate over 31 swept functions)")
    axL.set_ylim(0, max(vals) * 1.18)
    axL.grid(axis="x", visible=False)

    # right: poly_add as the like-for-like exemplar from the report
    pa = next((r for r in per_func if r["function"] == "poly_add"), None)
    if pa:
        ir_pf = (pa["ir"] / pa["ir_faults"]) if pa["ir_faults"] else 0
        o0_pf = (pa["O0"] / pa["O0_pcs"]) if pa["O0_pcs"] else 0
        bars = axR.bar(["IR\n(per fault)", "O0\n(per instruction)"], [ir_pf, o0_pf],
                       color=[C_MUTED, C_BLUE], width=0.5)
        for b, v in zip(bars, [ir_pf, o0_pf]):
            axR.text(b.get_x() + b.get_width() / 2, v, f"{v:,.1f} s",
                     ha="center", va="bottom", fontsize=10, color=INK2)
        axR.set_ylabel("seconds")
        axR.set_title("poly_add: like-for-like unit cost")
        axR.set_ylim(0, max(ir_pf, o0_pf) * 1.18)
        axR.grid(axis="x", visible=False)

    fig.suptitle("Per-unit efficiency: targeting IR faults vs sweeping every instruction",
                 fontsize=14, fontweight="bold", y=1.02)
    _finish(fig, path)


# --------------------------------------------------------------------------
# Summary CSV
# --------------------------------------------------------------------------
def write_summary(path, tbb, tbc, am, bss, tot, units, elapsed, ir_findings_swept):
    with open(path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["section", "metric", "O0", "Os", "O3", "IR"])
        w.writerow(["findings", "IR findings in swept functions",
                    ir_findings_swept, ir_findings_swept, ir_findings_swept, ir_findings_swept])
        w.writerow(["translation", "translate (same test fires)",
                    *[tbb[b]["yes"] for b in BUILDS], ""])
        w.writerow(["translation", "do not translate",
                    *[tbb[b]["no"] for b in BUILDS], ""])
        w.writerow(["translation", "no machine instruction left",
                    *[tbb[b]["none"] for b in BUILDS], ""])
        w.writerow(["translation", "translate %",
                    *[f"{tbb[b]['yes']/tbb[b]['swept']*100:.0f}%" for b in BUILDS], ""])
        for cls in ("call skip", "value fault"):
            w.writerow(["translation by class", f"{cls}: translate / total",
                        *[f"{tbc[b][cls]['yes']}/{tbc[b][cls]['total']}" for b in BUILDS], ""])
        for key, lab in (("tp", "TP (agree yes)"), ("fn", "FN"), ("fp", "FP"),
                         ("tn", "TN (agree no)")):
            w.writerow(["agreement", lab, *[am[b][key] for b in BUILDS], ""])
        w.writerow(["agreement", "agreement rate",
                    *[f"{am[b]['agree_rate']:.3f}" for b in BUILDS], ""])
        w.writerow(["agreement", "Cohen's kappa",
                    *[f"{am[b]['kappa']:.3f}" for b in BUILDS], ""])
        w.writerow(["agreement", "kappa random-PC baseline",
                    *[f"{am[b]['base_kappa']:.3f}" for b in BUILDS], ""])
        w.writerow(["blind sweep", "machine instructions skipped",
                    *[bss[b]["instructions"] for b in BUILDS], ""])
        w.writerow(["blind sweep", "instructions flagged by >=1 detector",
                    *[bss[b]["any_detection"] for b in BUILDS], ""])
        w.writerow(["timing", "sequential-equivalent seconds",
                    *[f"{tot[b]:.0f}" for b in BUILDS], f"{tot['ir']:.0f}"])
        w.writerow(["timing", "units (PCs / IR faults)",
                    *[units[f"{b}_pcs"] for b in BUILDS], units["ir_faults"]])
        w.writerow(["timing", "seconds per unit",
                    *[f"{tot[b]/units[f'{b}_pcs']:.2f}" for b in BUILDS],
                    f"{tot['ir']/units['ir_faults']:.2f}"])
        w.writerow(["timing", "elapsed on 32 cores (s)",
                    *[f"{elapsed.get(b,'')}" for b in BUILDS], ""])
    print("  wrote", os.path.relpath(path, REPO_ROOT))


# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------
def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    default_sweep = os.path.expanduser("~/Desktop/sweep-dilithium")
    ap.add_argument("--sweep-dir", default=default_sweep,
                    help="path to the sweep-dilithium repo (default: %(default)s)")
    ap.add_argument("--no-plots", action="store_true", help="write the summary CSV only")
    args = ap.parse_args(argv)

    if not os.path.isdir(os.path.join(args.sweep_dir, "results")):
        ap.error(f"no results/ under --sweep-dir {args.sweep_dir!r}; "
                 "point it at the sweep-dilithium checkout")

    os.makedirs(PLOTS_DIR, exist_ok=True)
    print(f"sweep-dilithium: {args.sweep_dir}")
    print(f"this repo:       {REPO_ROOT}")

    data = load_data(args.sweep_dir)

    tbb = translation_by_build(data)
    tbc = translation_by_class(data)
    tbt = translation_by_test(data)
    am = agreement_metrics(data)
    bss = blind_sweep_scale(data)
    per_func, tot, units, elapsed = timing_tables(data)
    ir_findings_swept = tbb[BUILDS[0]]["swept"]

    # console recap
    print(f"\nIR findings in the {len(per_func)} swept functions: {ir_findings_swept}")
    for b in BUILDS:
        t = tbb[b]
        print(f"  {b}: translate {t['yes']:>2}/{t['swept']} "
              f"({t['yes']/t['swept']*100:.0f}%)  |  no:{t['no']}  none-left:{t['none']}  "
              f"| kappa={am[b]['kappa']:.2f}")
    print(f"sequential-equiv seconds: IR={tot['ir']:.0f}  "
          f"O0={tot['O0']:.0f}  Os={tot['Os']:.0f}  O3={tot['O3']:.0f}")

    write_summary(os.path.join(HERE, "comparison_summary.csv"),
                  tbb, tbc, am, bss, tot, units, elapsed, ir_findings_swept)

    if args.no_plots:
        return 0

    print("plots:")
    plot_translation_by_build(tbb, os.path.join(PLOTS_DIR, "translation_by_build.png"))
    plot_correspondence(tbb, os.path.join(PLOTS_DIR, "correspondence.png"))
    plot_translation_by_class(tbc, tbt, os.path.join(PLOTS_DIR, "translation_by_class.png"))
    plot_agreement(am, os.path.join(PLOTS_DIR, "agreement_metrics.png"))
    plot_blind_sweep(bss, ir_findings_swept, os.path.join(PLOTS_DIR, "blind_sweep_scale.png"))
    plot_timing_totals(tot, elapsed, os.path.join(PLOTS_DIR, "timing_totals.png"))
    plot_timing_per_function(per_func, os.path.join(PLOTS_DIR, "timing_per_function.png"))
    plot_timing_efficiency(per_func, tot, units,
                           os.path.join(PLOTS_DIR, "timing_efficiency.png"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
