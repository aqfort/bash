#!/usr/bin/env bash

# create empty array
declare -a ARR

# add links to array
ARR+=("$(curl -s https://github.com/openwrt/routing | grep 'meta name="go-import"' | grep -m 1 -o -P 'http[^"]+')")
ARR+=("$(curl -s https://github.com/openwrt/mt76 | grep 'meta name="go-import"' | grep -m 1 -o -P 'http[^"]+')")
ARR+=("$(curl -s https://github.com/openwrt/luci | grep 'meta name="go-import"' | grep -m 1 -o -P 'http[^"]+')")
ARR+=("$(curl -s https://github.com/openwrt/packages| grep 'meta name="go-import"' | grep -m 1 -o -P 'http[^"]+')")
ARR+=("$(curl -s https://github.com/openwrt/openwrt | grep 'meta name="go-import"' | grep -m 1 -o -P 'http[^"]+')")

# check ARR content
# declare -p ARR

# exit 0

# print array
# printf "%s\n" "${ARR[@]}"

# size of array
# echo "${#ARR[@]}"

# delete temp directory
rm -rf temp

# create temp directory to work into
mkdir temp

# go into
cd temp || exit

for link in "${ARR[@]}"; do
    # clone without useless output
    git clone --quiet "${link}" >/dev/null
done

# go back
cd ..

# delete temp directory
rm -rf temp
