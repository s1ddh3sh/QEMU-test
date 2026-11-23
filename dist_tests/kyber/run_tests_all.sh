#!/usr/bin/env bash
#
# run_tests_all.sh — build and run the full Unicorn early-stop pipeline
# for EVERY Kyber function listed in kyber.json.
#
# For each function in kyber.json:
#   1. ./kyber_build.sh tests_kyber/<function>   (build the correct + faulty ELFs)
#   2. ./dist_tests/kyber/run_combined_unicorn.sh <function> --seeds 0,1,2,3 --fresh
#
# Each function's build+test is INDEPENDENT of every other function, so the
# functions are run in parallel. Instead of a fixed number of functions at a
# time, this script uses a WORK-CONSERVING core budget: each function's inner
# faulty-ELF sweep is given as many workers as it has faults (up to a cap),
# and the next function is started as soon as there are idle cores left over
# -- so a single-fault function never leaves 31 cores idle, and a big
# many-fault function can still grab a wide slice. This approximates the
# sweep-dilithium repo's single global work queue (there over machine
# instructions; here over faulty ELFs). Each function's full output is
# streamed to its own log file (so parallel output does not interleave), and
# a one-line PASS/FAIL is printed as each finishes.
#
# Like run_combined_unicorn.sh, this script must be run from the repo root
# (kyber.json and kyber_build.sh are repo-root-relative).
#
# Usage:
#   ./dist_tests/kyber/run_tests_all.sh [-c N] [-j N] [--per-func-max M] [func ...]
#
#   -c N             total core budget to spread across all work
#                    (default: number of CPUs, $(nproc)). The scheduler keeps
#                    the sum of running functions' inner-sweep workers <= N.
#   -j N             optional cap on how many functions may run at once
#                    (default: N = the core budget, i.e. purely core-bound).
#   --per-func-max M optional cap on inner workers handed to any one function
#                    (default: the core budget). Lower it to stop one huge
#                    many-fault function from grabbing every core at once.
#   func ...         optional explicit list of functions to run; if omitted,
#                    every key in kyber.json is run.
#
# Each function is given inner workers = min(its fault count, --per-func-max,
# remaining free cores), so cores are packed greedily, costliest function
# first. To reproduce the old fixed split, set -c and -j so the per-function
# share is what you want (e.g. -c $(nproc) -j $(nproc) -> 1 worker each).
#
# A single function's failure (build or test) does not stop the sweep --
# it is recorded and reported in the summary at the end, and the script
# exits non-zero if anything failed.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_JSON="kyber.json"
KYBER_BUILD="./kyber_build.sh"
RUN_COMBINED="${SCRIPT_DIR}/run_combined_unicorn.sh"
SEEDS="0,1,2,3"

SCHEME="kyber"
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

if [[ ! -f "$CONFIG_JSON" ]]; then
    echo "[!] ${CONFIG_JSON} not found -- run this script from the repo root" >&2
    exit 1
fi
if [[ ! -x "$KYBER_BUILD" ]]; then
    echo "[!] ${KYBER_BUILD} not found or not executable -- run this script from the repo root" >&2
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

LOG_DIR="$(mktemp -d "${TMPDIR:-/tmp}/kyber_run_all.XXXXXX")"
trap 'rm -rf "$LOG_DIR"' EXIT

# fault_weight: how many inner workers a function can actually use == how many
# faulty ELFs it has == how many faulty mutant .ll files live under its
# tests_kyber/<func> dir (the sources those ELFs build from; the full correct
# ELF under full_kyber/ is excluded). Computed before the build so the
# scheduler can size each function's slice; clamped to [1, PERFUNC_MAX]. A
# function with no mutant files found still gets 1 (its sweep self-limits).
fault_weight() {
    local func="$1" d="tests_kyber/${func}" n
    n="$(find "$d" -mindepth 2 -type f -name '*.ll' \
            -not -path '*/full_*/*' 2>/dev/null | wc -l)"
    (( n < 1 )) && n=1
    (( n > PERFUNC_MAX )) && n=$PERFUNC_MAX
    echo "$n"
}

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

echo "[i] ${#FUNCS[@]} function(s) to run; core budget ${CORES} (nproc=${NPROC}), "\
"up to ${MAXFUNCS} function(s) at once, <= ${PERFUNC_MAX} inner worker(s) each"
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
        echo "=== [build] ${KYBER_BUILD} tests_kyber/${func} ==="
        if ! "$KYBER_BUILD" "tests_kyber/${func}"; then
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
    # Release this function's reserved cores back to the scheduler (fd 9).
    echo "$inner" >&9
}

# ---- work-conserving core-budget dispatch ---------------------------------
# A FIFO on fd 9 is the completion channel: each finished run_one writes back
# the number of cores it had reserved, and the dispatcher blocks on it only
# when there is not enough room for the next function. Opening the FIFO
# read/write in the parent keeps it from hitting EOF; children inherit fd 9.
DONE_FIFO="${LOG_DIR}/done.fifo"
mkfifo "$DONE_FIFO"
exec 9<>"$DONE_FIFO"

used=0            # cores currently reserved by running functions
running=0         # number of functions currently running
for func in "${FUNCS[@]}"; do
    w="${WEIGHT[$func]:-1}"
    (( w > CORES )) && w=$CORES          # a single function may use the whole budget
    # Wait for room: enough free cores AND a free function slot. Only block
    # while something is actually running (used>0), so the first/biggest
    # function never deadlocks against its own request.
    while (( used > 0 )) && { (( used + w > CORES )) || (( running >= MAXFUNCS )); }; do
        read -r -u 9 released
        used=$(( used - released ))
        running=$(( running - 1 ))
    done
    used=$(( used + w ))
    running=$(( running + 1 ))
    run_one "$func" "$w" &
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
