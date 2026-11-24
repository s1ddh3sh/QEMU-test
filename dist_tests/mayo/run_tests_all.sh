#!/usr/bin/env bash
#
# run_tests_all.sh — build and run the full Unicorn paired-sweep pipeline
# for EVERY MAYO function listed in mayo.json.
#
# For each function in mayo.json:
#   1. ./mayo_build.sh tests_mayo/<function>   (build the correct + faulty ELFs)
#   2. ./dist_tests/mayo/run_tests_unicorn.sh <function> --seeds 0,1,2,3
#
# Each function's build+test is INDEPENDENT of every other function, so the
# functions are run in parallel under a single GLOBAL pool of CORES tokens.
# NOTE: unlike the Dilithium/Kyber scripts, MAYO's inner run_combined_unicorn.sh
# sweeps its faulty ELFs SERIALLY (it has no --jobs), so each function holds
# exactly one shared token while it sweeps -- the pool size is simply the number
# of functions sweeping at once. The token is held only during the sweep, not
# during the build, so builds overlap freely. (If --jobs is added to that inner
# script later, change fault_weight below to the real fault count, as in the
# Dilithium script, and pass --jobs to it.) Each function's full output is
# streamed to its own log file (so parallel output does not interleave), and a
# one-line PASS/FAIL is printed as each finishes.
#
# Like run_tests_unicorn.sh, this script must be run from the repo root
# (mayo.json and mayo_build.sh are repo-root-relative).
#
# Usage:
#   ./dist_tests/mayo/run_tests_all.sh [-c N] [-j N] [--per-func-max M] [func ...]
#
#   -c N             total core budget (default: number of CPUs, $(nproc)).
#                    Because MAYO's inner sweep is serial (1 core/function),
#                    this is effectively the number of functions run at once.
#   -j N             optional cap on how many functions may run at once
#                    (default: N = the core budget).
#   --per-func-max M optional cap on inner workers per function (accepted for
#                    parity with the Dilithium/Kyber scripts; has no effect
#                    here while MAYO's inner sweep is serial).
#   func ...         optional explicit list of functions to run; if omitted,
#                    every key in mayo.json is run.
#
# A single function's failure (build or test) does not stop the sweep --
# it is recorded and reported in the summary at the end, and the script
# exits non-zero if anything failed.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_JSON="mayo.json"
MAYO_BUILD="./mayo_build.sh"
RUN_UNICORN="${SCRIPT_DIR}/run_combined_unicorn.sh"
SEEDS="0,1,2,3"

SCHEME="mayo"
UPSERT_PY="${SCRIPT_DIR}/../common/upsert_timing.py"
PERFUNC_CSV="${SCRIPT_DIR}/timing_${SCHEME}.csv"        # per-function timings
SUMMARY_CSV="${SCRIPT_DIR}/../timing_schemes_summary.csv"  # avg over all schemes

NPROC="$(nproc 2>/dev/null || echo 4)"
CORES=""          # -c/--cores : total core budget (default: NPROC)
MAXFUNCS=""       # -j/--jobs  : cap on concurrent functions (default: CORES)
PERFUNC_MAX=""    # --per-func-max : accepted for parity; no effect (serial inner)

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

if [[ ! -f "$CONFIG_JSON" ]]; then
    echo "[!] ${CONFIG_JSON} not found -- run this script from the repo root" >&2
    exit 1
fi
if [[ ! -x "$MAYO_BUILD" ]]; then
    echo "[!] ${MAYO_BUILD} not found or not executable -- run this script from the repo root" >&2
    exit 1
fi
if [[ ! -x "$RUN_UNICORN" ]]; then
    echo "[!] required script not found or not executable: ${RUN_UNICORN}" >&2
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

LOG_DIR="$(mktemp -d "${TMPDIR:-/tmp}/mayo_run_all.XXXXXX")"
trap 'rm -rf "$LOG_DIR"' EXIT

# fault_weight: inner workers a function may reserve. MAYO's inner sweep runs
# its faulty ELFs serially (no --jobs), so a function can only ever use one
# core here -- weight is fixed at 1, clamped by PERFUNC_MAX. (To exploit
# per-fault parallelism, add --jobs to dist_tests/mayo/run_combined_unicorn.sh
# and make this count the faulty mutants, as the Dilithium script does.)
fault_weight() {
    local n=1
    (( n > PERFUNC_MAX )) && n=$PERFUNC_MAX
    echo "$n"
}

# Pre-compute each function's weight (1 here) so the dispatch loop below is
# identical in shape to the Dilithium/Kyber scripts.
declare -A WEIGHT=()
for func in "${FUNCS[@]}"; do
    WEIGHT["$func"]="$(fault_weight "$func")"
done

echo "[i] ${#FUNCS[@]} function(s) to run; global sweep pool ${CORES} core(s) (nproc=${NPROC}), "\
"up to ${MAXFUNCS} function(s) in flight (MAYO inner sweep is serial: 1 core/function)"
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
        echo "# ${func}"
        echo "############################################"
        echo
        echo "=== [build] ${MAYO_BUILD} tests_mayo/${func} ==="
        if ! "$MAYO_BUILD" "tests_mayo/${func}"; then
            echo "[!] FAILED (build): ${func}"
            rc="build"
        elif echo && echo "=== [test] ${RUN_UNICORN} ${func} --seeds ${SEEDS} ===" \
             && ! "$RUN_UNICORN" "$func" --seeds "$SEEDS"; then
            echo "[!] FAILED (test): ${func}"
            rc="test"
        else
            echo "[i] OK: ${func}"
        fi
    } >"$log" 2>&1
    end="$(date +%s.%N)"
    local secs
    secs="$(awk -v s="$start" -v e="$end" 'BEGIN { printf "%.3f", e - s }')"
    echo "$rc" > "${LOG_DIR}/${func}.status"
    echo "$secs" > "${LOG_DIR}/${func}.time"
    # Incremental timing: update THIS function's row in the per-function CSV as
    # soon as it finishes, so the CSV reflects progress without waiting for the
    # whole sweep. fd 200 is a lock that serialises the read-modify-write, since
    # every concurrent function upserts into the same CSV. The final batch
    # upsert still runs (idempotent).
    if [[ -f "$UPSERT_PY" ]]; then
        (
            flock 200
            printf '%s %s %s\n' "$func" "$rc" "$secs" \
                | python3 "$UPSERT_PY" perfunc --csv "$PERFUNC_CSV" --scheme "$SCHEME"
        ) 200>"${LOG_DIR}/timing.lock" 2>>"$log"
    fi
}

# ---- global sweep-semaphore dispatch --------------------------------------
# A GLOBAL pool of CORES tokens is shared by every function. Each MAYO
# run_combined_unicorn.sh holds one token while it does its (serial) sweep and
# returns it when done, so at most CORES functions sweep at once, and the token
# is free during a function's build step. fd 9 keeps the pool open (pre-filled
# with CORES tokens); the exported path lets every child open the same FIFO.
SWEEP_SEM_FIFO="${LOG_DIR}/sweep_sem.fifo"
mkfifo "$SWEEP_SEM_FIFO"
exec 9<>"$SWEEP_SEM_FIFO"
for ((_t = 0; _t < CORES; _t++)); do echo >&9; done
export SWEEP_SEM_FIFO

# Outer pool: admit up to MAXFUNCS functions at once. The global token pool is
# what actually caps concurrent sweeps at CORES.
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
    # Keep the logs of failed runs so they can be inspected.
    KEEP_DIR="${LOG_DIR}.failed"
    mkdir -p "$KEEP_DIR"
    for item in "${FAILED[@]}"; do
        f="${item%% *}"
        cp "${LOG_DIR}/${f}.log" "${KEEP_DIR}/" 2>/dev/null || true
    done
    echo "[i] failed-run logs copied to: ${KEEP_DIR}" >&2
    exit 1
fi
