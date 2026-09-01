#!/usr/bin/env bash
#
# run_tests.sh — run correction-dependence and ineffective-dependence
# tests for a single MAYO function, against already-collected trial data.
#
# Usage:
#   ./run_tests.sh <func_name> <faulty_elf> <secret_buf> [--out-buf NAME]
#
# Assumes trials already exist (i.e. calibrate.py + collect_distribution.py
# / collect_dist.sh have already been run for this func_name):
#   tests_mayo/<func_name>/qemu_witness.json
#   tests_mayo/<func_name>/active_lengths.json
#   tests_mayo/<func_name>/dist/{correct,faulty}_trial*.json
#
# Example:
#   ./run_tests.sh m_vec_add \
#       build/tests_mayo/m_vec_add/binOpFault/m_vec_add_line8_opA.elf \
#       in

set -euo pipefail

# ---------------------------------------------------------------------------
# Args
# ---------------------------------------------------------------------------

if [[ $# -lt 3 ]]; then
    echo "Usage: $0 <func_name> <faulty_elf> <secret_buf> [--out-buf NAME]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
FAULTY_ELF="$1"; shift
SECRET_BUF="$1"; shift

OUT_BUF_OVERRIDE=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --out-buf)
            if [[ $# -lt 2 ]]; then
                echo "[!] --out-buf requires a value" >&2
                exit 1
            fi
            OUT_BUF_OVERRIDE="$2"
            shift 2
            ;;
        *)
            echo "[!] unrecognized argument: $1" >&2
            exit 1
            ;;
    esac
done

WORD_SIZE=1          # MAYO default: everything is byte/GF(16)-packed

TEST_DIR="dist_tests/mayo"
OUT_DIR="tests_mayo/${FUNC_NAME}"

WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"
DIST_DIR="${OUT_DIR}/dist"

if [[ ! -f "$WITNESS" ]]; then
    echo "[!] witness not found: $WITNESS" >&2
    exit 1
fi
if [[ ! -f "$ACTIVE_LENGTHS" ]]; then
    echo "[!] active_lengths.json not found: $ACTIVE_LENGTHS" >&2
    echo "    (run calibrate.py first)" >&2
    exit 1
fi
n_pairs=$(ls "${DIST_DIR}"/correct_trial*.json 2>/dev/null | wc -l)
if [[ "$n_pairs" -eq 0 ]]; then
    echo "[!] no trial pairs found in $DIST_DIR" >&2
    echo "    (run collect_distribution.py / collect_dist.sh first)" >&2
    exit 1
fi
echo "[i] ${n_pairs} correct_trial*.json files present in ${DIST_DIR}"

# ---------------------------------------------------------------------------
# Derive --out-buf from the witness (unless overridden) and --active-len
# from active_lengths.json[secret_buf].
#
# SAFETY: if secret_buf was never calibrated, falling back to the witness's
# FULL declared length can be enormous and make the position loop appear
# to hang -- it isn't hung, it's just iterating over far more positions
# than intended. Cap the fallback explicitly.
# ---------------------------------------------------------------------------

MAX_SAFE_FALLBACK_LEN=4096

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
    print(f"[!] multiple output-role entries found: {outs}; defaulting to "
          f"the first ({outs[0]}). Pass --out-buf NAME to pick a different one.",
          file=sys.stderr)
print(outs[0])
PYEOF
}

validate_out_buf() {
    python3 - "$WITNESS" "$OUT_BUF_OVERRIDE" <<'PYEOF'
import json, sys
witness_path, requested = sys.argv[1], sys.argv[2]
with open(witness_path) as f:
    layout = json.load(f)["layout"]
if requested not in layout:
    print(f"[!] --out-buf '{requested}' not found in witness layout "
          f"(available: {sorted(layout.keys())})", file=sys.stderr)
    sys.exit(1)
if layout[requested].get("role") != "output":
    print(f"[!] --out-buf '{requested}' has role="
          f"'{layout[requested].get('role')}', not 'output'", file=sys.stderr)
    sys.exit(1)
PYEOF
}

derive_active_len() {
    python3 - "$ACTIVE_LENGTHS" "$SECRET_BUF" "$WITNESS" "$MAX_SAFE_FALLBACK_LEN" <<'PYEOF'
import json, sys
active_path, secret_buf, witness_path, max_fallback = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
with open(active_path) as f:
    active_lengths = json.load(f)
if secret_buf in active_lengths:
    print(active_lengths[secret_buf])
    sys.exit(0)
with open(witness_path) as f:
    layout = json.load(f)["layout"]
if secret_buf in layout:
    full_len = layout[secret_buf]["length"]
    if full_len > max_fallback:
        print(
            f"[!] secret-buf '{secret_buf}' was never calibrated and its "
            f"full declared length ({full_len}) exceeds the safety cap "
            f"({max_fallback}); capping --active-len to {max_fallback}. "
            f"Pass a smaller/calibrated secret-buf, or raise "
            f"MAX_SAFE_FALLBACK_LEN in this script if this is intentional.",
            file=sys.stderr,
        )
        full_len = max_fallback
    print(full_len)
    sys.exit(0)
print(f"[!] secret-buf '{secret_buf}' not found in active_lengths.json or witness", file=sys.stderr)
sys.exit(1)
PYEOF
}

if [[ -n "$OUT_BUF_OVERRIDE" ]]; then
    validate_out_buf
    OUT_BUF="$OUT_BUF_OVERRIDE"
else
    OUT_BUF="$(derive_out_buf)"
fi
ACTIVE_LEN="$(derive_active_len)"

echo "[i] derived --out-buf=${OUT_BUF} --active-len=${ACTIVE_LEN}"

# ---------------------------------------------------------------------------
# Run correction-dependence and ineffective-dependence tests
#
# `python3 -u` forces unbuffered stdout so `tee` shows progress live
# instead of appearing to hang while output queues up in a pipe buffer.
# stderr is merged in so warnings appear inline with the position they
# relate to, rather than jumping ahead of buffered stdout.
# ---------------------------------------------------------------------------

CORRECTION_OUT="${OUT_DIR}/${FAULTY_ELF%.elf}/correction_result.txt"
INEFFECTIVE_OUT="${OUT_DIR}/${FAULTY_ELF%.elf}/ineffective_result.txt"
mkdir -p "$(dirname "$CORRECTION_OUT")"
mkdir -p "$(dirname "$INEFFECTIVE_OUT")"

echo "=== correction test: ${FUNC_NAME} ==="
python3 -u "${TEST_DIR}/correction_mayo.py" \
    --dist-dir "$DIST_DIR" \
    --secret-buf "$SECRET_BUF" --out-buf "$OUT_BUF" \
    --active-len "$ACTIVE_LEN" \
    --secret-word-size "$WORD_SIZE" --out-word-size "$WORD_SIZE" \
    --auto-domain \
    2>&1 | tee "$CORRECTION_OUT"

echo "=== ineffective test: ${FUNC_NAME} ==="
python3 -u "${TEST_DIR}/ineffective_mayo.py" \
    --dist-dir "$DIST_DIR" \
    --secret-buf "$SECRET_BUF" --out-buf "$OUT_BUF" \
    --active-len "$ACTIVE_LEN" \
    --secret-word-size "$WORD_SIZE" --out-word-size "$WORD_SIZE" \
    --auto-domain \
    2>&1 | tee "$INEFFECTIVE_OUT"

echo "=== done: ${FUNC_NAME} ==="
echo "[i] correction test  -> ${CORRECTION_OUT}"
echo "[i] ineffective test -> ${INEFFECTIVE_OUT}"