#!/usr/bin/env bash
#
# collect_dist.sh — calibrate, then run the single-background paired
# secret sweep (32 runs for GF(16): 16 values x 2 variants) for use with
# ineffective_paired_test.py's raw (s1,s2) pair comparison.
#
# Usage:
#   ./collect_dist.sh <func_name> <correct_elf> <faulty_elf> <secret_buf> \
#       --secret-pos POS [--fixed-scalars name1,name2,...] [--seed N]

set -euo pipefail

if [[ $# -lt 4 ]]; then
    echo "Usage: $0 <func_name> <correct_elf> <faulty_elf> <secret_buf> --secret-pos POS [--fixed-scalars name1,name2,...] [--seed N]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
CORRECT_ELF="$1"; shift
FAULTY_ELF="$1"; shift
SECRET_BUF="$1"; shift

SECRET_POS=0
FIXED_SCALARS=""
SEED=0

while [[ $# -gt 0 ]]; do
    case "$1" in
        --secret-pos) SECRET_POS="$2"; shift 2 ;;
        --fixed-scalars) FIXED_SCALARS="$2"; shift 2 ;;
        --seed) SEED="$2"; shift 2 ;;
        *) echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
    esac
done

if [[ -z "$SECRET_POS" ]]; then
    echo "[!] --secret-pos POS is required" >&2
    exit 1
fi

FIELD_MOD=16
MACHINE=mps2-an386
SETUP_DIR="dist_tests/mayo/setup"
OUT_DIR="tests_mayo/${FUNC_NAME}"
WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"
DIST_PAIRED_DIR="${OUT_DIR}/dist_paired"

[[ -f "$WITNESS" ]] || { echo "[!] witness not found: $WITNESS" >&2; exit 1; }
[[ -f "$CORRECT_ELF" ]] || { echo "[!] correct ELF not found: $CORRECT_ELF" >&2; exit 1; }
[[ -f "$FAULTY_ELF" ]] || { echo "[!] faulty ELF not found: $FAULTY_ELF" >&2; exit 1; }

mkdir -p "$OUT_DIR"

echo "=== [1/2] calibrate: ${FUNC_NAME} ==="
python3 "${SETUP_DIR}/calibrate.py" \
    --witness "$WITNESS" --elf "$CORRECT_ELF" \
    --field-mod "$FIELD_MOD" --machine "$MACHINE" \
    --out "$ACTIVE_LENGTHS" --fixed-scalars "$FIXED_SCALARS"

echo "=== [2/2] collect_dist: ${FUNC_NAME} ==="
python3 "${SETUP_DIR}/collect_dist.py" \
    --witness "$WITNESS" --active-lengths "$ACTIVE_LENGTHS" \
    --correct-elf "$CORRECT_ELF" --faulty-elf "$FAULTY_ELF" \
    --func "$FUNC_NAME" --field-mod "$FIELD_MOD" \
    --secret-buf "$SECRET_BUF" --secret-pos "$SECRET_POS" --seed "$SEED" \
    --outdir "$DIST_PAIRED_DIR" --machine "$MACHINE" \
    --fixed-scalars "$FIXED_SCALARS"

echo "=== done: ${FUNC_NAME} ==="
echo "[i] next: python3 dist_tests/mayo/ineffective_paired_test.py \\"
echo "         --dist-dir ${DIST_PAIRED_DIR} --out-buf <OUT_BUF> --active-len <ACTIVE_LEN>"