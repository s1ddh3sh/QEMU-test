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
#   ./run_nonce_reuse_dist.sh [<func_name>] [--elf-dir DIR] [--n-seeds N] [--seed N] [--no-build]
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

while [[ $# -gt 0 ]]; do
    case "$1" in
        --elf-dir) ELF_DIR_OVERRIDE="$2"; shift 2 ;;
        --n-seeds) N_SEEDS="$2"; shift 2 ;;
        --seed) SEED="$2"; shift 2 ;;
        --no-build) NO_BUILD=1; shift ;;
        *) echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
    esac
done

cd "$REPO_ROOT"
[[ -f "$PROBE_PY" ]] || { echo "[!] required script not found: $PROBE_PY" >&2; exit 1; }

EXTRA_ARGS=(--scheme "$SCHEME")
[[ -n "$N_SEEDS" ]] && EXTRA_ARGS+=(--n-seeds "$N_SEEDS")
[[ -n "$SEED" ]] && EXTRA_ARGS+=(--seed "$SEED")

# ---------------------------------------------------------------------------
# run_one_func <func_name> — the full per-function sweep. Returns non-zero
# (without exiting the script) on a recoverable error so the multi-function
# loop can report it and move on. Reports via globals FN_DETECTED / FN_FAILS.
# ---------------------------------------------------------------------------
run_one_func() {
    local func_name="$1"
    local src_dir="tests_${SCHEME}/${func_name}"
    local out_dir="tests_${SCHEME}/${func_name}"
    local elf_dir elf_dir_default=1
    if [[ -n "$ELF_DIR_OVERRIDE" ]]; then
        elf_dir="$ELF_DIR_OVERRIDE"; elf_dir_default=0
    else
        elf_dir="build/tests_${SCHEME}/${func_name}"
    fi
    FN_DETECTED=0; FN_FAILS=0

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

    echo "[i] scheme:       ${SCHEME} (observation point: sign, mask y expansion)"
    echo "[i] function:     ${func_name}"
    echo "[i] correct elf:   ${correct_elf}"
    echo "[i] faulty elfs:   ${#faulty_elfs[@]} found under ${elf_dir}"

    echo ""
    echo "########## nonce_reuse_dist ${SCHEME}: ${func_name} (${#faulty_elfs[@]} faulty ELF(s)) ##########"

    local faulty_elf rel result_dir status
    for faulty_elf in "${faulty_elfs[@]}"; do
        rel="${faulty_elf#${elf_dir}/}"; rel="${rel%.elf}"
        result_dir="${out_dir}/${rel}"
        mkdir -p "$result_dir"

        echo ""
        echo "--- nonce_reuse_dist: ${func_name} / ${rel} ---"
        python3 "$PROBE_PY" \
            --correct-elf "$correct_elf" \
            --faulty-elf "$faulty_elf" \
            --report "${result_dir}/nonce_reuse_dist_report.json" \
            "${EXTRA_ARGS[@]}" \
            2>&1 | tee "${result_dir}/nonce_reuse_dist_result.txt"
        status="${PIPESTATUS[0]}"
        # exit 1 = collapse detected (valid verdict), 0 = no collapse, 2 = emu error
        if [[ "$status" -eq 1 ]]; then
            FN_DETECTED=$((FN_DETECTED + 1))
        elif [[ "$status" -ne 0 ]]; then
            echo "[!] test failed (exit ${status}) for ${faulty_elf}" >&2
            FN_FAILS=$((FN_FAILS + 1))
        fi
    done

    echo ""
    echo "=== nonce_reuse_dist sweep complete: ${func_name} (${#faulty_elfs[@]} faulty ELF(s)) ==="
    echo "[i] ${FN_DETECTED} ELF(s) flagged a secret-vector collapse (nonce reuse or missing poly)"
    [[ "$FN_FAILS" -gt 0 ]] && echo "[!] ${FN_FAILS} faulty ELF(s) errored out (emulation failure)" >&2
    return 0
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

TOTAL_DETECTED=0
TOTAL_FAILS=0
SKIPPED=()
for func in "${FUNCS[@]}"; do
    echo ""
    echo "################################################################"
    echo "# ${func}"
    echo "################################################################"
    if run_one_func "$func"; then
        TOTAL_DETECTED=$((TOTAL_DETECTED + FN_DETECTED))
        TOTAL_FAILS=$((TOTAL_FAILS + FN_FAILS))
    else
        SKIPPED+=("$func")
    fi
done

echo ""
echo "=========================================================================="
echo "=== nonce_reuse_dist ${SCHEME}: ${#FUNCS[@]} function(s), ${#SKIPPED[@]} skipped ==="
echo "[i] total ELF(s) flagged a secret-vector collapse: ${TOTAL_DETECTED}"
echo "[i] per-faulty-ELF results under: tests_${SCHEME}/<func>/<faulty_elf_relpath>/nonce_reuse_dist_result.txt"
for f in "${SKIPPED[@]}"; do
    echo "[!] skipped: $f" >&2
done

if [[ "$TOTAL_FAILS" -gt 0 ]]; then
    echo "[!] ${TOTAL_FAILS} faulty ELF(s) errored out (emulation failure, not just verdict)" >&2
    exit 2
fi
