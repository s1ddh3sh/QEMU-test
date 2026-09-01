#!/usr/bin/env bash
#
# run_correction_paired.sh — run the paired correction-fault query
# (correction_mayo.py) for a single MAYO function, against an
# already-collected single-background secret sweep
# (collect_paired_sweep.py / collect_dist.sh's paired output).
#
# Usage:
#   ./run_correction_paired.sh <func_name> <secret_buf> [--out-buf NAME]

set -euo pipefail

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <func_name> <secret_buf> [--out-buf NAME]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
SECRET_BUF="$1"; shift

OUT_BUF_OVERRIDE=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --out-buf) OUT_BUF_OVERRIDE="$2"; shift 2 ;;
        *) echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
    esac
done

WORD_SIZE=1
TEST_DIR="dist_tests/mayo"
OUT_DIR="tests_mayo/${FUNC_NAME}"
WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"
DIST_PAIRED_DIR="${OUT_DIR}/dist_paired"

[[ -f "$WITNESS" ]] || { echo "[!] witness not found: $WITNESS" >&2; exit 1; }
[[ -f "$ACTIVE_LENGTHS" ]] || { echo "[!] active_lengths.json not found: $ACTIVE_LENGTHS" >&2; exit 1; }
n_sv=$(ls "${DIST_PAIRED_DIR}"/correct_sv*.json 2>/dev/null | wc -l)
[[ "$n_sv" -gt 0 ]] || { echo "[!] no swept secret-value files found in $DIST_PAIRED_DIR" >&2; exit 1; }
echo "[i] ${n_sv} correct_sv*.json files present in ${DIST_PAIRED_DIR}"

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
    print(active_lengths[secret_buf]); sys.exit(0)
with open(witness_path) as f:
    layout = json.load(f)["layout"]
if secret_buf in layout:
    full_len = layout[secret_buf]["length"]
    if full_len > max_fallback:
        print(f"[!] secret-buf '{secret_buf}' was never calibrated and its full "
              f"declared length ({full_len}) exceeds the safety cap ({max_fallback}); "
              f"capping --active-len to {max_fallback}.", file=sys.stderr)
        full_len = max_fallback
    print(full_len); sys.exit(0)
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

CORRECTION_PAIRED_OUT="${OUT_DIR}/correction_paired_result.txt"
mkdir -p "$(dirname "$CORRECTION_PAIRED_OUT")"

echo "=== correction (paired) test: ${FUNC_NAME} ==="
python3 -u "${TEST_DIR}/correction_mayo.py" \
    --dist-dir "$DIST_PAIRED_DIR" \
    --out-buf "$OUT_BUF" \
    --active-len "$ACTIVE_LEN" \
    --out-word-size "$WORD_SIZE" \
    2>&1 | tee "$CORRECTION_PAIRED_OUT"

echo "=== done: ${FUNC_NAME} ==="
echo "[i] correction (paired) test -> ${CORRECTION_PAIRED_OUT}"