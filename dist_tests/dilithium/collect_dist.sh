#!/usr/bin/env bash
#
# collect_dist.sh — calibrate (if needed), then run the single-background
# paired secret sweep (field_mod values x 2 variants, e.g. 256 x 2 = 512
# runs for a full-byte sweep) for use with a raw (s1,s2) pair comparison
# script.
#
# Dilithium-specific vs. the Kyber version:
#   - setup scripts live under dist_tests/dilithium/setup
#   - output is scoped under tests_dilithium/ instead of tests_kyber/
#   - --dilithium-mode (2/3/5) replaces --kyber-k, and is passed ONLY to
#     collect_dist.py: it selects K/L/ETA/TAU/GAMMA1/GAMMA2/OMEGA for
#     distribution-aware background sampling. calibrate.py's probe mode
#     never samples from a distribution at all, so it has no use for it
#     -- see both scripts' module docstrings.
#   - FIELD_MOD stays 256 (a full byte sweep/fill). Dilithium
#     coefficients are int32_t, so FIELD_MOD is NOT the field modulus
#     (Q = 8380417); it only controls how many values --secret-pos is
#     swept through and the fallback fill range for inputs with no
#     declared distribution.
#   - --secret-pos is a BYTE offset. Coefficient i's low byte is at
#     4*i, not i.
#
# NOTE: FUNC_NAME must be the function's full/mangled symbol name (e.g.
# pqcrystals_dilithium2_ref_poly_ntt, not the short "poly_ntt" that
# dilithium_function_inputs/*.json is keyed under) -- it's used both as
# the breakpoint target against the ELF and as the
# tests_dilithium/<FUNC_NAME> witness directory name, both of which
# extract_qemu_witness.py derived from the .ll file's full stem. Only
# the function_inputs JSON lookup strips the
# pqcrystals_dilithium{,2,3,5}_ref_ / pqcrystals_dilithium_fips202_ref_
# prefix, and that already happened when the witness was extracted.
#
# Usage:
#   ./collect_dist.sh <func_name> <correct_elf> <faulty_elf> <secret_buf> \
#       --secret-pos POS [--fixed-scalars name1,name2,...] [--seed N] \
#       [--field-mod N] [--dilithium-mode 2|3|5] [--recalibrate]

set -euo pipefail

if [[ $# -lt 4 ]]; then
    echo "Usage: $0 <func_name> <correct_elf> <faulty_elf> <secret_buf> --secret-pos POS [--fixed-scalars name1,name2,...] [--seed N] [--field-mod N] [--dilithium-mode 2|3|5] [--recalibrate]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
CORRECT_ELF="$1"; shift
FAULTY_ELF="$1"; shift
SECRET_BUF="$1"; shift

SECRET_POS=0
FIXED_SCALARS=""
SEED=0
FIELD_MOD=256
DILITHIUM_MODE=2
RECALIBRATE=0

while [[ $# -gt 0 ]]; do
    case "$1" in
        --secret-pos) SECRET_POS="$2"; shift 2 ;;
        --fixed-scalars) FIXED_SCALARS="$2"; shift 2 ;;
        --seed) SEED="$2"; shift 2 ;;
        --field-mod) FIELD_MOD="$2"; shift 2 ;;
        --dilithium-mode) DILITHIUM_MODE="$2"; shift 2 ;;
        --recalibrate) RECALIBRATE=1; shift ;;
        *) echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
    esac
done

if [[ -z "$SECRET_POS" ]]; then
    echo "[!] --secret-pos POS is required" >&2
    exit 1
fi

# ---------------------------------------------------------------------------
# Path setup. NOTE: this must come before any [[ -f "$WITNESS" ]] checks --
# under `set -u`, referencing WITNESS/etc. before assignment is a hard
# error, not an empty-string check.
# ---------------------------------------------------------------------------

MACHINE=mps2-an386
SETUP_DIR="dist_tests/dilithium/setup"
OUT_DIR="tests_dilithium/${FUNC_NAME}"
WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"

[[ -f "$CORRECT_ELF" ]] || { echo "[!] correct ELF not found: $CORRECT_ELF" >&2; exit 1; }
[[ -f "$FAULTY_ELF" ]] || { echo "[!] faulty ELF not found: $FAULTY_ELF" >&2; exit 1; }
[[ -f "$WITNESS" ]] || { echo "[!] qemu_witness.json not found: $WITNESS (run extract_qemu_witness.py first)" >&2; exit 1; }

# ---------------------------------------------------------------------------
# rel_stem: path of an ELF relative to a base dir, minus the .elf suffix.
# Faulty ELFs may live several directories below the function's ELF dir
# (not just as immediate siblings of the correct ELF), so the per-variant
# output dir is keyed off the RELATIVE PATH, not basename -- two faulty
# ELFs with the same filename in different subdirectories must not collide.
# ---------------------------------------------------------------------------
rel_stem() {
    python3 - "$1" "$2" <<'PYEOF'
import os, sys
elf, base = sys.argv[1], sys.argv[2]
rel = os.path.relpath(os.path.abspath(elf), os.path.abspath(base))
if rel.endswith(".elf"):
    rel = rel[:-4]
print(rel)
PYEOF
}

# Faulty ELF stem is relative to the CORRECT ELF's directory (i.e. the
# function's ELF dir), so this matches what any downstream paired-test
# runner derives when it later looks this sweep up.
ELF_BASE_DIR="$(dirname "$CORRECT_ELF")"
FAULTY_STEM="$(rel_stem "$FAULTY_ELF" "$ELF_BASE_DIR")"
DIST_PAIRED_DIR="${OUT_DIR}/${FAULTY_STEM}/dist_paired"

mkdir -p "$OUT_DIR"

# if [[ ! -f "$ACTIVE_LENGTHS" || "$RECALIBRATE" == "1" ]]; then
    # echo "=== [1/2] calibrate: ${FUNC_NAME} ==="
    # python3 "${SETUP_DIR}/calibrate.py" \
    #     --witness "$WITNESS" --elf "$CORRECT_ELF" \
    #     --field-mod "$FIELD_MOD" --machine "$MACHINE" \
    #     --fixed-scalars "$FIXED_SCALARS"
# else
    # echo "=== [1/2] calibrate: skipped (${ACTIVE_LENGTHS} exists; pass --recalibrate to force) ==="
# fi

echo "=== [2/2] collect_dist: ${FUNC_NAME} / $(basename "$FAULTY_ELF") ==="
python3 "${SETUP_DIR}/collect_dist.py" \
    --witness "$WITNESS" --active-lengths "$ACTIVE_LENGTHS" \
    --correct-elf "$CORRECT_ELF" --faulty-elf "$FAULTY_ELF" \
    --func "$FUNC_NAME" --field-mod "$FIELD_MOD" \
    --dilithium-mode "$DILITHIUM_MODE" \
    --secret-buf "$SECRET_BUF" --secret-pos "$SECRET_POS" --seed "$SEED" \
    --outdir "$DIST_PAIRED_DIR" --machine "$MACHINE" \
    --fixed-scalars "$FIXED_SCALARS"

echo "=== done: ${FUNC_NAME} / $(basename "$FAULTY_ELF") ==="
echo "[i] next: the ineffective / correction paired tests (not written yet)"
echo "         over ${DIST_PAIRED_DIR}"