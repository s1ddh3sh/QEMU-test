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
# functions are run in parallel across a bounded pool of worker jobs. Each
# function's full output is streamed to its own log file (so parallel output
# does not interleave), and a one-line PASS/FAIL is printed as each finishes.
#
# Like run_combined_unicorn.sh, this script must be run from the repo root
# (kyber.json and kyber_build.sh are repo-root-relative).
#
# Usage:
#   ./dist_tests/kyber/run_tests_all.sh [-j N] [func ...]
#
#   -j N        number of functions to process in parallel
#               (default: number of CPUs, $(nproc))
#   func ...    optional explicit list of functions to run; if omitted,
#               every key in kyber.json is run.
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

JOBS="$(nproc 2>/dev/null || echo 4)"

# ---- arg parse: -j N, then an optional explicit function list -------------
EXPLICIT_FUNCS=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        -j|--jobs) JOBS="$2"; shift 2 ;;
        -j*)       JOBS="${1#-j}"; shift ;;
        --)        shift; EXPLICIT_FUNCS+=("$@"); break ;;
        -*)        echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
        *)         EXPLICIT_FUNCS+=("$1"); shift ;;
    esac
done

if ! [[ "$JOBS" =~ ^[0-9]+$ && "$JOBS" -ge 1 ]]; then
    echo "[!] -j must be a positive integer (got: ${JOBS})" >&2
    exit 1
fi

# Two-level parallelism without oversubscribing the box: this script runs up
# to JOBS functions at once (outer), and each run_combined_unicorn.sh sweeps
# up to INNER_JOBS faulty ELFs at once (inner). We divide the core budget so
# outer*inner <= nproc. With the default JOBS=nproc this gives INNER_JOBS=1
# (unchanged behavior); lower -j to hand more cores to the per-function ELF
# sweep -- e.g. -j 1 runs functions one at a time but each sweep uses every
# core, which is fastest when a few large functions dominate (as in Keccak).
NPROC="$(nproc 2>/dev/null || echo 1)"
INNER_JOBS=$(( NPROC / JOBS ))
(( INNER_JOBS < 1 )) && INNER_JOBS=1

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

echo "[i] ${#FUNCS[@]} function(s) to run, up to ${JOBS} in parallel (x ${INNER_JOBS} inner ELF-sweep job(s) each; nproc=${NPROC})"
echo "[i] per-function logs: ${LOG_DIR}/<func>.log"

# ---- one function: build then test, capturing status and wall-clock time ---
run_one() {
    local func="$1"
    local log="${LOG_DIR}/${func}.log"
    local rc="ok" start end
    start="$(date +%s.%N)"
    {
        echo "############################################"
        echo "# ${func}"
        echo "############################################"
        echo
        echo "=== [build] ${KYBER_BUILD} tests_kyber/${func} ==="
        if ! "$KYBER_BUILD" "tests_kyber/${func}"; then
            echo "[!] FAILED (build): ${func}"
            rc="build"
        elif echo && echo "=== [test] ${RUN_COMBINED} ${func} --seeds ${SEEDS} --jobs ${INNER_JOBS} --fresh ===" \
             && ! "$RUN_COMBINED" "$func" --seeds "$SEEDS" --jobs "$INNER_JOBS" --fresh; then
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

# ---- bounded parallel dispatch --------------------------------------------
active=0
for func in "${FUNCS[@]}"; do
    run_one "$func" &
    active=$((active + 1))
    if (( active >= JOBS )); then
        wait -n 2>/dev/null || wait
        active=$((active - 1))
    fi
done
wait

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
