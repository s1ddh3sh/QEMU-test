#!/usr/bin/env bash
#
# run_tests_all.sh — build and run the full Unicorn early-stop pipeline
# for EVERY Dilithium function listed in dilithium.json.
#
# For each function in dilithium.json:
#   1. ./dilithium_build.sh tests_dilithium/<function>   (build the correct + faulty ELFs)
#   2. ./dist_tests/dilithium/run_combined_unicorn.sh <function> --seeds 0,1,2,3 --fresh
#
# Each function's build+test is INDEPENDENT of every other function, so the
# functions are run in parallel under a single GLOBAL pool of CORES tokens
# shared by every function's faulty-ELF sweep. A core is held per ACTIVE
# sweep, never reserved per function, so there is NO per-function cap (a lone
# function can use the whole machine) and yet cores a function is not using --
# while it builds, calibrates, or tapers off at the end of its sweep -- are
# immediately picked up by other functions' sweeps. This closely matches the
# sweep-dilithium repo's single global work queue (there over machine
# instructions; here over faulty ELFs). Each function's full output is
# streamed to its own log file (so parallel output does not interleave), and
# a one-line PASS/FAIL is printed as each finishes.
#
# Like run_combined_unicorn.sh, this script must be run from the repo root
# (dilithium.json and dilithium_build.sh are repo-root-relative).
#
# Usage:
#   ./dist_tests/dilithium/run_tests_all.sh [-c N] [-j N] [--per-func-max M] [func ...]
#
#   -c N             size of the GLOBAL sweep pool -- the max number of
#                    faulty-ELF sweeps running at once across ALL functions
#                    (default: number of CPUs, $(nproc)). This is the real
#                    parallelism knob; idle cores are shared between functions.
#   -j N             how many functions may be in flight at once (build +
#                    calibrate + launching their sweeps). Default: N = the pool
#                    size. It bounds the build/calibrate burst, not the sweeps.
#   --per-func-max M cap on how many sweeps one function launches at once
#                    (default: the pool size). There is no real per-function
#                    cap -- a lone function can hold every token -- so normally
#                    leave this alone; lower it only to bound launched helpers.
#   func ...         optional explicit list of functions to run; if omitted,
#                    every key in dilithium.json is run.
#
# A core is held per ACTIVE sweep (via the global token pool), so a function
# uses cores only while it is actually sweeping; the moment it is building,
# calibrating, or down to its last few faults, the freed cores go to other
# functions. There is no per-function reservation.
#
# A single function's failure (build or test) does not stop the sweep --
# it is recorded and reported in the summary at the end, and the script
# exits non-zero if anything failed.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_JSON="dilithium.json"
DILITHIUM_BUILD="./dilithium_build.sh"
RUN_COMBINED="${SCRIPT_DIR}/run_combined_unicorn.sh"
SEEDS="0,1,2,3"

SCHEME="dilithium"
UPSERT_PY="${SCRIPT_DIR}/../common/upsert_timing.py"
PERFUNC_CSV="${SCRIPT_DIR}/timing_${SCHEME}.csv"        # per-function timings
SUMMARY_CSV="${SCRIPT_DIR}/../timing_schemes_summary.csv"  # avg over all schemes

NPROC="$(nproc 2>/dev/null || echo 4)"
CORES=""          # -c/--cores : total core budget (default: NPROC)
MAXFUNCS=""       # -j/--jobs  : cap on concurrent functions (default: CORES)
PERFUNC_MAX=""    # --per-func-max : cap on inner workers per function (default: CORES)

# ---- arg parse ------------------------------------------------------------
EXPLICIT_FUNCS=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        -c|--cores)     CORES="$2"; shift 2 ;;
        -c*)            CORES="${1#-c}"; shift ;;
        -j|--jobs)      MAXFUNCS="$2"; shift 2 ;;
        -j*)            MAXFUNCS="${1#-j}"; shift ;;
        --per-func-max) PERFUNC_MAX="$2"; shift 2 ;;
        --)             shift; EXPLICIT_FUNCS+=("$@"); break ;;
        -*)             echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
        *)              EXPLICIT_FUNCS+=("$1"); shift ;;
    esac
done

CORES="${CORES:-$NPROC}"
MAXFUNCS="${MAXFUNCS:-$CORES}"
PERFUNC_MAX="${PERFUNC_MAX:-$CORES}"
for _name in CORES MAXFUNCS PERFUNC_MAX; do
    _val="${!_name}"
    if ! [[ "$_val" =~ ^[0-9]+$ && "$_val" -ge 1 ]]; then
        echo "[!] ${_name} must be a positive integer (got: ${_val})" >&2
        exit 1
    fi
done

# fault_weight: how many inner workers a function can actually use == how many
# faulty ELFs it has == how many faulty mutant .ll files live under its
# tests_dilithium/<func> dir (the sources those ELFs build from; the full
# correct ELF under full_dilithium/ is excluded). Computed before the build so
# the scheduler can size each function's slice; clamped to [1, PERFUNC_MAX].
# A function with no mutant files found still gets 1 (its sweep self-limits).
fault_weight() {
    local func="$1" d="tests_dilithium/${func}" n
    n="$(find "$d" -mindepth 2 -type f -name '*.ll' \
            -not -path '*/full_*/*' 2>/dev/null | wc -l)"
    (( n < 1 )) && n=1
    (( n > PERFUNC_MAX )) && n=$PERFUNC_MAX
    echo "$n"
}

if [[ ! -f "$CONFIG_JSON" ]]; then
    echo "[!] ${CONFIG_JSON} not found -- run this script from the repo root" >&2
    exit 1
fi
if [[ ! -x "$DILITHIUM_BUILD" ]]; then
    echo "[!] ${DILITHIUM_BUILD} not found or not executable -- run this script from the repo root" >&2
    exit 1
fi
if [[ ! -x "$RUN_COMBINED" ]]; then
    echo "[!] required script not found or not executable: ${RUN_COMBINED}" >&2
    exit 1
fi

if [[ "${#EXPLICIT_FUNCS[@]}" -gt 0 ]]; then
    FUNCS=("${EXPLICIT_FUNCS[@]}")
else
    mapfile -t FUNCS < <(python3 -c "
import json
with open('${CONFIG_JSON}') as f:
    print('\n'.join(json.load(f).keys()))
")
fi

if [[ "${#FUNCS[@]}" -eq 0 ]]; then
    echo "[!] no functions to run" >&2
    exit 1
fi

LOG_DIR="$(mktemp -d "${TMPDIR:-/tmp}/dilithium_run_all.XXXXXX")"
trap 'rm -rf "$LOG_DIR"' EXIT

# Pre-compute each function's inner-worker weight, then order the functions
# costliest (widest) first, so the greedy packer fills the core budget the way
# the sweep repo's costliest-first queue does.
declare -A WEIGHT=()
for func in "${FUNCS[@]}"; do
    WEIGHT["$func"]="$(fault_weight "$func")"
done
mapfile -t FUNCS < <(
    for func in "${FUNCS[@]}"; do
        printf '%s\t%s\n' "${WEIGHT[$func]}" "$func"
    done | sort -rn -k1,1 | cut -f2-
)

echo "[i] ${#FUNCS[@]} function(s) to run; global sweep pool ${CORES} core(s) (nproc=${NPROC}), "\
"up to ${MAXFUNCS} function(s) in flight; idle cores are shared across functions"
echo "[i] per-function logs: ${LOG_DIR}/<func>.log"

# ---- one function: build then test, capturing status and wall-clock time ---
run_one() {
    local func="$1"
    local inner="$2"
    local log="${LOG_DIR}/${func}.log"
    local rc="ok" start end
    start="$(date +%s.%N)"
    {
        echo "############################################"
        echo "# ${func}  (inner workers: ${inner})"
        echo "############################################"
        echo
        echo "=== [build] ${DILITHIUM_BUILD} tests_dilithium/${func} ==="
        if ! "$DILITHIUM_BUILD" "tests_dilithium/${func}"; then
            echo "[!] FAILED (build): ${func}"
            rc="build"
        elif echo && echo "=== [test] ${RUN_COMBINED} ${func} --seeds ${SEEDS} --jobs ${inner} --fresh ===" \
             && ! "$RUN_COMBINED" "$func" --seeds "$SEEDS" --jobs "$inner" --fresh; then
            echo "[!] FAILED (test): ${func}"
            rc="test"
        else
            echo "[i] OK: ${func}"
        fi
    } >"$log" 2>&1
    end="$(date +%s.%N)"
    echo "$rc" > "${LOG_DIR}/${func}.status"
    awk -v s="$start" -v e="$end" 'BEGIN { printf "%.3f\n", e - s }' > "${LOG_DIR}/${func}.time"
}

# ---- global sweep-semaphore dispatch --------------------------------------
# The real throttle is a GLOBAL pool of CORES tokens, shared by every
# function's inner sweep: run_combined_unicorn.sh draws one token per faulty-
# ELF sweep from SWEEP_SEM_FIFO and returns it when that sweep finishes. A
# core is therefore held per ACTIVE sweep, not reserved per function -- while a
# function builds, calibrates, or tapers off near the end of its sweep, the
# tokens it is not using are immediately taken by other functions' sweeps.
# There is no per-function cap: a function alone can hold all CORES tokens.
#
# fd 9 keeps the token pool open (pre-filled with CORES tokens) for the whole
# run; the exported path lets every child run_combined open the same FIFO.
SWEEP_SEM_FIFO="${LOG_DIR}/sweep_sem.fifo"
mkfifo "$SWEEP_SEM_FIFO"
exec 9<>"$SWEEP_SEM_FIFO"
for ((_t = 0; _t < CORES; _t++)); do echo >&9; done
export SWEEP_SEM_FIFO

# Outer pool: admit up to MAXFUNCS functions at once (build + calibrate +
# launch their sweeps). This only bounds how many functions are in flight;
# the global token pool is what caps concurrent sweeps at CORES. Costliest
# functions are admitted first so the pool fills quickly.
active=0
for func in "${FUNCS[@]}"; do
    run_one "$func" "${WEIGHT[$func]:-1}" &
    active=$(( active + 1 ))
    if (( active >= MAXFUNCS )); then
        wait -n 2>/dev/null || wait
        active=$(( active - 1 ))
    fi
done
wait
exec 9>&- 9<&-

# ---- collect & report ------------------------------------------------------
FAILED=()
TIME_SUM=0
TIME_N=0
PF_STREAM="${LOG_DIR}/perfunc_rows"
: > "$PF_STREAM"
for func in "${FUNCS[@]}"; do
    st="$(cat "${LOG_DIR}/${func}.status" 2>/dev/null || echo "missing")"
    t="$(cat "${LOG_DIR}/${func}.time" 2>/dev/null || echo "")"
    if [[ -n "$t" ]]; then
        TIME_SUM="$(awk -v a="$TIME_SUM" -v b="$t" 'BEGIN { printf "%.3f", a + b }')"
        TIME_N=$((TIME_N + 1))
        tstr="$(awk -v b="$t" 'BEGIN { printf "%8.1fs", b }')"
    else
        tstr="       ?s"
    fi
    printf '%s %s %s\n' "$func" "$st" "${t:-0}" >> "$PF_STREAM"
    case "$st" in
        ok)    echo "[PASS] ${tstr}  ${func}" ;;
        build) echo "[FAIL] ${tstr}  ${func} (build)"; FAILED+=("${func} (build)") ;;
        test)  echo "[FAIL] ${tstr}  ${func} (test)";  FAILED+=("${func} (test)") ;;
        *)     echo "[FAIL] ${tstr}  ${func} (no status -- see ${LOG_DIR}/${func}.log)"; FAILED+=("${func} (crashed)") ;;
    esac
done

# ---- timing CSVs -----------------------------------------------------------
if [[ -f "$UPSERT_PY" ]]; then
    python3 "$UPSERT_PY" perfunc --csv "$PERFUNC_CSV" --scheme "$SCHEME" < "$PF_STREAM" \
        && echo "[i] per-function timings -> ${PERFUNC_CSV}"
    python3 "$UPSERT_PY" summary --csv "$SUMMARY_CSV" --scheme "$SCHEME" \
        --n "$TIME_N" --sum "$TIME_SUM" \
        && echo "[i] cross-scheme summary -> ${SUMMARY_CSV}"
else
    echo "[!] timing CSV helper not found: ${UPSERT_PY} (CSVs not written)" >&2
fi

echo
if [[ "$TIME_N" -gt 0 ]]; then
    awk -v s="$TIME_SUM" -v n="$TIME_N" \
        'BEGIN { printf "=== Timing: avg %.1fs/function over %d function(s) (sum of per-function wall time: %.1fs) ===\n", s / n, n, s }'
fi
echo "=== Summary: $((${#FUNCS[@]} - ${#FAILED[@]}))/${#FUNCS[@]} function(s) completed successfully ==="
if [[ "${#FAILED[@]}" -gt 0 ]]; then
    echo "Failed:" >&2
    printf '  %s\n' "${FAILED[@]}" >&2
    KEEP_DIR="${LOG_DIR}.failed"
    mkdir -p "$KEEP_DIR"
    for item in "${FAILED[@]}"; do
        f="${item%% *}"
        cp "${LOG_DIR}/${f}.log" "${KEEP_DIR}/" 2>/dev/null || true
    done
    echo "[i] failed-run logs copied to: ${KEEP_DIR}" >&2
    exit 1
fi
