#!/usr/bin/env bash
#
# run_combined_unicorn.sh — Unicorn-backed variant of run_combined.sh:
# runs early_stop_sweep_unicorn.py for one Kyber function against EVERY
# faulty ELF found alongside the correct one, taking only the function
# name. The correct ELF, the set of faulty ELFs, the output buffer, word
# size, diff mode, field-mod, and module rank are all auto-derived;
# override flags are available for the cases where an auto-pick is
# wrong.
#
# This is the RECOMMENDED entry point for the Unicorn backend: it
# early-stops as soon as a disagreeing (ineffective/correction) pair is
# found, runs entirely IN-PROCESS via dist_tests/common/unicorn_runner.py,
# and needs no qemu-system-arm/gdb-multiarch install.
# run_tests_unicorn.sh (the full exhaustive field-mod sweep) remains
# available for when a complete domain scan is specifically wanted;
# ordinarily this script should be used instead.
#
# Usage:
#   ./run_combined_unicorn.sh <func_name> \
#       [--secret-buf NAME] [--fixed-scalars name1,name2,...] \
#       [--elf-dir DIR] [--secret-pos POS] [--secret-word-size 1|2] \
#       [--field-mod N] [--out-buf NAME] [--out-word-size 1|2|4] \
#       [--diff-mode xor|mod-sub] [--modulus N] \
#       [--test ineffective|correction|both] [--require any|all] \
#       [--seed N] [--kyber-k 2|3|4]
#
# Example:
#   ./run_combined_unicorn.sh pqcrystals_kyber768_ref_poly_tomsg
#
# NOTE: func_name is the function's full/mangled symbol name (e.g.
# pqcrystals_kyber768_ref_poly_tomsg), matching both the tests_kyber/
# <func_name> witness directory and (via rel_stem, same convention as
# collect_dist_unicorn.sh/run_tests_unicorn.sh) each faulty ELF's
# dist_paired output directory.
#
# ELF discovery (same convention as run_tests_unicorn.sh):
#   --elf-dir DIR   defaults to build/tests_kyber/<func_name>.
#   correct ELF     ${ELF_DIR}/${func_name}.elf -- must exist.
#   faulty ELFs     every OTHER *.elf found anywhere under ELF_DIR
#                   (recursively -- faulty builds are not necessarily
#                   immediate siblings of the correct ELF, e.g.
#                   binOpFault/*_opA.elf), swept in turn.
#
# <func_name> is now the ONLY required positional argument (like
# run_tests_unicorn.sh). --secret-buf/--fixed-scalars are resolved from
# <repo_root>/kyber.json (keyed by func_name) unless explicitly
# overridden via --secret-buf/--fixed-scalars.
#
# What's auto-derived and how (once, reused for every faulty ELF, since
# these depend only on the function/witness, not on which fault is
# injected):
#   --secret-buf/--fixed-scalars
#                  looked up from kyber.json[func_name] unless an
#                  explicit override flag is given (same resolution/
#                  error-message convention as run_tests_unicorn.sh).
#   --secret-pos   0 (byte/word offset within --secret-buf, per
#                  --secret-word-size).
#   --secret-word-size
#                  2 if --secret-buf's distribution is R_q-shaped
#                  (Kyber's int16_t poly.coeffs, per infer_field_mod()'s
#                  recognition of the distribution in
#                  distributions_unicorn.py), so --secret-pos is treated
#                  as a COEFFICIENT index and the override value is
#                  written as a full signed int16_t rather than just
#                  overwriting one byte of it; 1 (plain byte override)
#                  otherwise. Independent of --out-word-size, since the
#                  secret and output buffers can be shaped differently
#                  (e.g. poly_tomsg's R_q-shaped 'a' input vs its
#                  byte-string 'msg' output).
#   --out-buf      first role:output entry in the witness layout.
#   --active-len   OUT_BUF's own full declared length from the witness --
#                  NOT the secret buffer's calibrated active length. The
#                  point of this sweep is to scan the WHOLE output for a
#                  divergent position, so it isn't bounded by how far the
#                  secret buffer's sensitivity was calibrated to extend.
#   --out-word-size / --diff-mode
#                  from OUT_BUF's witness entry: a scalar uses its own
#                  declared byte width; an R_q-shaped "distribution" is
#                  word-size 2 / mod-sub (Kyber's int16_t coefficients);
#                  anything else is word-size 1 / xor.
#   --field-mod    derived via infer_field_mod(dist_name) from
#                  distributions_unicorn.py -- the SAME single source of
#                  truth collect_dist_unicorn.py's own sweep mode uses,
#                  instead of a second, independently-maintained
#                  POLY_DISTRIBUTIONS table (avoids the two lists
#                  drifting apart).
#   --kyber-k      parsed from func_name's kyber512/768/1024 substring
#                  (2/3/4 respectively), defaulting to 3 if absent --
#                  only affects KYBER_ETA1 background sampling.

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <func_name> [--secret-buf NAME] [--fixed-scalars n1,n2,...] [--elf-dir DIR] [--secret-pos POS] [--secret-word-size 1|2] [--field-mod N] [--out-buf NAME] [--out-word-size 1|2|4] [--diff-mode xor|mod-sub] [--modulus N] [--test ineffective|correction|both] [--require any|all] [--seed N] [--kyber-k 2|3|4]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift

ELF_DIR_OVERRIDE=""
SECRET_BUF_OVERRIDE=""
FIXED_SCALARS_OVERRIDE=""
SECRET_POS=0
SECRET_WORD_SIZE_OVERRIDE=""
FIELD_MOD_OVERRIDE=""
OUT_BUF_OVERRIDE=""
WORD_SIZE_OVERRIDE=""
DIFF_MODE_OVERRIDE=""
MODULUS=3329
TEST=both
REQUIRE=all
SEED=0
KYBER_K_OVERRIDE=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --elf-dir) ELF_DIR_OVERRIDE="$2"; shift 2 ;;
        --secret-buf) SECRET_BUF_OVERRIDE="$2"; shift 2 ;;
        --fixed-scalars) FIXED_SCALARS_OVERRIDE="$2"; shift 2 ;;
        --secret-pos) SECRET_POS="$2"; shift 2 ;;
        --secret-word-size) SECRET_WORD_SIZE_OVERRIDE="$2"; shift 2 ;;
        --field-mod) FIELD_MOD_OVERRIDE="$2"; shift 2 ;;
        --out-buf) OUT_BUF_OVERRIDE="$2"; shift 2 ;;
        --out-word-size) WORD_SIZE_OVERRIDE="$2"; shift 2 ;;
        --diff-mode) DIFF_MODE_OVERRIDE="$2"; shift 2 ;;
        --modulus) MODULUS="$2"; shift 2 ;;
        --test) TEST="$2"; shift 2 ;;
        --require) REQUIRE="$2"; shift 2 ;;
        --seed) SEED="$2"; shift 2 ;;
        --kyber-k) KYBER_K_OVERRIDE="$2"; shift 2 ;;
        *) echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
    esac
done

# ---------------------------------------------------------------------------
# Path setup. NOTE: this must come before any [[ -f ... ]] checks -- under
# `set -u`, referencing WITNESS/etc. before assignment is a hard error,
# not an empty-string check (same ordering note as collect_dist_unicorn.sh).
# ---------------------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="dist_tests/kyber/setup"
MACHINE=mps2-an386
OUT_DIR="tests_kyber/${FUNC_NAME}"
WITNESS="${OUT_DIR}/qemu_witness.json"
ACTIVE_LENGTHS="${OUT_DIR}/active_lengths.json"
ELF_DIR="${ELF_DIR_OVERRIDE:-build/tests_kyber/${FUNC_NAME}}"
CORRECT_ELF="${ELF_DIR}/${FUNC_NAME}.elf"

[[ -d "$ELF_DIR" ]] || { echo "[!] elf dir not found: $ELF_DIR" >&2; exit 1; }
[[ -f "$CORRECT_ELF" ]] || { echo "[!] correct ELF not found: $CORRECT_ELF" >&2; exit 1; }
[[ -f "$WITNESS" ]] || { echo "[!] qemu_witness.json not found: $WITNESS (run extract_qemu_witness.py first)" >&2; exit 1; }

# ---------------------------------------------------------------------------
# Resolve secret-buf/fixed-scalars: explicit flag wins, else look up
# kyber.json[func_name] (repo-root-relative -- this script is always
# invoked from the repo root, same assumption OUT_DIR above already
# makes). Mirrors run_tests_unicorn.sh's resolution/error-message
# convention exactly.
# ---------------------------------------------------------------------------
CONFIG_JSON="kyber.json"
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

# ---------------------------------------------------------------------------
# Discover every faulty ELF anywhere under ELF_DIR (faulty builds are not
# necessarily immediate children of the correct ELF -- can be nested
# several directories deep, e.g. binOpFault/*_opA.elf), same convention
# as run_tests_unicorn.sh.
# ---------------------------------------------------------------------------
FAULTY_ELFS=()
while IFS= read -r -d '' f; do
    FAULTY_ELFS+=("$f")
done < <(find "$ELF_DIR" -type f -name '*.elf' -not -path '*/full_kyber_gated/*' -not -samefile "$CORRECT_ELF" -print0 | sort -z)

if [[ ${#FAULTY_ELFS[@]} -eq 0 ]]; then
    echo "[!] no faulty ELFs found under $ELF_DIR (besides $CORRECT_ELF)" >&2
    exit 1
fi

# ---------------------------------------------------------------------------
# rel_stem: path of a faulty ELF relative to ELF_DIR, minus the .elf
# suffix -- same convention collect_dist_unicorn.sh/run_tests_unicorn.sh
# use for the dist_paired output directory, so results from this script
# and from the full-sweep pipeline live side by side.
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
# Every derivation below reads the witness once and prints
# "OUT_BUF ACTIVE_LEN WORD_SIZE DIFF_MODE FIELD_MOD SECRET_WORD_SIZE" on
# one line, so the whole auto-pick is one python invocation. secret_buf
# is validated here too (must exist in the witness layout). --field-mod
# and the R_q-shaped classification are both derived by calling
# infer_field_mod() from distributions_unicorn.py directly (the SAME
# table collect_dist_unicorn.py's own sweep mode uses), rather than
# re-implementing a second POLY_DISTRIBUTIONS/is_poly_dist() copy here.
# ---------------------------------------------------------------------------
derive_all() {
    python3 - "$WITNESS" "$SECRET_BUF" "$OUT_BUF_OVERRIDE" \
             "$WORD_SIZE_OVERRIDE" "$DIFF_MODE_OVERRIDE" "$FIELD_MOD_OVERRIDE" \
             "$SECRET_WORD_SIZE_OVERRIDE" <<'PYEOF'
import json, os, sys

# This heredoc runs as a stdin script (`python3 -`), so there is no real
# __file__ to derive the repo root from -- rely on the same assumption
# the rest of this script already makes (invoked from the repo root,
# see OUT_DIR above) and just add the current directory.
REPO_ROOT = os.path.abspath(".")
sys.path.insert(0, REPO_ROOT)

from dist_tests.kyber.setup.distributions_unicorn import infer_field_mod

(witness_path, secret_buf, out_override,
 word_override, diff_override, field_override,
 secret_word_size_override) = sys.argv[1:8]

with open(witness_path) as f:
    layout = json.load(f)["layout"]

def is_poly_dist(name):
    # infer_field_mod() returns 256 (the generic byte fallback) for
    # anything NOT R_q/coefficient-shaped -- comparing against that
    # default classifies a distribution name without a second,
    # separately-maintained POLY_DISTRIBUTIONS table.
    return bool(name) and infer_field_mod(name) != 256

# --- secret buffer: validate the given argument -------------------------
if secret_buf not in layout:
    print(f"[!] --secret-buf '{secret_buf}' not in witness layout "
          f"(available: {sorted(layout.keys())})", file=sys.stderr)
    sys.exit(1)
secret_spec = layout[secret_buf]

# --- output buffer: first role:output entry ----------------------------
if out_override:
    out_buf = out_override
    if out_buf not in layout:
        print(f"[!] --out-buf '{out_buf}' not in witness layout "
              f"(available: {sorted(layout.keys())})", file=sys.stderr)
        sys.exit(1)
else:
    outs = [n for n, s in layout.items() if s.get("role") == "output"]
    if not outs:
        print("[!] could not auto-derive --out-buf: no role:output entry "
              "found in the witness layout. Pass --out-buf NAME "
              "explicitly.", file=sys.stderr)
        sys.exit(1)
    if len(outs) > 1:
        print(f"[!] multiple output-role entries found: {outs}; "
              f"defaulting to the first ({outs[0]}). Pass --out-buf NAME "
              f"to pick a different one.", file=sys.stderr)
    out_buf = outs[0]

out_spec = layout[out_buf]

# --- active-len: OUT_BUF's own full declared length ---------------------
active_len = out_spec["length"]

# --- word-size / diff-mode: from OUT_BUF's witness entry ----------------
if word_override and diff_override:
    word_size, diff_mode = int(word_override), diff_override
else:
    out_dist = out_spec.get("output_distribution") or out_spec.get("distribution")
    if out_spec.get("type") == "scalar":
        length = out_spec.get("length", 1)
        auto_word_size = length if length in (1, 2, 4) else 1
        auto_diff_mode = "xor"
    elif is_poly_dist(out_dist):
        auto_word_size = 2
        auto_diff_mode = "mod-sub"
    else:
        auto_word_size = 1
        auto_diff_mode = "xor"
    word_size = int(word_override) if word_override else auto_word_size
    diff_mode = diff_override if diff_override else auto_diff_mode

# --- field-mod: single source of truth is infer_field_mod() -------------
if field_override:
    field_mod = int(field_override)
else:
    field_mod = infer_field_mod(secret_spec.get("distribution"))

# --- secret-word-size: how the override AT --secret-pos is encoded -----
# Mirrors the word-size derivation above but keyed on the SECRET buffer,
# not the output buffer -- these are unrelated: a byte-string output can
# still be fed by an R_q-shaped secret (e.g. poly_tomsg's msg output vs
# its 'a' input), so out-word-size and secret-word-size must be derived
# independently. An R_q-shaped secret distribution means poly.coeffs is
# int16_t, so word-size 2 forces a whole coefficient at --secret-pos (a
# coefficient/word INDEX, not a byte offset) rather than only overriding
# its low byte -- see driver_dist.py's word-aware
# GDB_DRIVER_OVERRIDE_WORD_SIZE and collect_dist_unicorn.py's run_one()
# 'word_size' parameter, which this feeds.
if secret_word_size_override:
    secret_word_size = int(secret_word_size_override)
elif is_poly_dist(secret_spec.get("distribution")):
    secret_word_size = 2
else:
    secret_word_size = 1

print(f"{out_buf} {active_len} {word_size} {diff_mode} {field_mod} {secret_word_size}")
PYEOF
}

read -r OUT_BUF ACTIVE_LEN WORD_SIZE DIFF_MODE FIELD_MOD SECRET_WORD_SIZE <<< "$(derive_all)"

# --- module rank: parse from func_name's kyberNNN substring -------------
if [[ -n "$KYBER_K_OVERRIDE" ]]; then
    KYBER_K="$KYBER_K_OVERRIDE"
elif [[ "$FUNC_NAME" == *kyber512* ]]; then
    KYBER_K=2
elif [[ "$FUNC_NAME" == *kyber1024* ]]; then
    KYBER_K=4
else
    KYBER_K=3  # covers kyber768 and any name without an explicit variant
fi

echo "[i] func:        ${FUNC_NAME} [unicorn backend -- no qemu-system-arm/gdb-multiarch required]"
echo "[i] secret-buf:  ${SECRET_BUF} (pos ${SECRET_POS}, word-size ${SECRET_WORD_SIZE})"
echo "[i] out-buf:     ${OUT_BUF} (active-len ${ACTIVE_LEN} bytes, word-size ${WORD_SIZE}, diff-mode ${DIFF_MODE})"
echo "[i] field-mod:   ${FIELD_MOD}, kyber-k: ${KYBER_K}"
echo "[i] elf-dir:     ${ELF_DIR}"
echo "[i] correct elf: ${CORRECT_ELF}"
echo "[i] faulty elfs: ${#FAULTY_ELFS[@]} found"
for f in "${FAULTY_ELFS[@]}"; do
    echo "                 - ${f#${ELF_DIR}/}"
done
if [[ "$FIELD_MOD" -gt 100000 ]]; then
    echo "[!] field-mod=${FIELD_MOD} is a full coefficient-domain sweep;" >&2
    echo "    a fault with NO detectable hit will run to completion at" >&2
    echo "    that many trials (x2 for correct+faulty). Early stopping" >&2
    echo "    usually terminates far sooner in practice -- see the module" >&2
    echo "    docstring in early_stop_sweep_unicorn.py." >&2
fi

# ---------------------------------------------------------------------------
# [1/2] calibrate, once for the function -- ALWAYS run, before the
# per-faulty-ELF loop below. Every faulty ELF shares the same
# active_lengths.json (it's a property of the correct build's input
# sensitivity, not of any particular fault), so this must run exactly
# once per function, never once per faulty ELF. Uses FIELD_MOD derived
# above, so calibration probes over the same domain the sweep itself
# will use.
# ---------------------------------------------------------------------------
echo ""
echo "########## [1/2] calibrate (unicorn): ${FUNC_NAME} ##########"
python3 "${SETUP_DIR}/calibrate_unicorn.py" \
    --witness "$WITNESS" --elf "$CORRECT_ELF" \
    --field-mod "$FIELD_MOD" --machine mps2-an386 \
    --out "$ACTIVE_LENGTHS" --fixed-scalars "$FIXED_SCALARS"

# ---------------------------------------------------------------------------
# [2/2] Run the early-stop sweep for every discovered faulty ELF, reusing
# the parameters derived once above (they depend only on the function/
# witness, not on which fault is injected). Each fault's full output is
# tee'd to its own result file, and a compact DETECTED/not detected
# summary table is printed at the end so many faults can be scanned at a
# glance without re-reading every log.
# ---------------------------------------------------------------------------
echo ""
echo "########## [2/2] early_stop_sweep_unicorn.py (${#FAULTY_ELFS[@]} faulty ELF(s)) ##########"
declare -a SUMMARY_ROWS=()
OVERALL_STATUS=0

for FAULTY_ELF in "${FAULTY_ELFS[@]}"; do
    FAULTY_STEM="$(rel_stem "$FAULTY_ELF" "$ELF_DIR")"
    DIST_PAIRED_DIR="${OUT_DIR}/${FAULTY_STEM}/dist_paired"
    mkdir -p "$DIST_PAIRED_DIR"

    RESULT_FILE="${OUT_DIR}/${FAULTY_STEM}/test_result.txt"
    mkdir -p "$(dirname "$RESULT_FILE")"

    echo ""
    echo "=== early-stop sweep (unicorn): ${FUNC_NAME} / ${FAULTY_STEM} ==="
    set +e
    python3 -u "${SCRIPT_DIR}/early_stop_sweep_unicorn.py" \
        --witness "$WITNESS" --active-lengths "$ACTIVE_LENGTHS" \
        --correct-elf "$CORRECT_ELF" --faulty-elf "$FAULTY_ELF" \
        --func "$FUNC_NAME" --field-mod "$FIELD_MOD" --kyber-k "$KYBER_K" \
        --secret-buf "$SECRET_BUF" --secret-pos "$SECRET_POS" \
        --secret-word-size "$SECRET_WORD_SIZE" --seed "$SEED" \
        --outdir "$DIST_PAIRED_DIR" --machine "$MACHINE" \
        --fixed-scalars "$FIXED_SCALARS" \
        --out-buf "$OUT_BUF" --active-len "$ACTIVE_LEN" \
        --out-word-size "$WORD_SIZE" --diff-mode "$DIFF_MODE" \
        --modulus "$MODULUS" --test "$TEST" --require "$REQUIRE" \
        2>&1 | tee "$RESULT_FILE"
    STATUS=${PIPESTATUS[0]}
    set -e
    if [[ $STATUS -ne 0 ]]; then
        OVERALL_STATUS=1
    fi

    INEFF_STATUS="-"
    CORR_STATUS="-"
    if grep -q "^\[RESULT\] ineffective test: DETECTED" "$RESULT_FILE"; then
        INEFF_STATUS="DETECTED"
    elif grep -q "^\[RESULT\] ineffective test:" "$RESULT_FILE"; then
        INEFF_STATUS="not detected"
    fi
    if grep -q "^\[RESULT\] correction test: DETECTED" "$RESULT_FILE"; then
        CORR_STATUS="DETECTED"
    elif grep -q "^\[RESULT\] correction test:" "$RESULT_FILE"; then
        CORR_STATUS="not detected"
    fi
    SUMMARY_ROWS+=("${FAULTY_STEM}|${INEFF_STATUS}|${CORR_STATUS}")

    echo "=== done: ${FUNC_NAME} / ${FAULTY_STEM} ==="
    echo "[i] result -> ${RESULT_FILE}"
done

echo ""
echo "########## summary: ${FUNC_NAME} (${#FAULTY_ELFS[@]} faulty ELF(s)) ##########"
printf "%-55s %-15s %-15s\n" "FAULTY ELF" "INEFFECTIVE" "CORRECTION"
for row in "${SUMMARY_ROWS[@]}"; do
    IFS='|' read -r stem ineff corr <<< "$row"
    printf "%-55s %-15s %-15s\n" "$stem" "$ineff" "$corr"
done

exit $OVERALL_STATUS
