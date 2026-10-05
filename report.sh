#!/usr/bin/env bash
#
# report.sh — scan the test folders and record which tests detected each fault.
#   tests_kyber/, tests_dilithium/: one test_result.txt per fault folder;
#       "[+] INEFFECTIVE hit" -> ineffective test detected
#       "[+] CORRECTION hit"  -> correction test detected
#   tests_mayo/: correction_paired_result.txt / ineffective_paired_result.txt;
#       a "pos N: X/Y pairs disagree" line -> that test detected
# Produces a report grouped by project -> function -> fault folder.
#
# Usage:
#   ./report.sh [outfile.md]

set -euo pipefail

OUTFILE="${1:-fault_detection_report.md}"
PATTERN_INEFF='^\[\+\] INEFFECTIVE hit'
PATTERN_CORR='^\[\+\] CORRECTION hit'
PATTERN_MAYO='pos [0-9]+: [0-9]+/[0-9]+ pairs disagree'
ROOTS=(tests_mayo tests_kyber tests_dilithium)
SEP='|'   # plain, visible delimiter -- avoids the \t vs $'\t' quoting bug

declare -A DETECTED   # key: project|func|fault|kind -> "1"
declare -A SEEN_FAULT # key: project|func|fault        -> "1"
declare -A SEEN_FUNC  # key: project|func              -> "1"

for root in "${ROOTS[@]}"; do
    [[ -d "$root" ]] || continue

    for func_dir in "$root"/*/; do
        [[ -d "$func_dir" ]] || continue
        func_name="$(basename "$func_dir")"
        SEEN_FUNC["${root}${SEP}${func_name}"]=1

        while IFS= read -r -d '' resfile; do
            parent_dir="$(dirname "$resfile")"
            if [[ "$(realpath "$parent_dir")" == "$(realpath "$func_dir")" ]]; then
                fault_name="(root)"
            else
                fault_name="$(basename "$parent_dir")"
            fi

            SEEN_FAULT["${root}${SEP}${func_name}${SEP}${fault_name}"]=1

            if [[ "$root" == "tests_mayo" ]]; then
                case "$(basename "$resfile")" in
                    ineffective_paired_result.txt) kind="ineffective" ;;
                    correction_paired_result.txt)  kind="correction"  ;;
                    *) continue ;;
                esac
                if grep -Eq "$PATTERN_MAYO" "$resfile" 2>/dev/null; then
                    DETECTED["${root}${SEP}${func_name}${SEP}${fault_name}${SEP}${kind}"]=1
                fi
                continue
            fi

            if grep -Eq "$PATTERN_INEFF" "$resfile" 2>/dev/null; then
                DETECTED["${root}${SEP}${func_name}${SEP}${fault_name}${SEP}ineffective"]=1
            fi
            if grep -Eq "$PATTERN_CORR" "$resfile" 2>/dev/null; then
                DETECTED["${root}${SEP}${func_name}${SEP}${fault_name}${SEP}correction"]=1
            fi
        done < <(find "$func_dir" -type f \
                    \( -name "test_result.txt" \
                       -o -name "ineffective_paired_result.txt" \
                       -o -name "correction_paired_result.txt" \) \
                    -print0)
    done
done

# ---------------------------------------------------------------------------
# Render report
# ---------------------------------------------------------------------------

{
    echo "# Fault Detection Report"
    echo
    echo "Generated $(date -u '+%Y-%m-%d %H:%M UTC')."
    echo
    echo "Mayo: a \`${PATTERN_MAYO}\` line in the paired result files means detection."
    echo "Kyber/Dilithium: a \`[+] INEFFECTIVE hit\` / \`[+] CORRECTION hit\` line in a"
    echo "fault's \`test_result.txt\` means that test detected the fault."
    echo

    for root in "${ROOTS[@]}"; do
        [[ -d "$root" ]] || continue

        any_func=0
        for key in "${!SEEN_FUNC[@]}"; do
            [[ "$key" == "${root}${SEP}"* ]] && any_func=1 && break
        done
        [[ "$any_func" -eq 1 ]] || continue

        echo "## ${root}"
        echo

        mapfile -t funcs < <(
            for key in "${!SEEN_FUNC[@]}"; do
                r="${key%%${SEP}*}"
                f="${key#*${SEP}}"
                [[ "$r" == "$root" ]] && echo "$f"
            done | sort
        )

        for func in "${funcs[@]}"; do
            echo "### ${func}"
            echo

            mapfile -t faults < <(
                for key in "${!SEEN_FAULT[@]}"; do
                    r="${key%%${SEP}*}"
                    rest="${key#*${SEP}}"
                    f="${rest%%${SEP}*}"
                    fl="${rest#*${SEP}}"
                    [[ "$r" == "$root" && "$f" == "$func" ]] && echo "$fl"
                done | sort
            )

            if [[ "${#faults[@]}" -eq 0 ]]; then
                echo "_No result files found._"
                echo
                continue
            fi

            echo "| Fault | Correction test | Ineffective test |"
            echo "|---|---|---|"
            for fault in "${faults[@]}"; do
                corr_key="${root}${SEP}${func}${SEP}${fault}${SEP}correction"
                ineff_key="${root}${SEP}${func}${SEP}${fault}${SEP}ineffective"
                corr_mark="—"
                ineff_mark="—"
                [[ -n "${DETECTED[$corr_key]+x}" ]] && corr_mark="✅"
                [[ -n "${DETECTED[$ineff_key]+x}" ]] && ineff_mark="✅"
                echo "| \`${fault}\` | ${corr_mark} | ${ineff_mark} |"
            done
            echo
        done
    done

    echo "## Summary"
    echo
    total_faults="${#SEEN_FAULT[@]}"
    total_corr=0
    total_ineff=0
    for key in "${!DETECTED[@]}"; do
        [[ "$key" == *"${SEP}correction" ]] && total_corr=$((total_corr+1))
        [[ "$key" == *"${SEP}ineffective" ]] && total_ineff=$((total_ineff+1))
    done
    echo "- Fault folders scanned: **${total_faults}**"
    echo "- Correction-test detections: **${total_corr}**"
    echo "- Ineffective-test detections: **${total_ineff}**"

} > "$OUTFILE"

echo "[+] wrote ${OUTFILE}"
cat "$OUTFILE"