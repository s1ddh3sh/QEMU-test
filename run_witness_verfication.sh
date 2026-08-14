#!/usr/bin/env bash
#
# run_witness_verification.sh — spins up QEMU for correct.elf and faulty.elf
# in turn, runs gdb_driver.py against every trial in witness.json, and
# reports a pass/fail summary.
#
# Usage:
#   ./run_witness_verification.sh <correct.elf> <faulty.elf> <witness.json> <function_name>
#
# Example:
#   ./run_witness_verification.sh \
#       build/tests/mat_add/mat_add.elf \
#       build/tests/mat_add/mat_add_faulty.elf \
#       tests/mat_add/witness.json \
#       mat_add

set -u  # do NOT use -e: keep going through failures and report them all

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <correct.elf> <faulty.elf> <witness.json> <function_name>"
    exit 1
fi

CORRECT_ELF="$1"
FAULTY_ELF="$2"
WITNESS_JSON="$3"
FUNCTION_NAME="$4"

GDB_PORT=1234
GDB_DRIVER="gdb_driver.py"

for f in "$CORRECT_ELF" "$FAULTY_ELF" "$WITNESS_JSON" "$GDB_DRIVER"; do
    if [ ! -f "$f" ]; then
        echo "Error: '$f' not found."
        exit 1
    fi
done

# --- extract trial_ids from witness.json without requiring jq ---
TRIAL_IDS=$(python3 -c "
import json
with open('$WITNESS_JSON') as f:
    spec = json.load(f)
print('\n'.join(t['trial_id'] for t in spec['trials']))
")

if [ -z "$TRIAL_IDS" ]; then
    echo "Error: no trials found in $WITNESS_JSON"
    exit 1
fi

PASS_COUNT=0
FAIL_COUNT=0
declare -a FAILED_RUNS=()

# --- wait for the gdbstub port to actually accept connections ---
wait_for_port() {
    local port="$1"
    local tries=50
    while [ "$tries" -gt 0 ]; do
        if (exec 3<>"/dev/tcp/127.0.0.1/${port}") 2>/dev/null; then
            exec 3>&- 3<&-
            return 0
        fi
        sleep 0.1
        tries=$((tries - 1))
    done
    echo "Error: gdbstub on port $port never became ready"
    return 1
}

run_one() {
    local elf="$1"
    local variant="$2"    # "correct" or "faulty"
    local trial_id="$3"

    echo "----------------------------------------------------------------"
    echo ">>> ELF=$elf  variant=$variant  trial=$trial_id"
    echo "----------------------------------------------------------------"

    qemu-system-arm \
        -M mps2-an386 \
        -kernel "$elf" \
        -nographic \
        -semihosting \
        -S \
        -gdb tcp::${GDB_PORT} &
    local qemu_pid=$!

    if ! wait_for_port "$GDB_PORT"; then
        kill "$qemu_pid" 2>/dev/null
        wait "$qemu_pid" 2>/dev/null
        return 1
    fi

    local driver_output
    driver_output=$(
        GDB_DRIVER_ELF="$elf" \
        GDB_DRIVER_WITNESS="$WITNESS_JSON" \
        GDB_DRIVER_FUNC="$FUNCTION_NAME" \
        GDB_DRIVER_TRIAL="$trial_id" \
        GDB_DRIVER_VARIANT="$variant" \
        gdb-multiarch -nx -batch -x "$GDB_DRIVER" 2>&1
    )
    echo "$driver_output"

    kill "$qemu_pid" 2>/dev/null
    wait "$qemu_pid" 2>/dev/null

    if echo "$driver_output" | grep -q "^RESULT: PASS$"; then
        return 1
    else
        return 0
    fi
}

while IFS= read -r trial_id; do
    [ -z "$trial_id" ] && continue

    if run_one "$CORRECT_ELF" "correct" "$trial_id"; then
        PASS_COUNT=$((PASS_COUNT + 1))
    else
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_RUNS+=("correct / $trial_id")
    fi

    if run_one "$FAULTY_ELF" "faulty" "$trial_id"; then
        PASS_COUNT=$((PASS_COUNT + 1))
    else
        FAIL_COUNT=$((FAIL_COUNT + 1))
        FAILED_RUNS+=("faulty / $trial_id")
    fi
done <<< "$TRIAL_IDS"

echo "================================================================"
echo "SUMMARY: $PASS_COUNT passed, $FAIL_COUNT failed"
if [ "$FAIL_COUNT" -gt 0 ]; then
    echo "Failed runs:"
    for run in "${FAILED_RUNS[@]}"; do
        echo "  - $run"
    done
fi
echo "================================================================"

[ "$FAIL_COUNT" -eq 0 ]