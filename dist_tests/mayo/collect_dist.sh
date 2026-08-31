#!/usr/bin/env bash
#
# collect_dist — calibrate, collect trials, and run both statistical
# dependence tests for a single MAYO function.
#
# Usage:
#   ./collect_dist <func_name> <correct_elf> <faulty_elf> <secret_buf> \
#       [n_trials] [--fixed-scalars name1,name2,...]
#
# Example:
#   ./collect_dist mat_add \
#       build/tests_mayo/mat_add/mat_add.elf \
#       build/tests_mayo/mat_add/loopOrFuncSkip/mat_add_fnSkip_add_f_line8.elf \
#       Ox
#
# Example with structural scalars pinned:
#   ./collect_dist mat_mul \
#       build/tests_mayo/mat_mul/mat_mul.elf \
#       build/tests_mayo/mat_mul/loopOrFuncSkip/mat_mul_fnSkip_lincomb_line10.elf \
#       x 400 --fixed-scalars colrow_ab,row_a,col_b
#
# Assumes:
#   tests_mayo/<func_name>/qemu_witness.json   already exists
#   dist_tests/mayo/setup/calibrate.py
#   dist_tests/mayo/setup/collect_distribution.py
#   dist_tests/mayo/correction_mayo.py
#   dist_tests/mayo/ineffective_mayo.py

set -euo pipefail

# ---------------------------------------------------------------------------
# Args
# ---------------------------------------------------------------------------

if [[ $# -lt 4 ]]; then
    echo "Usage: $0 <func_name> <correct_elf> <faulty_elf> <secret_buf> [n_trials] [--fixed-scalars name1,name2,...]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
CORRECT_ELF="$1"; shift
FAULTY_ELF="$1"; shift
SECRET_BUF="$1"; shift

N_TRIALS=100
FIXED_SCALARS=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --fixed-scalars)
            if [[ $# -lt 2 ]]; then
                echo "[!] --fixed-scalars requires a value" >&2
                exit 1
            fi
            FIXED_SCALARS="$2"
            shift 2
            ;;
        *)
            N_TRIALS="$1"
            shift
            ;;
    esac
done

WORD_SIZE=1          # MAYO default: everything is byte/GF(16)-packed
FIELD_MOD=16
MACHINE=mps2-an386

SETUP_DIR="dist_tests/mayo/setup"
TEST_DIR="dist_tests/mayo"
OUT_DIR="tests_mayo/${FUNC_NAME}"

WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"
DIST_DIR="${OUT_DIR}/dist"

if [[ ! -f "$WITNESS" ]]; then
    echo "[!] witness not found: $WITNESS" >&2
    echo "    (generate it first via extract_qemu_witness.py)" >&2
    exit 1
fi
if [[ ! -f "$CORRECT_ELF" ]]; then
    echo "[!] correct ELF not found: $CORRECT_ELF" >&2
    exit 1
fi
if [[ ! -f "$FAULTY_ELF" ]]; then
    echo "[!] faulty ELF not found: $FAULTY_ELF" >&2
    exit 1
fi

mkdir -p "$OUT_DIR"

if [[ -n "$FIXED_SCALARS" ]]; then
    echo "[i] fixed-scalars: ${FIXED_SCALARS}"
fi

# ---------------------------------------------------------------------------
# Derive --out-buf from the witness (the role:"output" entry name) and
# --active-len from active_lengths.json[secret_buf] once calibration has run.
# ---------------------------------------------------------------------------

derive_out_buf() {
    python3 - "$WITNESS" <<'PYEOF'
import json, sys
with open(sys.argv[1]) as f:
    layout = json.load(f)["layout"]
outs = [name for name, spec in layout.items() if spec.get("role") == "output"]
if not outs:
    print("[!] no role:output entry found in witness layout", file=sys.stderr)
    sys.exit(1)
if len(outs) > 1:
    print(f"[!] multiple output-role entries found: {outs}; using the first", file=sys.stderr)
print(outs[0])
PYEOF
}

derive_active_len() {
    python3 - "$ACTIVE_LENGTHS" "$SECRET_BUF" "$WITNESS" <<'PYEOF'
import json, sys
active_path, secret_buf, witness_path = sys.argv[1], sys.argv[2], sys.argv[3]
with open(active_path) as f:
    active_lengths = json.load(f)
if secret_buf in active_lengths:
    print(active_lengths[secret_buf])
    sys.exit(0)
# Fall back to the witness's declared length for this buffer (e.g. scalar
# args skipped by calibration, or buffers <= calibrate.py's skip threshold).
with open(witness_path) as f:
    layout = json.load(f)["layout"]
if secret_buf in layout:
    print(layout[secret_buf]["length"])
    sys.exit(0)
print(f"[!] secret-buf '{secret_buf}' not found in active_lengths.json or witness", file=sys.stderr)
sys.exit(1)
PYEOF
}

# ---------------------------------------------------------------------------
# 1. Calibrate (writes active_lengths.json into OUT_DIR)
# ---------------------------------------------------------------------------

echo "=== [1/3] calibrate: ${FUNC_NAME} ==="
echo "
python3 "${SETUP_DIR}/calibrate.py" \
    --witness "$WITNESS" \
    --elf "$CORRECT_ELF" \
    --field-mod "$FIELD_MOD" \
    --machine "$MACHINE" \
    --out "$ACTIVE_LENGTHS" \
    --fixed-scalars "$FIXED_SCALARS"
"
python3 "${SETUP_DIR}/calibrate.py" \
    --witness "$WITNESS" \
    --elf "$CORRECT_ELF" \
    --field-mod "$FIELD_MOD" \
    --machine "$MACHINE" \
    --out "$ACTIVE_LENGTHS" \
    --fixed-scalars "$FIXED_SCALARS"

if [[ ! -f "$ACTIVE_LENGTHS" ]]; then
    echo "[!] calibrate.py did not produce $ACTIVE_LENGTHS" >&2
    exit 1
fi

OUT_BUF="$(derive_out_buf)"
ACTIVE_LEN="$(derive_active_len)"

echo "[i] derived --out-buf=${OUT_BUF} --active-len=${ACTIVE_LEN}"

# ---------------------------------------------------------------------------
# 2. Collect N correct/faulty trial pairs
# ---------------------------------------------------------------------------

echo "=== [2/3] collect_distribution: ${FUNC_NAME} (n=${N_TRIALS}) ==="
echo "
python3 "${SETUP_DIR}/collect_distribution.py" \
    --witness "$WITNESS" \
    --active-lengths "$ACTIVE_LENGTHS" \
    --correct-elf "$CORRECT_ELF" \
    --faulty-elf "$FAULTY_ELF" \
    --func "$FUNC_NAME" \
    --field-mod "$FIELD_MOD" \
    -n "$N_TRIALS" \
    --outdir "$DIST_DIR" \
    --machine "$MACHINE" \
    --fixed-scalars "$FIXED_SCALARS"
"
python3 "${SETUP_DIR}/collect_distribution.py" \
    --witness "$WITNESS" \
    --active-lengths "$ACTIVE_LENGTHS" \
    --correct-elf "$CORRECT_ELF" \
    --faulty-elf "$FAULTY_ELF" \
    --func "$FUNC_NAME" \
    --field-mod "$FIELD_MOD" \
    -n "$N_TRIALS" \
    --outdir "$DIST_DIR" \
    --machine "$MACHINE" \
    --fixed-scalars "$FIXED_SCALARS"

n_pairs=$(ls "${DIST_DIR}"/correct_trial*.json 2>/dev/null | wc -l)
if [[ "$n_pairs" -eq 0 ]]; then
    echo "[!] no trial pairs were written to $DIST_DIR -- aborting before running tests" >&2
    exit 1
fi
echo "[i] ${n_pairs} correct_trial*.json files present in ${DIST_DIR}"
echo "=== done: ${FUNC_NAME} ==="