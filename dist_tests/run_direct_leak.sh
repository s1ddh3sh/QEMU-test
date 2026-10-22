#!/usr/bin/env bash
#
# run_direct_leak.sh -- run the direct-leak test (dist_tests/direct_leak.py:
# do the output positions a fault changes now hold the secret-buf, or else
# an eph_secret, at the same index?) for
#
#   1. one function:          ./dist_tests/run_direct_leak.sh <scheme> <func>
#   2. every function of one scheme (all keys of <scheme>.json):
#                             ./dist_tests/run_direct_leak.sh <scheme>
#   3. every function of every scheme (mayo.json, kyber.json, dilithium.json):
#                             ./dist_tests/run_direct_leak.sh
#
# <scheme> is mayo, kyber or dilithium. Run from the repo root.
#
# Options (after the positional arguments):
#   --traces N   existing trace pairs to use per faulty ELF, taken round-robin
#                over its collected directories (0 = all). Default 16.
#   --csv PATH   summary CSV, one row per faulty ELF, in generic_tests_plot.py's
#                schema. Default direct_leak_report.csv. Not overwritten: the
#                rows of each function tested are replaced in place (or
#                appended if new); other functions' rows are kept.
#   --elf-timeout SECS   per faulty ELF: no verdict within SECS -> recorded as
#                "timeout" and the next ELF is tested. Default 120 (0 = none).
#   --func-timeout SECS  per function: the whole function is killed after SECS,
#                reported as timed out and skipped; the ELFs it finished keep
#                their CSV rows. Default 1800 (0 = none).
#
# Before testing a function, any ELF missing for a .ll under
# tests_<scheme>/<func>/ is built with ./<scheme>_build.sh tests_<scheme>/<func>.
#
# Each faulty ELF's verdict is also written to
#   tests_<scheme>/<func>/<faulty_stem>/direct_leak_result.txt
# A function that fails (no correct ELF, not in the json, ...) is reported
# and skipped; the script exits non-zero if any function failed.

set -uo pipefail

SCHEMES_ALL=(mayo kyber dilithium)
SCHEME=""
FUNC=""
TRACES=16
CSV="direct_leak_report.csv"
ELF_TIMEOUT=120
FUNC_TIMEOUT=1800

POSITIONAL=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        --traces) TRACES="$2"; shift 2 ;;
        --csv) CSV="$2"; shift 2 ;;
        --elf-timeout) ELF_TIMEOUT="$2"; shift 2 ;;
        --func-timeout) FUNC_TIMEOUT="$2"; shift 2 ;;
        -h|--help) sed -n '2,34p' "$0"; exit 0 ;;
        --*) echo "[!] unrecognized option: $1" >&2; exit 1 ;;
        *) POSITIONAL+=("$1"); shift ;;
    esac
done
[[ ${#POSITIONAL[@]} -ge 1 ]] && SCHEME="${POSITIONAL[0]}"
[[ ${#POSITIONAL[@]} -ge 2 ]] && FUNC="${POSITIONAL[1]}"
if [[ ${#POSITIONAL[@]} -gt 2 ]]; then
    echo "Usage: $0 [<scheme> [<func>]] [--traces N] [--csv PATH] [--elf-timeout SECS] [--func-timeout SECS]" >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEST_PY="${SCRIPT_DIR}/direct_leak.py"

if [[ -n "$SCHEME" ]]; then
    case "$SCHEME" in
        mayo|kyber|dilithium) SCHEMES=("$SCHEME") ;;
        *) echo "[!] unknown scheme '$SCHEME' (mayo, kyber, dilithium)" >&2; exit 1 ;;
    esac
else
    SCHEMES=("${SCHEMES_ALL[@]}")
fi

# Build the function's ELFs if any are missing: every .ll under
# tests_<scheme>/<func>/ should have its ELF at build/tests_<scheme>/<func>/
# (same relative path, .elf). If one is missing, ./<scheme>_build.sh is run
# from the repo root on that function directory, which compiles every .ll
# in it. Returns non-zero if the build fails.
ensure_elfs() {
    local scheme="$1" func="$2" dir="tests_$1/$2" missing=0 ll
    if [[ ! -d "$dir" ]]; then
        echo "[!] ${dir} not found: nothing to build" >&2
        return 1
    fi
    while IFS= read -r -d '' ll; do
        if [[ ! -f "build/${ll%.ll}.elf" ]]; then
            missing=$((missing + 1))
        fi
    done < <(find -L "$dir" -type f -name '*.ll' -print0)
    [[ "$missing" -eq 0 ]] && return 0
    if [[ ! -x "./${scheme}_build.sh" ]]; then
        echo "[!] ${missing} ELF(s) missing for ${scheme}/${func} and ./${scheme}_build.sh not found" >&2
        return 1
    fi
    echo "[i] ${missing} ELF(s) missing for ${scheme}/${func}: running ./${scheme}_build.sh ${dir}"
    "./${scheme}_build.sh" "$dir"
}

# Function keys of <scheme>.json, one per line.
functions_of() {
    python3 - "$1.json" <<'PYEOF'
import json, sys
for name in json.load(open(sys.argv[1])):
    print(name)
PYEOF
}

FAILED=()
TIMED_OUT=()
N_RUN=0
for scheme in "${SCHEMES[@]}"; do
    if [[ -n "$FUNC" ]]; then
        FUNCS=("$FUNC")
    else
        [[ -f "${scheme}.json" ]] || { echo "[!] ${scheme}.json not found (run from the repo root)" >&2; exit 1; }
        mapfile -t FUNCS < <(functions_of "$scheme")
    fi
    echo ""
    echo "################ ${scheme}: ${#FUNCS[@]} function(s) ################"
    for func in "${FUNCS[@]}"; do
        echo ""
        echo "=== direct-leak test: ${scheme} / ${func} ==="
        if ! ensure_elfs "$scheme" "$func"; then
            echo "[!] build failed for ${scheme}/${func}; testing whatever ELFs exist" >&2
        fi
        # timeout 0 = no limit (coreutils semantics).
        timeout --signal=TERM --kill-after=10 "$FUNC_TIMEOUT" \
            python3 -u "$TEST_PY" --scheme "$scheme" --func "$func" \
                --traces "$TRACES" --csv "$CSV" --elf-timeout "$ELF_TIMEOUT"
        status=$?
        if [[ $status -eq 0 ]]; then
            N_RUN=$((N_RUN + 1))
        elif [[ $status -eq 124 || $status -eq 137 ]]; then
            echo "[!] TIMED OUT after ${FUNC_TIMEOUT}s: ${scheme}/${func} -- skipped, moving on to the next function" >&2
            TIMED_OUT+=("${scheme}/${func}")
        else
            FAILED+=("${scheme}/${func}")
        fi
    done
done

echo ""
echo "=== direct-leak test complete: ${N_RUN} function(s) run, ${#TIMED_OUT[@]} timed out, ${#FAILED[@]} failed ==="
if [[ -s "$CSV" ]]; then
    python3 - "$CSV" <<'PYEOF'
import csv, sys, collections
rows = list(csv.DictReader(open(sys.argv[1])))
by = collections.defaultdict(collections.Counter)
for r in rows:
    by[r["scheme"]][r["detected"]] += 1
for scheme, c in by.items():
    print(f"[i] {scheme}: {c['yes']} detected / {sum(c.values())} faulty ELF(s) "
          f"(no {c['no']}, timeout {c['timeout']}, skipped {c['skip']}, "
          f"error {c['error']})")
PYEOF
    echo "[i] summary CSV (all functions in it, not only this run): ${CSV}"
fi
for f in "${TIMED_OUT[@]}"; do
    echo "[!] timed out: $f" >&2
done
for f in "${FAILED[@]}"; do
    echo "[!] failed: $f" >&2
done
[[ ${#FAILED[@]} -eq 0 ]]
