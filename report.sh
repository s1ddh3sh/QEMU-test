#!/usr/bin/env bash
#
# report.sh — scan tests_mayo/ and tests_kyber/ for correction_paired_result.txt
# and ineffective_paired_result.txt files, detect which ones show at least one
# position with a "pos N: X/Y pairs disagree" line, and produce a report
# grouped by project -> function -> fault folder.
#
# Usage:
#   ./report.sh [outfile.md]

set -euo pipefail

OUTFILE="${1:-fault_detection_report.md}"
PATTERN='pos [0-9]+: [0-9]+/[0-9]+ pairs disagree'
ROOTS=(tests_mayo tests_kyber)
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
            base="$(basename "$resfile")"
            case "$base" in
                ineffective_paired_result.txt) kind="ineffective" ;;
                correction_paired_result.txt)  kind="correction"  ;;
                *) continue ;;
            esac

            parent_dir="$(dirname "$resfile")"
            if [[ "$(realpath "$parent_dir")" == "$(realpath "$func_dir")" ]]; then
                fault_name="(root)"
            else
                fault_name="$(basename "$parent_dir")"
            fi

            SEEN_FAULT["${root}${SEP}${func_name}${SEP}${fault_name}"]=1

            if grep -Eq "$PATTERN" "$resfile" 2>/dev/null; then
                DETECTED["${root}${SEP}${func_name}${SEP}${fault_name}${SEP}${kind}"]=1
            fi
        done < <(find "$func_dir" -type f \
                    \( -name "ineffective_paired_result.txt" -o -name "correction_paired_result.txt" \) \
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
    echo "Detection pattern: \`${PATTERN}\` — presence means at least one"
    echo "output position showed \`X/Y pairs disagree\` with \`X > 0\` in the"
    echo "corresponding paired test's result file."
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