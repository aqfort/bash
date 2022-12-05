#!/usr/bin/env bash

# uid sum
sum=0

# uid count
count=0

# read output of /etc/passwd
while read -r line; do
    # find sum of uid
    sum=$((sum + "$(echo "$line" | cut -d: -f3)"))
    # find count of uid
    count=$((count + 1))
done </etc/passwd

# find average of uid
echo "scale=2; $sum / $count" | bc

# alternative version
# awk -F: '{sum+=$3;} END{print NR, sum/NR;}' /etc/passwd
