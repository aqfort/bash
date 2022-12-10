#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    cat <<EOF

usage: ./iperf.sh "test_duration"

format:
test_duration: 5

test_duration in seconds

result in res.txt

EOF
    exit 0
fi

TEST_SECONDS=$1

IPERF=iperf3
PORT=????

IP=??????????????????

# IP=$(ip addr show | grep -o inet.*brd | grep -o -P "\d+.\d+.\d+.\d+")
# PORT=$(ip addr show | grep -o inet.*brd | grep -o -P "/\d+" | grep -o -P "\d+")

# echo IP: "$IP"
# echo PORT: "$PORT"

CLIENT_CMD="$IPERF -c $IP -p $PORT -t $TEST_SECONDS"
SERVER_CMD="$IPERF -1 -s -p $PORT"

ssh ????????@?????????????????? "$SERVER_CMD; exit"

# echo ""

sleep 5

$CLIENT_CMD >res.txt

for job in $(jobs -p); do
    wait "$job"
done

exit 0

# --logfile res.txt
