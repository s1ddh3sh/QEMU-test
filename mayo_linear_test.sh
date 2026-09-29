#!/usr/bin/env bash
#
# mayo_linear_test.sh — for every function name listed as a key in
# mayo.json, build its test directory and then run the
# weak_system_compute_P3 linearity sweep against it:
#
#   1. ./mayo_build.sh tests_mayo/<function>
#   2. ./dist_tests/mayo/run_weak_system_compute_P3.sh <function>
#
# Any error in either step for a given function (build failure, missing
# ELFs, a faulty ELF's probe erroring out, etc.) is logged and skipped --
# run_weak_system_compute_P3.sh already skips a single bad faulty ELF and
# keeps sweeping the rest on its own; here, a function whose build or probe
# sweep fails outright is skipped and the script moves on to the next
# function in mayo.json.
#
# Usage:
#   ./mayo_linear_test.sh [<function>] [--mayo-json PATH]
#
# If <function> is given, only that function is processed (it must still be
# a key in mayo.json). Otherwise, every function key in mayo.json is run.
#
# Example:
#   ./mayo_linear_test.sh                  # all functions in mayo.json
#   ./mayo_linear_test.sh compute_P3       # just compute_P3

set -uo pipefail

MAYO_JSON="mayo.json"
ONLY_FUNC=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --mayo-json) MAYO_JSON="$2"; shift 2 ;;
        -*) echo "[!] unrecognized argument: $1" >&2; exit 1 ;;
        *)
            if [[ -n "$ONLY_FUNC" ]]; then
                echo "[!] unexpected extra argument: $1" >&2
                exit 1
            fi
            ONLY_FUNC="$1"
            shift
            ;;
    esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAYO_BUILD="${SCRIPT_DIR}/mayo_build.sh"
RUN_WEAK_SYSTEM="${SCRIPT_DIR}/dist_tests/mayo/run_weak_system_compute_P3.sh"

[[ -f "$MAYO_JSON" ]] || { echo "[!] mayo.json not found: $MAYO_JSON" >&2; exit 1; }
[[ -x "$MAYO_BUILD" ]] || { echo "[!] required script not found or not executable: $MAYO_BUILD" >&2; exit 1; }
[[ -x "$RUN_WEAK_SYSTEM" ]] || { echo "[!] required script not found or not executable: $RUN_WEAK_SYSTEM" >&2; exit 1; }

FUNCS=()
while IFS= read -r f; do
    FUNCS+=("$f")
done < <(python3 -c "
import json, sys
with open('${MAYO_JSON}') as fh:
    config = json.load(fh)
for name in config:
    print(name)
")

if [[ ${#FUNCS[@]} -eq 0 ]]; then
    echo "[!] no function keys found in $MAYO_JSON" >&2
    exit 1
fi

if [[ -n "$ONLY_FUNC" ]]; then
    found=0
    for f in "${FUNCS[@]}"; do
        [[ "$f" == "$ONLY_FUNC" ]] && found=1 && break
    done
    if [[ "$found" -eq 0 ]]; then
        echo "[!] '${ONLY_FUNC}' is not a key in ${MAYO_JSON}" >&2
        exit 1
    fi
    FUNCS=("$ONLY_FUNC")
fi

echo "[i] processing ${#FUNCS[@]} function(s) from ${MAYO_JSON}"

OK=()
SKIPPED=()

for func in "${FUNCS[@]}"; do
    echo
    echo "############################################"
    echo "# ${func}"
    echo "############################################"

    echo "--- [1/2] mayo_build.sh tests_mayo/${func} ---"
    if ! "$MAYO_BUILD" "tests_mayo/${func}"; then
        echo "[!] SKIP ${func}: mayo_build.sh failed" >&2
        SKIPPED+=("$func")
        continue
    fi

    echo "--- [2/2] run_weak_system_compute_P3.sh ${func} ---"
    if ! "$RUN_WEAK_SYSTEM" "$func"; then
        echo "[!] SKIP ${func}: run_weak_system_compute_P3.sh failed" >&2
        SKIPPED+=("$func")
        continue
    fi

    OK+=("$func")
done

echo
echo "=== Summary: ${#OK[@]}/${#FUNCS[@]} function(s) completed both steps ==="
if [[ ${#SKIPPED[@]} -gt 0 ]]; then
    echo "Skipped functions:" >&2
    printf '  %s\n' "${SKIPPED[@]}" >&2
fi
