#!/usr/bin/env bash
#
# run_nonce_reuse_dist.sh (Dilithium) — run secret_vector_dist.py's secret-vector
# distribution + coordinate-equality test for a Kyber function, once per faulty
# gated ELF found under build/tests_kyber/<func_name>, against that function's
# correct gated ELF.
#
# Dilithium is a signature scheme, so the observation point is ALWAYS the
# signing entry pqcrystals_dilithium2_ref_signature_internal. Its per-signature
# mask y = (y[0..L-1]) is expanded by L poly_uniform_gamma1 calls from one seed
# told apart only by an incrementing nonce. The test captures the y polynomials
# and reports (1) their per-coefficient value distribution and (2) the fraction
# of coordinates where y[i] == y[j] -- a "Number not used once" nonce-reuse
# fault drives that fraction to ~1 (a repeated mask leaks s1 via z = y + c*s1).
# <func_name> only selects which full_dilithium/ ELF pair to test; the fault
# may live anywhere in the signing call tree.
#
# With NO <func_name>, every function key in <repo_root>/kyber.json is run in
# turn (functions whose gated ELFs are missing are reported and skipped); the
# override flags apply uniformly to all of them.
#
# ELF layout assumed (default --elf-dir is build/tests_dilithium/<func_name>):
#   <elf-dir>/full_dilithium/dilithium_<func_name>.elf  -- the correct build
#   <elf-dir>/**/full_dilithium/*.elf                   -- every other gated .elf
#                                  (searched recursively) is a faulty variant,
#                                  tested one at a time against the correct build.
#
# The gated .ll are expected to ALREADY EXIST under tests_kyber/<func_name>/
# (produced by the fault-injection + fuseback pipeline). This driver only
# compiles them to ELFs if the correct gated ELF is missing, via kyber_build.sh.
# Pass --no-build to disable, or --elf-dir to point at a prebuilt tree
# (single-func only).
#
# Usage:
#   ./run_nonce_reuse_dist.sh [<func_name>] [--elf-dir DIR] [--n-seeds N] [--seed N] [--no-build] [-j N] [--timeout S]
#
# With no <func_name>, every function's faulty ELFs are tested in one shared
# pool of up to N parallel probes (-j / --jobs, default: nproc). Each probe is
# an independent process writing only its own result dir, so this is safe.
#
# Examples:
#   ./run_nonce_reuse_dist.sh pqcrystals_dilithium2_ref_signature_internal
#   ./run_nonce_reuse_dist.sh                   # every function in dilithium.json

set -uo pipefail

SCHEME="dilithium"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
PROBE_PY="${REPO_ROOT}/dist_tests/common/secret_vector_dist.py"
BUILD_SH="${REPO_ROOT}/${SCHEME}_build.sh"
CONFIG_JSON="${SCHEME}.json"
GATED_DIR="full_${SCHEME}"

# func_name is optional: a leading non-"--" argument is the function; otherwise
# every <scheme>.json key is run.
FUNC_NAME=""
if [[ $# -gt 0 && "$1" != --* ]]; then
    FUNC_NAME="$1"; shift
fi

ELF_DIR_OVERRIDE=""
N_SEEDS=""
SEED=""
NO_BUILD=0
JOBS="$(nproc 2>/dev/null || echo 1)"
TIMEOUT=300

while [[ $# -gt 0 ]]; do
    case "$1" in
        --elf-dir) ELF_DIR_OVERRIDE="$2"; shift 2 ;;
        --n-seeds) N_SEEDS="$2"; shift 2 ;;
        --seed) SEED="$2"; shift 2 ;;
        --no-build) NO_BUILD=1; shift ;;
        -j|--jobs) JOBS="$2"; shift 2 ;;
        --timeout) TIMEOUT="$2"; shift 2 ;;
        *) echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
    esac
done

if ! [[ "$JOBS" =~ ^[0-9]+$ ]] || [[ "$JOBS" -lt 1 ]]; then
    echo "[!] --jobs must be a positive integer (got: ${JOBS})" >&2; exit 1
fi
if ! [[ "$TIMEOUT" =~ ^[0-9]+$ ]]; then
    echo "[!] --timeout must be a non-negative integer (seconds; 0 disables), got: ${TIMEOUT}" >&2; exit 1
fi

cd "$REPO_ROOT"
[[ -f "$PROBE_PY" ]] || { echo "[!] required script not found: $PROBE_PY" >&2; exit 1; }

EXTRA_ARGS=(--scheme "$SCHEME")
[[ -n "$N_SEEDS" ]] && EXTRA_ARGS+=(--n-seeds "$N_SEEDS")
[[ -n "$SEED" ]] && EXTRA_ARGS+=(--seed "$SEED")

# Per-probe wall-clock cap: a hung emulation is killed (SIGTERM, then SIGKILL
# after 10s) and recorded as a timeout, so one bad ELF can't stall the pool.
# --timeout 0 disables it.
TIMEOUT_CMD=()
if [[ "$TIMEOUT" -gt 0 ]]; then
    if command -v timeout >/dev/null 2>&1; then
        TIMEOUT_CMD=(timeout -k 10 "${TIMEOUT}s")
    else
        echo "[!] 'timeout' not found on PATH; running without a per-probe cap" >&2
    fi
fi

# ---------------------------------------------------------------------------
# plan_one_func <func_name> — resolve the function's correct gated ELF (building
# it if missing) and enumerate its faulty gated ELFs, appending one job per
# faulty ELF to the global JOB_* queue. Builds happen here, serially, before any
# parallel probe starts. Returns non-zero (without exiting) on a recoverable
# error so the caller can record the function as skipped and move on.
# ---------------------------------------------------------------------------
plan_one_func() {
    local func_name="$1"
    local src_dir="tests_${SCHEME}/${func_name}"
    local out_dir="tests_${SCHEME}/${func_name}"
    local elf_dir elf_dir_default=1
    if [[ -n "$ELF_DIR_OVERRIDE" ]]; then
        elf_dir="$ELF_DIR_OVERRIDE"; elf_dir_default=0
    else
        elf_dir="build/tests_${SCHEME}/${func_name}"
    fi

    local correct_elf="${elf_dir}/${GATED_DIR}/${SCHEME}_${func_name}.elf"

    if [[ ! -f "$correct_elf" && "$NO_BUILD" -eq 0 && "$elf_dir_default" -eq 1 ]]; then
        if [[ ! -d "${src_dir}/${GATED_DIR}" ]]; then
            echo "[!] ${func_name}: no gated ELFs under ${elf_dir} and no gated source IR under ${src_dir}/${GATED_DIR}/ -- skipping" >&2
            return 1
        fi
        [[ -x "$BUILD_SH" ]] || { echo "[!] ${SCHEME}_build.sh not found/executable: $BUILD_SH" >&2; return 1; }
        echo "[i] ${func_name}: gated ELFs not found; building from ${src_dir} via ${SCHEME}_build.sh ..."
        "$BUILD_SH" "$src_dir" || { echo "[!] ${func_name}: build failed -- skipping" >&2; return 1; }
    fi

    [[ -d "$elf_dir" ]] || { echo "[!] ${func_name}: elf dir not found: $elf_dir -- skipping" >&2; return 1; }
    [[ -f "$correct_elf" ]] || { echo "[!] ${func_name}: correct elf not found: $correct_elf -- skipping" >&2; return 1; }

    local faulty_elfs=()
    while IFS= read -r -d '' f; do
        faulty_elfs+=("$f")
    done < <(find "$elf_dir" -type f -name '*.elf' -path "*/${GATED_DIR}/*" -not -samefile "$correct_elf" -print0 | sort -z)

    if [[ ${#faulty_elfs[@]} -eq 0 ]]; then
        echo "[!] ${func_name}: no faulty gated ELFs found under $elf_dir -- skipping" >&2
        return 1
    fi

    echo "[plan] ${func_name}: ${SCHEME} (observation point: sign, mask y expansion), ${#faulty_elfs[@]} faulty ELF(s) under ${elf_dir}"

    FUNC_NJOBS["$func_name"]=${#faulty_elfs[@]}
    local faulty_elf rel result_dir
    for faulty_elf in "${faulty_elfs[@]}"; do
        rel="${faulty_elf#${elf_dir}/}"; rel="${rel%.elf}"
        result_dir="${out_dir}/${rel}"
        JOB_FUNC+=("$func_name")
        JOB_CORRECT+=("$correct_elf")
        JOB_FAULTY+=("$faulty_elf")
        JOB_RESULT_DIR+=("$result_dir")
        JOB_REL+=("$rel")
    done
    return 0
}

# ---------------------------------------------------------------------------
# run_one_job <idx> — one independent probe: the correct ELF vs one faulty ELF.
# Reads only immutable ELFs and writes solely into its own per-faulty-ELF result
# dir, so any number may run concurrently. Records its exit code into RC_DIR for
# the ordered summary pass (parallel jobs can't safely share an array).
# ---------------------------------------------------------------------------
run_one_job() {
    local idx="$1"
    local func_name="${JOB_FUNC[$idx]}"
    local correct_elf="${JOB_CORRECT[$idx]}"
    local faulty_elf="${JOB_FAULTY[$idx]}"
    local result_dir="${JOB_RESULT_DIR[$idx]}"
    local rel="${JOB_REL[$idx]}"
    local status
    mkdir -p "$result_dir"
    echo "[start] ${func_name} / ${rel}"
    # Output is redirected (not tee'd) so concurrent probes don't interleave on
    # the console; the full log still lands in the result file as before.
    # TIMEOUT_CMD (possibly empty) caps the probe's wall-clock time.
    if "${TIMEOUT_CMD[@]}" python3 "$PROBE_PY" \
        --correct-elf "$correct_elf" \
        --faulty-elf "$faulty_elf" \
        --report "${result_dir}/nonce_reuse_dist_report.json" \
        "${EXTRA_ARGS[@]}" \
        > "${result_dir}/nonce_reuse_dist_result.txt" 2>&1; then
        status=0
    else
        status=$?
    fi
    # exit 1 = collapse detected (valid verdict), 0 = no collapse, 2 = emu error,
    # 124/137 = killed by the per-probe timeout.
    echo "$status" > "${RC_DIR}/${idx}.rc"
    echo "[done ] ${func_name} / ${rel} (rc=${status})"
}

# ---------------------------------------------------------------------------
# Single function, or every key of <scheme>.json.
# ---------------------------------------------------------------------------
if [[ -n "$FUNC_NAME" ]]; then
    FUNCS=("$FUNC_NAME")
else
    [[ -f "$CONFIG_JSON" ]] || { echo "[!] ${CONFIG_JSON} not found (run from the repo root)" >&2; exit 1; }
    mapfile -t FUNCS < <(python3 -c "import json;print('\n'.join(json.load(open('${CONFIG_JSON}'))))")
    echo "[i] no func_name given: running all ${#FUNCS[@]} function(s) from ${CONFIG_JSON}"
fi

# Plan pass (serial): resolve the correct ELF and build what's missing for every
# function, collecting one job per (function, faulty ELF) into the global queue.
declare -a JOB_FUNC=() JOB_CORRECT=() JOB_FAULTY=() JOB_RESULT_DIR=() JOB_REL=()
declare -A FUNC_NJOBS=()
SKIPPED=()
for func in "${FUNCS[@]}"; do
    plan_one_func "$func" || SKIPPED+=("$func")
done

TOTAL_JOBS=${#JOB_FAULTY[@]}
if [[ "$TOTAL_JOBS" -eq 0 ]]; then
    echo "[!] nothing to run: no faulty ELFs found for any requested function" >&2
    for f in "${SKIPPED[@]}"; do echo "[!] skipped: $f" >&2; done
    exit 1
fi

echo ""
echo "########## nonce_reuse_dist ${SCHEME}: ${TOTAL_JOBS} probe(s) across $(( ${#FUNCS[@]} - ${#SKIPPED[@]} )) function(s), up to ${JOBS} in parallel ##########"
if [[ ${#TIMEOUT_CMD[@]} -gt 0 ]]; then
    echo "[i] per-probe timeout: ${TIMEOUT}s (SIGKILL +10s); pass --timeout 0 to disable"
fi

RC_DIR="$(mktemp -d "${TMPDIR:-/tmp}/${SCHEME}_nrd_rc.XXXXXX")"
trap 'rm -rf "$RC_DIR"' EXIT

# Bounded job pool: launch up to JOBS probes at once, throttling with `wait -n`.
# Same pattern as run_combined_unicorn.sh / run_tests_all.sh.
active=0
for (( idx = 0; idx < TOTAL_JOBS; idx++ )); do
    run_one_job "$idx" &
    active=$((active + 1))
    if (( active >= JOBS )); then
        wait -n 2>/dev/null || wait
        active=$((active - 1))
    fi
done
wait

# ---------------------------------------------------------------------------
# Ordered summary pass: read back each job's recorded exit code and tally per
# function and overall.
# ---------------------------------------------------------------------------
declare -A FN_DETECTED=() FN_FAILS=()
TOTAL_DETECTED=0
TOTAL_FAILS=0
for (( idx = 0; idx < TOTAL_JOBS; idx++ )); do
    func="${JOB_FUNC[$idx]}"
    status="$(cat "${RC_DIR}/${idx}.rc" 2>/dev/null || echo 2)"
    if [[ "$status" -eq 1 ]]; then
        FN_DETECTED["$func"]=$(( ${FN_DETECTED["$func"]:-0} + 1 ))
        TOTAL_DETECTED=$((TOTAL_DETECTED + 1))
    elif [[ "$status" -ne 0 ]]; then
        FN_FAILS["$func"]=$(( ${FN_FAILS["$func"]:-0} + 1 ))
        TOTAL_FAILS=$((TOTAL_FAILS + 1))
        if [[ "$status" -eq 124 || "$status" -eq 137 ]]; then
            echo "[!] TIMEOUT (>${TIMEOUT}s) for ${JOB_FAULTY[$idx]}" >&2
        else
            echo "[!] test failed (exit ${status}) for ${JOB_FAULTY[$idx]}" >&2
        fi
    fi
done

echo ""
echo "=========================================================================="
echo "=== nonce_reuse_dist ${SCHEME}: per-function summary ==="
for func in "${FUNCS[@]}"; do
    [[ -n "${FUNC_NJOBS["$func"]:-}" ]] || continue
    line="[i] ${func}: ${FN_DETECTED["$func"]:-0}/${FUNC_NJOBS["$func"]} ELF(s) flagged a leak"
    [[ -n "${FN_FAILS["$func"]:-}" ]] && line="${line}, ${FN_FAILS["$func"]} errored"
    echo "$line"
done

echo ""
echo "=========================================================================="
echo "=== nonce_reuse_dist ${SCHEME}: ${#FUNCS[@]} function(s), ${#SKIPPED[@]} skipped, ${TOTAL_JOBS} probe(s) ==="
echo "[i] total ELF(s) flagged a leak (nonce-reuse, missing poly, or low entropy): ${TOTAL_DETECTED}"
echo "[i] per-faulty-ELF results under: tests_${SCHEME}/<func>/<faulty_elf_relpath>/nonce_reuse_dist_result.txt"
for f in "${SKIPPED[@]}"; do
    echo "[!] skipped: $f" >&2
done

if [[ "$TOTAL_FAILS" -gt 0 ]]; then
    echo "[!] ${TOTAL_FAILS} faulty ELF(s) errored out (emulation failure, not just verdict)" >&2
    exit 2
fi
