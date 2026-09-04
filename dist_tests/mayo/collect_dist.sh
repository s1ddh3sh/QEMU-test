#!/usr/bin/env bash
#
# collect_dist.sh — calibrate, then run the single-background paired
# secret sweep (32 runs for GF(16): 16 values x 2 variants) for use with
# ineffective_paired_test.py's raw (s1,s2) pair comparison.
#
# Output is scoped per faulty ELF, since a function directory can contain
# several distinct faulty builds (different fault sites/models) sharing
# one correct build:
#   tests_mayo/<func_name>/<faulty_elf_stem>/dist_paired/
#
# Some faulty ELFs (memory-related load/store-skip faults in particular)
# can cause GDB/QEMU to hang indefinitely rather than error out cleanly --
# e.g. a corrupted pointer dereference that never returns control. This
# script wraps the collection step in `timeout`, running it in its own
# process group so a hang can be killed cleanly (including any orphaned
# qemu-system-arm/gdb-multiarch children), and exits with a nonzero status
# WITHOUT aborting under `set -e` in a way that leaves stray processes
# behind -- so a caller looping over many faulty ELFs can safely move on
# to the next one.
#
# Usage:
#   ./collect_dist.sh <func_name> <correct_elf> <faulty_elf> <secret_buf> \
#       --secret-pos POS [--fixed-scalars name1,name2,...] [--seed N] \
#       [--timeout SECONDS]

set -uo pipefail
# NOTE: deliberately NOT using `set -e` at the top level anymore -- the
# collection step's exit status is handled explicitly below so a timeout
# or GDB failure can be reported and cleaned up rather than the script
# dying mid-cleanup.

if [[ $# -lt 4 ]]; then
    echo "Usage: $0 <func_name> <correct_elf> <faulty_elf> <secret_buf> --secret-pos POS [--fixed-scalars name1,name2,...] [--seed N] [--timeout SECONDS]" >&2
    exit 1
fi

FUNC_NAME="$1"; shift
CORRECT_ELF="$1"; shift
FAULTY_ELF="$1"; shift
SECRET_BUF="$1"; shift

SECRET_POS=""
FIXED_SCALARS=""
SEED=0
TIMEOUT_SECS=120   # per-collection wall-clock cap; adjust if legitimate
                    # sweeps for large functions routinely exceed this

while [[ $# -gt 0 ]]; do
    case "$1" in
        --secret-pos) SECRET_POS="$2"; shift 2 ;;
        --fixed-scalars) FIXED_SCALARS="$2"; shift 2 ;;
        --seed) SEED="$2"; shift 2 ;;
        --timeout) TIMEOUT_SECS="$2"; shift 2 ;;
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

if [[ ! -f "$CORRECT_ELF" ]]; then
    echo "[!] correct ELF not found: $CORRECT_ELF" >&2
    exit 1
fi
if [[ ! -f "$FAULTY_ELF" ]]; then
    echo "[!] faulty ELF not found: $FAULTY_ELF" >&2
    exit 1
fi

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

ELF_BASE_DIR="$(dirname "$CORRECT_ELF")"
FAULTY_STEM="$(rel_stem "$FAULTY_ELF" "$ELF_BASE_DIR")"
DIST_PAIRED_DIR="${OUT_DIR}/${FAULTY_STEM}/dist_paired"

mkdir -p "$OUT_DIR"

# ---------------------------------------------------------------------------
# Cleanup: kill anything left over from a hung/killed collection run.
# GDB/QEMU spawned for THIS invocation are the only ones we want to touch;
# matching on the specific ELF paths keeps this from clobbering unrelated
# concurrent runs, if any.
# ---------------------------------------------------------------------------
cleanup_stale_processes() {
    pkill -9 -f "qemu-system-arm.*${MACHINE}.*$(basename "$CORRECT_ELF")" 2>/dev/null || true
    pkill -9 -f "qemu-system-arm.*${MACHINE}.*$(basename "$FAULTY_ELF")" 2>/dev/null || true
    # Fallback: anything still squatting on the GDB port this pipeline
    # always uses (tcp::1234) blocks every subsequent ELF's collection,
    # so clear it unconditionally rather than trying to name-match GDB's
    # own process (its argv doesn't reliably contain the ELF path).
    fuser -k 1234/tcp 2>/dev/null || true
}

echo "=== collect_dist: ${FUNC_NAME} / $(basename "$FAULTY_ELF") ==="

# Run the collection step in its own process group (setsid) so `timeout`
# can reliably terminate the whole tree -- python3, gdb-multiarch, and
# qemu-system-arm -- rather than just the immediate python3 process,
# which would otherwise leave qemu/gdb running and the GDB port occupied.
set +e
timeout --signal=TERM --kill-after=10 "$TIMEOUT_SECS" \
    setsid python3 "${SETUP_DIR}/collect_dist.py" \
        --witness "$WITNESS" --active-lengths "$ACTIVE_LENGTHS" \
        --correct-elf "$CORRECT_ELF" --faulty-elf "$FAULTY_ELF" \
        --func "$FUNC_NAME" --field-mod "$FIELD_MOD" \
        --secret-buf "$SECRET_BUF" --secret-pos "$SECRET_POS" --seed "$SEED" \
        --outdir "$DIST_PAIRED_DIR" --machine "$MACHINE" \
        --fixed-scalars "$FIXED_SCALARS"
STATUS=$?
set -e

cleanup_stale_processes

if [[ "$STATUS" -eq 124 || "$STATUS" -eq 137 ]]; then
    echo "[!] TIMED OUT after ${TIMEOUT_SECS}s: ${FUNC_NAME} / $(basename "$FAULTY_ELF")" >&2
    echo "    (likely a hung GDB/QEMU session -- e.g. a memory load/store" >&2
    echo "     fault leaving the target in an unrecoverable state)" >&2
    exit 124
elif [[ "$STATUS" -ne 0 ]]; then
    echo "[!] FAILED (exit ${STATUS}): ${FUNC_NAME} / $(basename "$FAULTY_ELF")" >&2
    exit "$STATUS"
fi

echo "=== done: ${FUNC_NAME} / $(basename "$FAULTY_ELF") ==="
echo "[i] next: python3 dist_tests/mayo/ineffective_paired_test.py \\"
echo "         --dist-dir ${DIST_PAIRED_DIR} --out-buf <OUT_BUF> --active-len <ACTIVE_LEN>"

exit 0