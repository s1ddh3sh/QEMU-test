#!/usr/bin/env bash
#
# run_tests_all.sh — build and run the full Unicorn early-stop pipeline
# for EVERY Dilithium function listed in dilithium.json.
#
# For each function in dilithium.json, in order:
#   1. ./dilithium_build.sh tests_dilithium/<function>   (build the correct + faulty ELFs)
#   2. ./dist_tests/dilithium/run_combined_unicorn.sh <function> --seeds 0,1,2,3 --fresh
#
# Like run_combined_unicorn.sh, this script must be run from the repo
# root (dilithium.json and dilithium_build.sh are repo-root-relative).
#
# Usage:
#   ./dist_tests/dilithium/run_tests_all.sh
#
# A single function's failure (build or test) does not stop the sweep --
# it is recorded and reported in the summary at the end, and the script
# exits non-zero if anything failed.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_JSON="dilithium.json"
DILITHIUM_BUILD="./dilithium_build.sh"
RUN_COMBINED="${SCRIPT_DIR}/run_combined_unicorn.sh"
SEEDS="0,1,2,3"

if [[ ! -f "$CONFIG_JSON" ]]; then
    echo "[!] ${CONFIG_JSON} not found -- run this script from the repo root" >&2
    exit 1
fi

if [[ ! -x "$DILITHIUM_BUILD" ]]; then
    echo "[!] ${DILITHIUM_BUILD} not found or not executable -- run this script from the repo root" >&2
    exit 1
fi

if [[ ! -x "$RUN_COMBINED" ]]; then
    echo "[!] required script not found or not executable: ${RUN_COMBINED}" >&2
    exit 1
fi

mapfile -t FUNCS < <(python3 -c "
import json, sys
with open('${CONFIG_JSON}') as f:
    print('\n'.join(json.load(f).keys()))
")

if [[ "${#FUNCS[@]}" -eq 0 ]]; then
    echo "[!] no functions found in ${CONFIG_JSON}" >&2
    exit 1
fi

echo "[i] found ${#FUNCS[@]} function(s) in ${CONFIG_JSON}"

FAILED=()
for func in "${FUNCS[@]}"; do
    echo
    echo "############################################"
    echo "# ${func}"
    echo "############################################"

    echo
    echo "=== [build] ${DILITHIUM_BUILD} tests_dilithium/${func} ==="
    if ! "$DILITHIUM_BUILD" "tests_dilithium/${func}"; then
        echo "[!] FAILED (build): ${func}" >&2
        FAILED+=("${func} (build)")
        continue
    fi

    echo
    echo "=== [test] ${RUN_COMBINED} ${func} --seeds ${SEEDS} --fresh ==="
    if ! "$RUN_COMBINED" "$func" --seeds "$SEEDS" --fresh; then
        echo "[!] FAILED (test): ${func}" >&2
        FAILED+=("${func} (test)")
        continue
    fi

    echo "[i] OK: ${func}"
done

echo
echo "=== Summary: $((${#FUNCS[@]} - ${#FAILED[@]}))/${#FUNCS[@]} function(s) completed successfully ==="
if [[ "${#FAILED[@]}" -gt 0 ]]; then
    echo "Failed:" >&2
    printf '  %s\n' "${FAILED[@]}" >&2
    exit 1
fi
