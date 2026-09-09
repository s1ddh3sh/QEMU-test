#!/usr/bin/env bash
#
# run_pipeline.sh — full paired-sweep pipeline for one Dilithium function.
#
#   1. calibrate.py             (once for the function)
#   2. collect_dist.sh          (once per faulty ELF: the paired secret sweep)
# Then, once for the whole function (each internally loops over every
# faulty ELF's collected sweep):
#   3. run_ineffective_paired.sh
#   4. run_correction_paired.sh
#
# Usage:
#   ./run_pipeline.sh <func_name> <secret_buf> --secret-pos POS \
#       [--elf-dir DIR] [--fixed-scalars name1,name2,...] [--seed N] \
#       [--out-buf NAME] [--field-mod N] [--dilithium-mode 2|3|5]
#
# ELF layout assumed (default --elf-dir is build/tests_dilithium/<func_name>):
#   <elf-dir>/<func_name>.elf   -- the correct build
#   <elf-dir>/*.elf             -- every other .elf is a faulty variant,
#                                  tested one at a time
#
# Dilithium-specific vs. the Kyber version:
#   - dist_tests/dilithium, tests_dilithium, build/tests_dilithium.
#   - --field-mod defaults to 256 (a full byte sweep/fill). It is NOT a
#     field modulus here: Dilithium's Q is 8380417 and coefficients are
#     int32_t, so FIELD_MOD only controls how many values --secret-pos is
#     swept through and the fallback fill range for inputs with no
#     declared distribution. (The Kyber script inherited a --field-mod 16
#     from the MAYO original for its calibrate step, which was wrong
#     there too -- calibration wants a full byte range.)
#   - --dilithium-mode (2/3/5, default 2) is forwarded to collect_dist.sh
#     for distribution-aware background sampling. trace.h only emits
#     PRINT_ARGS under DILITHIUM_MODE == 2, so witnesses are normally
#     mode-2.
#   - --secret-pos is a BYTE offset and a coefficient is 4 bytes:
#     coefficient i's low byte is at 4*i.
#   - calibration runs here, unconditionally, exactly once per function,
#     before any faulty-ELF sweep -- collect_dist.sh also has its own
#     calibrate step, but only reaches it if active_lengths.json is
#     still missing, so it never re-runs what this script just did.
#
# Example:
#   ./run_pipeline.sh pqcrystals_dilithium2_ref_poly_add a --secret-pos 0

set -euo pipefail

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <func_name> <secret_buf> --secret-pos POS [--elf-dir DIR] [--fixed-scalars n1,n2,...] [--seed N] [--out-buf NAME] [--field-mod N] [--dilithium-mode 2|3|5]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
SECRET_BUF="$1"; shift

SECRET_POS=0
SETUP_DIR="dist_tests/dilithium/setup"
OUT_DIR="tests_dilithium/${FUNC_NAME}"
WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"
ELF_DIR="build/tests_dilithium/${FUNC_NAME}"
FIXED_SCALARS=""
SEED=0
OUT_BUF_OVERRIDE=""
FIELD_MOD=256
DILITHIUM_MODE=2

while [[ $# -gt 0 ]]; do
    case "$1" in
        --secret-pos) SECRET_POS="$2"; shift 2 ;;
        --elf-dir) ELF_DIR="$2"; shift 2 ;;
        --fixed-scalars) FIXED_SCALARS="$2"; shift 2 ;;
        --seed) SEED="$2"; shift 2 ;;
        --out-buf) OUT_BUF_OVERRIDE="$2"; shift 2 ;;
        --field-mod) FIELD_MOD="$2"; shift 2 ;;
        --dilithium-mode) DILITHIUM_MODE="$2"; shift 2 ;;
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

[[ -f "$WITNESS" ]] || { echo "[!] witness not found: $WITNESS (run extract_qemu_witness.py first)" >&2; exit 1; }

# ---------------------------------------------------------------------------
# Discover the faulty ELF set up front, so the plan is printed before any
# work starts, and so the later stages (which discover the same set
# internally) are guaranteed to see the same directory contents this
# script acted on.
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

echo "[i] function:      ${FUNC_NAME}"
echo "[i] secret buf:    ${SECRET_BUF} (byte pos ${SECRET_POS}; coefficient i's low byte is at 4*i)"
echo "[i] dilithium mode: ${DILITHIUM_MODE}, field-mod ${FIELD_MOD}"
echo "[i] correct elf:   ${CORRECT_ELF}"
echo "[i] faulty elfs:   ${#FAULTY_ELFS[@]} found under ${ELF_DIR}"
for f in "${FAULTY_ELFS[@]}"; do
    echo "                    - ${f#${ELF_DIR}/}"
done

# ---------------------------------------------------------------------------
# [1/4] calibrate, once for the function -- ALWAYS run, before the
# per-faulty-ELF loop below. Every faulty ELF shares the same
# active_lengths.json (it's a property of the correct build's input
# sensitivity, not of any particular fault), so this must run exactly
# once per function, never once per faulty ELF.
# ---------------------------------------------------------------------------
echo ""
echo "########## [1/4] calibrate: ${FUNC_NAME} ##########"
python3 "${SETUP_DIR}/calibrate.py" \
    --witness "$WITNESS" --elf "$CORRECT_ELF" \
    --field-mod "$FIELD_MOD" --machine mps2-an386 \
    --out "$ACTIVE_LENGTHS" --fixed-scalars "$FIXED_SCALARS"

# A calibrated length of 0 for the swept buffer means the FUT looked
# insensitive to every byte of it -- in practice a witness/binding
# problem, not a result. Stop here rather than burning field_mod*2 QEMU
# boots per faulty ELF on a sweep that cannot show anything.
python3 - "$ACTIVE_LENGTHS" "$SECRET_BUF" <<'PYEOF'
import json, sys
path, secret_buf = sys.argv[1], sys.argv[2]
with open(path) as f:
    active = json.load(f)
if active.get(secret_buf) == 0:
    print(
        f"[!] '{secret_buf}' calibrated to active length 0. Check that the "
        f"witness binds sample keys to the right call arguments (parameter "
        f"name vs. PRINT_ARGS order) and that the declared lengths match "
        f"the real allocas before running the sweep.",
        file=sys.stderr,
    )
    sys.exit(1)
PYEOF

# ---------------------------------------------------------------------------
# [2/4] collect_dist.sh, once per faulty ELF
# ---------------------------------------------------------------------------
echo ""
echo "########## [2/4] collect_dist.sh (${#FAULTY_ELFS[@]} faulty ELF(s)) ##########"
for faulty_elf in "${FAULTY_ELFS[@]}"; do
    echo ""
    echo "--- collect_dist: ${FUNC_NAME} / $(basename "$faulty_elf") ---"
    "${SCRIPT_DIR}/collect_dist.sh" \
        "$FUNC_NAME" "$CORRECT_ELF" "$faulty_elf" "$SECRET_BUF" \
        --secret-pos "$SECRET_POS" \
        --fixed-scalars "$FIXED_SCALARS" \
        --seed "$SEED" \
        --field-mod "$FIELD_MOD" \
        --dilithium-mode "$DILITHIUM_MODE"
done

# ---------------------------------------------------------------------------
# [3/4] and [4/4] each loop internally over every faulty ELF's dist_paired
# dir, so they're called once per function, not once per faulty ELF.
# ---------------------------------------------------------------------------

RUN_ARGS=("$FUNC_NAME" "$SECRET_BUF" --elf-dir "$ELF_DIR")
if [[ -n "$OUT_BUF_OVERRIDE" ]]; then
    RUN_ARGS+=(--out-buf "$OUT_BUF_OVERRIDE")
fi

echo ""
echo "########## [3/4] run_ineffective_paired.sh ##########"
"${SCRIPT_DIR}/run_ineffective_paired.sh" "${RUN_ARGS[@]}"

echo ""
echo "########## [4/4] run_correction_paired.sh ##########"
"${SCRIPT_DIR}/run_correction_paired.sh" "${RUN_ARGS[@]}"

echo ""
echo "=== pipeline complete: ${FUNC_NAME} (${#FAULTY_ELFS[@]} faulty ELF(s)) ==="
echo "[i] per-faulty-ELF results under: tests_dilithium/${FUNC_NAME}/<faulty_elf_stem>/{ineffective,correction}_paired_result.txt"