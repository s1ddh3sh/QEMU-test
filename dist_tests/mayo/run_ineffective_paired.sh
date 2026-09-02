#!/usr/bin/env bash
#
# run_ineffective_paired.sh — run the paired ineffective-dependence test
# (ineffective_mayo.py) for a single MAYO function, against every
# already-collected single-background secret sweep for that function --
# one sweep per faulty ELF variant found alongside the correct ELF.
#
# Usage:
#   ./run_ineffective_paired.sh <func_name> <secret_buf> \
#       [--out-buf NAME] [--elf-dir DIR]
#
# ELF layout assumed (default --elf-dir is build/tests_mayo/<func_name>):
#   <elf-dir>/<func_name>.elf   -- the correct build
#   <elf-dir>/*.elf             -- every other .elf is a faulty variant
#
# Assumes trials already exist for each faulty ELF:
#   tests_mayo/<func_name>/qemu_witness.json
#   tests_mayo/<func_name>/active_lengths.json
#   tests_mayo/<func_name>/<faulty_elf_stem>/dist_paired/{correct,faulty}_sv*.json
#
# Example:
#   ./run_ineffective_paired.sh mat_add in

set -euo pipefail

# ---------------------------------------------------------------------------
# Args
# ---------------------------------------------------------------------------

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <func_name> <secret_buf> [--out-buf NAME] [--elf-dir DIR]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
SECRET_BUF="$1"; shift

OUT_BUF_OVERRIDE=""
ELF_DIR="build/tests_mayo/${FUNC_NAME}"
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
        --elf-dir)
            if [[ $# -lt 2 ]]; then
                echo "[!] --elf-dir requires a value" >&2
                exit 1
            fi
            ELF_DIR="$2"
            shift 2
            ;;
        *)
            echo "[!] unrecognized argument: $1" >&2
            exit 1
            ;;
    esac
done

WORD_SIZE=1

TEST_DIR="dist_tests/mayo"
OUT_DIR="tests_mayo/${FUNC_NAME}"

WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"

if [[ ! -f "$WITNESS" ]]; then
    echo "[!] witness not found: $WITNESS" >&2
    exit 1
fi
if [[ ! -f "$ACTIVE_LENGTHS" ]]; then
    echo "[!] active_lengths.json not found: $ACTIVE_LENGTHS" >&2
    echo "    (run calibrate.py first)" >&2
    exit 1
fi
if [[ ! -d "$ELF_DIR" ]]; then
    echo "[!] elf dir not found: $ELF_DIR" >&2
    exit 1
fi

CORRECT_ELF="${ELF_DIR}/${FUNC_NAME}.elf"
if [[ ! -f "$CORRECT_ELF" ]]; then
    echo "[!] correct elf not found: $CORRECT_ELF" >&2
    exit 1
fi

# ---------------------------------------------------------------------------
# Derive --out-buf from the witness (unless overridden) and --active-len
# from active_lengths.json[secret_buf]. These are per-function, not
# per-faulty-ELF, so derived once up front and reused for every sweep.
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
# rel_stem: path of an ELF relative to a base dir, minus .elf. Must match
# collect_dist.sh's derivation exactly, since it's used to look up the
# dist_paired dir that script already populated.
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

# ---------------------------------------------------------------------------
# Discover every faulty ELF anywhere under ELF_DIR (faulty builds are not
# necessarily immediate children of the correct ELF -- can be nested
# several directories deep), and run the paired ineffective test against
# each one's dist_paired dir.
# ---------------------------------------------------------------------------

FAULTY_ELFS=()
while IFS= read -r -d '' f; do
    FAULTY_ELFS+=("$f")
done < <(find "$ELF_DIR" -type f -name '*.elf' -not -samefile "$CORRECT_ELF" -print0 | sort -z)

if [[ ${#FAULTY_ELFS[@]} -eq 0 ]]; then
    echo "[!] no faulty ELFs found under $ELF_DIR (besides $CORRECT_ELF)" >&2
    exit 1
fi
echo "[i] found ${#FAULTY_ELFS[@]} faulty ELF(s) under ${ELF_DIR}"

OVERALL_STATUS=0
for faulty_elf in "${FAULTY_ELFS[@]}"; do
    faulty_stem="$(rel_stem "$faulty_elf" "$ELF_DIR")"
    DIST_PAIRED_DIR="${OUT_DIR}/${faulty_stem}/dist_paired"

    n_sv=$(ls "${DIST_PAIRED_DIR}"/correct_sv*.json 2>/dev/null | wc -l)
    if [[ "$n_sv" -eq 0 ]]; then
        echo "[!] skipping ${faulty_stem}: no swept secret-value files found in $DIST_PAIRED_DIR" >&2
        echo "    (run collect_dist.sh for this faulty elf first)" >&2
        OVERALL_STATUS=1
        continue
    fi
    echo "[i] ${n_sv} correct_sv*.json files present in ${DIST_PAIRED_DIR}"

    INEFFECTIVE_PAIRED_OUT="${OUT_DIR}/${faulty_stem}/ineffective_paired_result.txt"
    mkdir -p "$(dirname "$INEFFECTIVE_PAIRED_OUT")"

    echo "=== ineffective (paired) test: ${FUNC_NAME} / ${faulty_stem} ==="
    python3 -u "${TEST_DIR}/ineffective_mayo.py" \
        --dist-dir "$DIST_PAIRED_DIR" \
        --out-buf "$OUT_BUF" \
        --active-len "$ACTIVE_LEN" \
        --out-word-size "$WORD_SIZE" \
        2>&1 | tee "$INEFFECTIVE_PAIRED_OUT"

    echo "=== done: ${FUNC_NAME} / ${faulty_stem} ==="
    echo "[i] ineffective (paired) test -> ${INEFFECTIVE_PAIRED_OUT}"
    echo ""
done

exit $OVERALL_STATUS