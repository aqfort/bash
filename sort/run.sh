#!/usr/bin/env bash

# shellcheck source="$(pwd)"/sort.sh
source "$(pwd)"/sort.sh

# variable with any name
declare -a ARR=(1 0 4 56 1 12)

echo "${ARR[@]}"
sort_array ARR
echo "${ARR[@]}"

# local variables of function
# are unavailable

echo "$_TMP"
echo "${_ARR[@]}"
