#!/usr/bin/env bash

if [ $# -ne 3 ]; then
    cat <<EOF

usage: ./log.sh "UUID" "date" "interval"

format:
UUID: cdf39dad-3618-4722-a16f-73706c7eb274
date: 2022-09-15 21:02:55
interval: 1

logs should be in "./source" durectory

supported date formats:
2022-09-15 21:02:55
2022-09-15T21:02:55
15/Sep/2022 21:02:55

EOF

    exit 0
fi

echo ""
echo "UUID: $1"
echo "date: $2"
echo "interval: $3"
echo ""

UUID=$1
INTERVAL=$3

# original format:
# 2022-09-15 21:02:55

NEW_DATE=$(date "+%Y-%m-%d %H:%M:%S" -d "$2")
NEW_DATE=$(date "+%Y-%m-%d %H:%M:%S" --date="$NEW_DATE $INTERVAL sec ago")

# array of required dates in given interval
declare -a DATES
DATES+=("$NEW_DATE")

for ((i = 0; i < 2 * "$INTERVAL"; i++)); do
    NEW_DATE=$(date "+%Y-%m-%d %H:%M:%S" --date="$NEW_DATE sec")
    DATES+=("$NEW_DATE")
done

# another formats
# 2022-09-15T21:02:55
# 15/Sep/2022 21:02:55

# array of required dates in given interval
# in another formats because we have
# different styles in different logs
declare -a DATES_T
declare -a DATES_F

for item in "${DATES[@]}"; do
    DATES_T+=("$(date "+%Y-%m-%dT%H:%M:%S" -d "$item")")
    DATES_F+=("$(date "+%d/%b/%Y %H:%M:%S" -d "$item")")
done

# declare -p DATES
# declare -p DATES_T
# declare -p DATES_F

declare -a LOGS

# array of logs
for item in source/*; do
    LOGS+=("${item}")
done

# need to overwrite output
rm -rf res || true
mkdir res

# find required log lines
for ((i = 0; i < ${#DATES[@]}; i++)); do
    for item in "${LOGS[@]}"; do
        grep "$UUID" <"${item}" | grep -E "${DATES[i]}|${DATES_T[i]}|${DATES_F[i]}" >>res/"${item#'source/'}" || true &
    done
done

for job in $(jobs -p); do
    wait "$job"
done

exit 0
