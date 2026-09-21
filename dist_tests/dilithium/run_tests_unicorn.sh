#!/usr/bin/env bash
#
# run_tests_unicorn.sh — Unicorn-backed variant of run_tests.sh: the full
# paired-sweep pipeline for one Dilithium function, with calibration and
# collection run IN-PROCESS via the Unicorn Cortex-M4 emulator
# (dist_tests/common/unicorn_runner.py) instead of qemu-system-arm +
# gdb-multiarch. No qemu-system-arm/gdb-multiarch install is required to
# run this script.
#
#   1. calibrate_unicorn.py     (once for the function)
#   2. collect_dist_unicorn.sh  (once per faulty ELF: the paired secret sweep)
# Then, once for the whole function (each internally loops over every
# faulty ELF's collected sweep) -- these steps only read already-collected
# JSON from disk and have no QEMU/gdb dependency at all, so they are
# unchanged from run_tests.sh:
#   3. run_ineffective_paired.sh
#   4. run_correction_paired.sh
#
# Usage:
#   ./run_tests_unicorn.sh <func_name> [--secret-buf NAME] [--secret-pos POS] \
#       [--elf-dir DIR] [--fixed-scalars name1,name2,...] [--seed N] \
#       [--out-buf NAME] [--field-mod N] [--dilithium-mode 2|3|5]
#
# Only <func_name> is required. --secret-buf/--fixed-scalars are looked
# up automatically from <repo_root>/dilithium.json (keyed by func_name);
# an explicit --secret-buf/--fixed-scalars flag overrides that lookup.
# --field-mod, if not given, is left unset so it flows through to
# collect_dist_unicorn.sh/.py as "not passed", which then auto-derives it
# from --secret-buf's own declared distribution (see infer_field_mod() in
# distributions_unicorn.py) -- it is NOT invented here. --secret-pos
# defaults to 0.
#
# ELF layout assumed (default --elf-dir is build/tests_dilithium/<func_name>):
#   <elf-dir>/<func_name>.elf   -- the correct build
#   <elf-dir>/*.elf             -- every other .elf is a faulty variant,
#                                  tested one at a time
#
# Dilithium-specific vs. the Kyber version:
#   - dist_tests/dilithium, tests_dilithium, build/tests_dilithium.
#   - --field-mod (sweep step): auto-derived per above. It is NOT a field
#     modulus here: Dilithium's Q is 8380417 and coefficients are
#     int32_t, so FIELD_MOD only controls how many values --secret-pos is
#     swept through and the fallback fill range for inputs with no
#     declared distribution. The CALIBRATION step's own --field-mod
#     (structural probes only, distribution-agnostic) is unaffected by
#     this and keeps its own 256 default unless --field-mod is explicitly
#     passed, in which case that same value is used for both.
#   - --dilithium-mode (2/3/5, default 2) is forwarded to
#     collect_dist_unicorn.sh for distribution-aware background sampling.
#     trace.h only emits PRINT_ARGS under DILITHIUM_MODE == 2, so
#     witnesses are normally mode-2.
#   - --secret-pos is a BYTE offset and a coefficient is 4 bytes:
#     coefficient i's low byte is at 4*i.
#   - calibration runs here, unconditionally, exactly once per function,
#     before any faulty-ELF sweep -- collect_dist_unicorn.sh also has its
#     own (commented-out) calibrate step, but only reaches it if
#     active_lengths.json is still missing, so it never re-runs what this
#     script just did.
#
# Example:
#   ./run_tests_unicorn.sh pqcrystals_dilithium2_ref_poly_add
#   ./run_tests_unicorn.sh pqcrystals_dilithium2_ref_poly_add --secret-buf a --secret-pos 0

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <func_name> [--secret-buf NAME] [--secret-pos POS] [--elf-dir DIR] [--fixed-scalars n1,n2,...] [--seed N] [--out-buf NAME] [--field-mod N] [--dilithium-mode 2|3|5]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift

SECRET_POS=0
SETUP_DIR="dist_tests/dilithium/setup"
OUT_DIR="tests_dilithium/${FUNC_NAME}"
WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"
ELF_DIR="build/tests_dilithium/${FUNC_NAME}"
FIXED_SCALARS_OVERRIDE=""
SECRET_BUF_OVERRIDE=""
SEED=0
OUT_BUF_OVERRIDE=""
FIELD_MOD=""
DILITHIUM_MODE=2

while [[ $# -gt 0 ]]; do
    case "$1" in
        --secret-buf) SECRET_BUF_OVERRIDE="$2"; shift 2 ;;
        --secret-pos) SECRET_POS="$2"; shift 2 ;;
        --elf-dir) ELF_DIR="$2"; shift 2 ;;
        --fixed-scalars) FIXED_SCALARS_OVERRIDE="$2"; shift 2 ;;
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

# ---------------------------------------------------------------------------
# Resolve secret-buf/fixed-scalars: explicit flag wins, else look up
# dilithium.json[func_name] (repo-root-relative -- this script is always
# invoked from the repo root, same assumption OUT_DIR above already makes).
# ---------------------------------------------------------------------------
CONFIG_JSON="dilithium.json"
read -r JSON_SECRET_BUF JSON_FIXED_SCALARS <<< "$(python3 - "$CONFIG_JSON" "$FUNC_NAME" <<'PYEOF'
import json, sys
path, func = sys.argv[1], sys.argv[2]
try:
    with open(path) as f:
        config = json.load(f)
except FileNotFoundError:
    config = {}
entry = config.get(func) or {}
print(entry.get("secret-buf") or "__NONE__")
print(entry.get("fixed-scalars") or "__NONE__")
PYEOF
)"
[[ "$JSON_SECRET_BUF" == "__NONE__" ]] && JSON_SECRET_BUF=""
[[ "$JSON_FIXED_SCALARS" == "__NONE__" ]] && JSON_FIXED_SCALARS=""

if [[ -n "$SECRET_BUF_OVERRIDE" ]]; then
    SECRET_BUF="$SECRET_BUF_OVERRIDE"
elif [[ -n "$JSON_SECRET_BUF" ]]; then
    SECRET_BUF="$JSON_SECRET_BUF"
    echo "[i] secret-buf auto-resolved from ${CONFIG_JSON}: '${SECRET_BUF}'"
else
    echo "[!] no secret-buf for '${FUNC_NAME}': not found in ${CONFIG_JSON} and no --secret-buf given" >&2
    exit 1
fi

if [[ -n "$FIXED_SCALARS_OVERRIDE" ]]; then
    FIXED_SCALARS="$FIXED_SCALARS_OVERRIDE"
else
    FIXED_SCALARS="$JSON_FIXED_SCALARS"
fi

for req in collect_dist_unicorn.sh run_ineffective_paired.sh run_correction_paired.sh; do
    if [[ ! -x "${SCRIPT_DIR}/${req}" ]]; then
        echo "[!] required script not found or not executable: ${SCRIPT_DIR}/${req}" >&2
        echo "    (chmod +x it, or place it alongside run_tests_unicorn.sh)" >&2
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

echo "[i] function:      ${FUNC_NAME} [unicorn backend -- no qemu-system-arm/gdb-multiarch required]"
echo "[i] secret buf:    ${SECRET_BUF} (byte pos ${SECRET_POS}; coefficient i's low byte is at 4*i)"
echo "[i] dilithium mode: ${DILITHIUM_MODE}, field-mod ${FIELD_MOD:-<auto-derived from secret-buf distribution>}"
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
echo "########## [1/4] calibrate (unicorn): ${FUNC_NAME} ##########"
# Calibration's own --field-mod is an unrelated, distribution-agnostic
# structural-probe fill range (default 256, see calibrate_unicorn.py) --
# it only honors an explicit --field-mod override here; the sweep step's
# auto-derivation (Task B) is untouched by this.
python3 "${SETUP_DIR}/calibrate_unicorn.py" \
    --witness "$WITNESS" --elf "$CORRECT_ELF" \
    --field-mod "${FIELD_MOD:-256}" --machine mps2-an386 \
    --out "$ACTIVE_LENGTHS" --fixed-scalars "$FIXED_SCALARS"

# A calibrated length of 0 for the swept buffer means the FUT looked
# insensitive to every byte of it -- in practice a witness/binding
# problem, not a result. Stop here rather than burning field_mod*2 trials
# per faulty ELF on a sweep that cannot show anything.
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
# [2/4] collect_dist_unicorn.sh, once per faulty ELF
# ---------------------------------------------------------------------------
echo ""
echo "########## [2/4] collect_dist_unicorn.sh (${#FAULTY_ELFS[@]} faulty ELF(s)) ##########"
for faulty_elf in "${FAULTY_ELFS[@]}"; do
    echo ""
    echo "--- collect_dist (unicorn): ${FUNC_NAME} / $(basename "$faulty_elf") ---"
    COLLECT_ARGS=(
        "$FUNC_NAME" "$CORRECT_ELF" "$faulty_elf" "$SECRET_BUF"
        --secret-pos "$SECRET_POS"
        --fixed-scalars "$FIXED_SCALARS"
        --seed "$SEED"
        --dilithium-mode "$DILITHIUM_MODE"
    )
    if [[ -n "$FIELD_MOD" ]]; then
        COLLECT_ARGS+=(--field-mod "$FIELD_MOD")
    fi
    "${SCRIPT_DIR}/collect_dist_unicorn.sh" "${COLLECT_ARGS[@]}"
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
echo "=== pipeline complete (unicorn): ${FUNC_NAME} (${#FAULTY_ELFS[@]} faulty ELF(s)) ==="
echo "[i] per-faulty-ELF results under: tests_dilithium/${FUNC_NAME}/<faulty_elf_stem>/{ineffective,correction}_paired_result.txt"
