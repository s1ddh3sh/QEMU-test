#!/usr/bin/env bash
#
# run_pipeline.sh — full paired-sweep pipeline for one MAYO function.
#
# For every faulty ELF found alongside the correct one:
#   1. collect_dist.sh          (calibrate + collect the paired secret sweep)
# Then, once for the whole function (each internally loops over every
# faulty ELF's collected sweep):
#   2. run_ineffective_paired.sh
#   3. run_correction_paired.sh
#
# Usage:
#   ./run_pipeline.sh <func_name> <secret_buf> --secret-pos POS \
#       [--elf-dir DIR] [--fixed-scalars name1,name2,...] [--seed N] \
#       [--out-buf NAME]
#
# ELF layout assumed (default --elf-dir is build/tests_mayo/<func_name>):
#   <elf-dir>/<func_name>.elf   -- the correct build
#   <elf-dir>/*.elf             -- every other .elf is a faulty variant,
#                                  tested one at a time
#
# Example:
#   ./run_pipeline.sh mat_add in --secret-pos 0
#   ./run_pipeline.sh mat_mul O --secret-pos 0 --fixed-scalars m_vec_limbs

set -euo pipefail

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <func_name> <secret_buf> --secret-pos POS [--elf-dir DIR] [--fixed-scalars n1,n2,...] [--seed N] [--out-buf NAME]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
SECRET_BUF="$1"; shift

SECRET_POS=0
ELF_DIR="build/tests_mayo/${FUNC_NAME}"
FIXED_SCALARS=""
SEED=0
OUT_BUF_OVERRIDE=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --secret-pos) SECRET_POS="$2"; shift 2 ;;
        --elf-dir) ELF_DIR="$2"; shift 2 ;;
        --fixed-scalars) FIXED_SCALARS="$2"; shift 2 ;;
        --seed) SEED="$2"; shift 2 ;;
        --out-buf) OUT_BUF_OVERRIDE="$2"; shift 2 ;;
        *) echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
    esac
done

if [[ -z "$SECRET_POS" ]]; then
    echo "[!] --secret-pos POS is required" >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for req in collect_dist.sh run_ineffective_paired.sh run_correction_paired.sh; do
    if [[ ! -x "${SCRIPT_DIR}/${req}" ]]; then
        echo "[!] required script not found or not executable: ${SCRIPT_DIR}/${req}" >&2
        echo "    (chmod +x it, or place it alongside run_pipeline.sh)" >&2
        exit 1
    fi
done

# ---------------------------------------------------------------------------
# Discover the faulty ELF set up front, so the plan is printed before any
# work starts, and so [2/3]/[3/3] (which discover the same set internally)
# are guaranteed to see the same directory contents this script acted on.
# ---------------------------------------------------------------------------

CORRECT_ELF="${ELF_DIR}/${FUNC_NAME}.elf"
[[ -d "$ELF_DIR" ]] || { echo "[!] elf dir not found: $ELF_DIR" >&2; exit 1; }
[[ -f "$CORRECT_ELF" ]] || { echo "[!] correct elf not found: $CORRECT_ELF" >&2; exit 1; }

# Faulty builds are not necessarily immediate children of the correct
# ELF -- they can be nested several directories deep -- so this must be a
# recursive search, not a flat glob.
FAULTY_ELFS=()
while IFS= read -r -d '' f; do
    FAULTY_ELFS+=("$f")
done < <(find "$ELF_DIR" -type f -name '*.elf' -not -samefile "$CORRECT_ELF" -print0 | sort -z)

if [[ ${#FAULTY_ELFS[@]} -eq 0 ]]; then
    echo "[!] no faulty ELFs found under $ELF_DIR (besides $CORRECT_ELF)" >&2
    exit 1
fi

echo "[i] function:     ${FUNC_NAME}"
echo "[i] secret buf:    ${SECRET_BUF} (pos ${SECRET_POS})"
echo "[i] correct elf:   ${CORRECT_ELF}"
echo "[i] faulty elfs:   ${#FAULTY_ELFS[@]} found under ${ELF_DIR}"
for f in "${FAULTY_ELFS[@]}"; do
    echo "                    - ${f#${ELF_DIR}/}"
done

# ---------------------------------------------------------------------------
# [1/3] collect_dist.sh, once per faulty ELF
# ---------------------------------------------------------------------------

echo ""
echo "########## [1/3] collect_dist.sh (${#FAULTY_ELFS[@]} faulty ELF(s)) ##########"
for faulty_elf in "${FAULTY_ELFS[@]}"; do
    echo ""
    echo "--- collect_dist: ${FUNC_NAME} / $(basename "$faulty_elf") ---"
    "${SCRIPT_DIR}/collect_dist.sh" \
        "$FUNC_NAME" "$CORRECT_ELF" "$faulty_elf" "$SECRET_BUF" \
        --secret-pos "$SECRET_POS" \
        --fixed-scalars "$FIXED_SCALARS" \
        --seed "$SEED"
done

# ---------------------------------------------------------------------------
# [2/3] and [3/3] each loop internally over every faulty ELF's dist_paired
# dir, so they're called once per function, not once per faulty ELF.
# ---------------------------------------------------------------------------

RUN_ARGS=("$FUNC_NAME" "$SECRET_BUF" --elf-dir "$ELF_DIR")
if [[ -n "$OUT_BUF_OVERRIDE" ]]; then
    RUN_ARGS+=(--out-buf "$OUT_BUF_OVERRIDE")
fi

echo ""
echo "########## [2/3] run_ineffective_paired.sh ##########"
"${SCRIPT_DIR}/run_ineffective_paired.sh" "${RUN_ARGS[@]}"

echo ""
echo "########## [3/3] run_correction_paired.sh ##########"
"${SCRIPT_DIR}/run_correction_paired.sh" "${RUN_ARGS[@]}"

echo ""
echo "=== pipeline complete: ${FUNC_NAME} (${#FAULTY_ELFS[@]} faulty ELF(s)) ==="
echo "[i] per-faulty-ELF results under: tests_mayo/${FUNC_NAME}/<faulty_elf_stem>/{ineffective,correction}_paired_result.txt"