#!/usr/bin/env bash
#
# run_vinegar_dist_mayo.sh — run vinegar_dist_mayo.py's secret-dependence
# distribution test for a MAYO function, once per faulty gated ELF found under
# build/tests_mayo/<func_name>, against that function's correct gated ELF.
#
# The observation point is ALWAYS the signing entry
# pqmayo_MAYO_1_ref_mayo_sign_signature (whose vinegar is captured), regardless
# of <func_name>: the faulty ELF's injected fault may live anywhere in the call
# tree (sign itself, shake256, compute_M_and_VPV, ...), but the target we read
# -- the vinegar V -- is the same. <func_name> only selects which
# full_mayo_gated/ ELF pair to test.
#
# With NO <func_name>, every function key in <repo_root>/mayo.json is run in
# turn (functions whose gated ELFs are missing are reported and skipped); the
# override flags apply uniformly to all of them.
#
# ELF layout assumed (default --elf-dir is build/tests_mayo/<func_name>):
#   <elf-dir>/full_mayo_gated/gated_<func_name>.elf  -- the correct build
#   <elf-dir>/**/full_mayo_gated/*.elf               -- every other gated .elf
#                                  (searched recursively) is a faulty variant,
#                                  tested one at a time against the correct build.
#
# The gated .ll are expected to ALREADY EXIST under tests_mayo/<func_name>/
# (produced by the fault-injection pipeline). This driver only ensures the
# ELFs are compiled from them: if the correct gated ELF is missing under the
# default --elf-dir, it runs mayo_build.sh on the source tree. Pass --no-build
# to disable, or --elf-dir to point at a prebuilt tree (single-func only).
#
# For each faulty ELF, the test's stdout/report are stored in the equivalent
# subdirectory under tests_mayo/<func_name>/, e.g.:
#   build/tests_mayo/<func>/loopOrFuncSkip/full_mayo_gated/gated_<func>_fnSkip_compute_A_line45.elf
#     -> tests_mayo/<func>/loopOrFuncSkip/full_mayo_gated/gated_<func>_fnSkip_compute_A_line45/vinegar_dist_result.txt
#        .../vinegar_dist_report.json
#
# Usage:
#   ./run_vinegar_dist_mayo.sh [<func_name>] [--elf-dir DIR] [--n-seeds N] [--seed N] [--no-build]
#
# Examples:
#   ./run_vinegar_dist_mayo.sh pqmayo_MAYO_1_ref_mayo_sign_signature
#   ./run_vinegar_dist_mayo.sh                      # every function in mayo.json
#   ./run_vinegar_dist_mayo.sh --n-seeds 64         # ditto, with an override flag

set -uo pipefail

PROBE_FUNC="pqmayo_MAYO_1_ref_mayo_sign_signature"

# Anchor every path to this script's location so the driver works from any cwd.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
PROBE_PY="${SCRIPT_DIR}/vinegar_dist_mayo.py"
MAYO_BUILD="${REPO_ROOT}/mayo_build.sh"
CONFIG_JSON="mayo.json"

# func_name is optional: a leading non-"--" argument is the function; otherwise
# every mayo.json key is run.
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

# All relative paths are repo-root relative (matching mayo_build.sh's own
# build/tests_mayo/... convention), so run from the repo root.
cd "$REPO_ROOT"
[[ -f "$PROBE_PY" ]] || { echo "[!] required script not found: $PROBE_PY" >&2; exit 1; }

EXTRA_ARGS=(--func "$PROBE_FUNC")
[[ -n "$N_SEEDS" ]] && EXTRA_ARGS+=(--n-seeds "$N_SEEDS")
[[ -n "$SEED" ]] && EXTRA_ARGS+=(--seed "$SEED")

# ---------------------------------------------------------------------------
# run_one_func <func_name> — the full per-function sweep. Returns non-zero
# (without exiting the script) on a recoverable error so the multi-function
# loop can report it and move on. Sets DETECTED/FAILS for the caller via the
# globals FN_DETECTED / FN_FAILS.
# ---------------------------------------------------------------------------
run_one_func() {
    local func_name="$1"
    local src_dir="tests_mayo/${func_name}"
    local out_dir="tests_mayo/${func_name}"
    local elf_dir elf_dir_default=1
    if [[ -n "$ELF_DIR_OVERRIDE" ]]; then
        elf_dir="$ELF_DIR_OVERRIDE"; elf_dir_default=0
    else
        elf_dir="build/tests_mayo/${func_name}"
    fi
    FN_DETECTED=0; FN_FAILS=0

    local correct_elf="${elf_dir}/full_mayo_gated/gated_${func_name}.elf"

    # Build the gated ELFs on demand (gated .ll must already exist; fuseback is
    # NOT run here).
    if [[ ! -f "$correct_elf" && "$NO_BUILD" -eq 0 && "$elf_dir_default" -eq 1 ]]; then
        if [[ ! -d "${src_dir}/full_mayo_gated" ]]; then
            echo "[!] ${func_name}: no gated ELFs under ${elf_dir} and no gated source IR under ${src_dir}/full_mayo_gated/ -- skipping" >&2
            return 1
        fi
        [[ -x "$MAYO_BUILD" ]] || { echo "[!] mayo_build.sh not found/executable: $MAYO_BUILD" >&2; return 1; }
        echo "[i] ${func_name}: gated ELFs not found; building from ${src_dir} via mayo_build.sh ..."
        "$MAYO_BUILD" "$src_dir" || { echo "[!] ${func_name}: build failed -- skipping" >&2; return 1; }
    fi

    [[ -d "$elf_dir" ]] || { echo "[!] ${func_name}: elf dir not found: $elf_dir -- skipping" >&2; return 1; }
    [[ -f "$correct_elf" ]] || { echo "[!] ${func_name}: correct elf not found: $correct_elf -- skipping" >&2; return 1; }

    local faulty_elfs=()
    while IFS= read -r -d '' f; do
        faulty_elfs+=("$f")
    done < <(find "$elf_dir" -type f -name '*.elf' -path '*/full_mayo_gated/*' -not -samefile "$correct_elf" -print0 | sort -z)

    if [[ ${#faulty_elfs[@]} -eq 0 ]]; then
        echo "[!] ${func_name}: no faulty gated ELFs found under $elf_dir -- skipping" >&2
        return 1
    fi

    echo "[i] function:     ${func_name} (observation point: ${PROBE_FUNC})"
    echo "[i] correct elf:   ${correct_elf}"
    echo "[i] faulty elfs:   ${#faulty_elfs[@]} found under ${elf_dir}"

    echo ""
    echo "########## vinegar_dist_mayo: ${func_name} (${#faulty_elfs[@]} faulty ELF(s)) ##########"

    local faulty_elf rel result_dir status
    for faulty_elf in "${faulty_elfs[@]}"; do
        rel="${faulty_elf#${elf_dir}/}"; rel="${rel%.elf}"
        result_dir="${out_dir}/${rel}"
        mkdir -p "$result_dir"

        echo ""
        echo "--- vinegar_dist_mayo: ${func_name} / ${rel} ---"
        python3 "$PROBE_PY" \
            --correct-elf "$correct_elf" \
            --faulty-elf "$faulty_elf" \
            --report "${result_dir}/vinegar_dist_report.json" \
            "${EXTRA_ARGS[@]}" \
            2>&1 | tee "${result_dir}/vinegar_dist_result.txt"
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
    echo "=== vinegar_dist_mayo sweep complete: ${func_name} (${#faulty_elfs[@]} faulty ELF(s)) ==="
    echo "[i] ${FN_DETECTED} ELF(s) flagged a secret-dependence collapse (full or partial)"
    [[ "$FN_FAILS" -gt 0 ]] && echo "[!] ${FN_FAILS} faulty ELF(s) errored out (emulation failure)" >&2
    return 0
}

# ---------------------------------------------------------------------------
# Single function, or every key of mayo.json.
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
echo "=== vinegar_dist_mayo: ${#FUNCS[@]} function(s), ${#SKIPPED[@]} skipped ==="
echo "[i] total ELF(s) flagged a secret-dependence collapse: ${TOTAL_DETECTED}"
echo "[i] per-faulty-ELF results under: tests_mayo/<func>/<faulty_elf_relpath>/vinegar_dist_result.txt"
for f in "${SKIPPED[@]}"; do
    echo "[!] skipped: $f" >&2
done

if [[ "$TOTAL_FAILS" -gt 0 ]]; then
    echo "[!] ${TOTAL_FAILS} faulty ELF(s) errored out (emulation failure, not just verdict)" >&2
    exit 2
fi
