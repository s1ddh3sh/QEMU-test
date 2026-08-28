#!/usr/bin/env bash
#
# run_tests.sh — calibrate, collect trials, and run both statistical
# dependence tests for a single MAYO function.
#
# Usage:
#   ./run_tests.sh <func_name> <correct_elf> <faulty_elf> <secret_buf> [n_trials]
#
# Example:
#   ./run_tests.sh mat_add \
#       build/tests_mayo/mat_add/mat_add.elf \
#       build/tests_mayo/mat_add/loopOrFuncSkip/mat_add_fnSkip_add_f_line8.elf \
#       Ox
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
    echo "Usage: $0 <func_name> <correct_elf> <faulty_elf> <secret_buf> [n_trials]" >&2
    exit 1
fi

FUNC_NAME="$1"
CORRECT_ELF="$2"
FAULTY_ELF="$3"
SECRET_BUF="$4"
N_TRIALS="${5:-100}"

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

OUT_BUF="$(derive_out_buf)"
ACTIVE_LEN="$(derive_active_len)"

echo "[i] derived --out-buf=${OUT_BUF} --active-len=${ACTIVE_LEN}"

# ---------------------------------------------------------------------------
# 3. Run correction-dependence and ineffective-dependence tests
# ---------------------------------------------------------------------------

echo "=== [3/3] statistical tests: ${FUNC_NAME} ==="
CORRECTION_OUT="${OUT_DIR}/${FAULTY_ELF%.elf}/correction_result.txt"
INEFFECTIVE_OUT="${OUT_DIR}/${FAULTY_ELF%.elf}/ineffective_result.txt"
echo "
python3 "${TEST_DIR}/correction_mayo.py" \
    --dist-dir "$DIST_DIR" \
    --secret-buf "$SECRET_BUF" --out-buf "$OUT_BUF" \
    --active-len "$ACTIVE_LEN" \
    --secret-word-size "$WORD_SIZE" --out-word-size "$WORD_SIZE" \
    --auto-domain \
    | tee "$CORRECTION_OUT"
"
echo "
python3 "${TEST_DIR}/ineffective_mayo.py" \
    --dist-dir "$DIST_DIR" \
    --secret-buf "$SECRET_BUF" --out-buf "$OUT_BUF" \
    --active-len "$ACTIVE_LEN" \
    --secret-word-size "$WORD_SIZE" --out-word-size "$WORD_SIZE" \
    --auto-domain \
    | tee "$INEFFECTIVE_OUT"
"
mkdir -p "$(dirname "$CORRECTION_OUT")"
python3 "${TEST_DIR}/correction_mayo.py" \
    --dist-dir "$DIST_DIR" \
    --secret-buf "$SECRET_BUF" --out-buf "$OUT_BUF" \
    --active-len "$ACTIVE_LEN" \
    --secret-word-size "$WORD_SIZE" --out-word-size "$WORD_SIZE" \
    --auto-domain \
    | tee "$CORRECTION_OUT"
mkdir -p "$(dirname "$INEFFECTIVE_OUT")"
python3 "${TEST_DIR}/ineffective_mayo.py" \
    --dist-dir "$DIST_DIR" \
    --secret-buf "$SECRET_BUF" --out-buf "$OUT_BUF" \
    --active-len "$ACTIVE_LEN" \
    --secret-word-size "$WORD_SIZE" --out-word-size "$WORD_SIZE" \
    --auto-domain \
    | tee "$INEFFECTIVE_OUT"

echo "=== done: ${FUNC_NAME} ==="
echo "[i] correction test -> ${CORRECTION_OUT}"
echo "[i] ineffective test -> ${INEFFECTIVE_OUT}"