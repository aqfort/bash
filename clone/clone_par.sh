#!/usr/bin/env bash

# create empty array
declare -a ARR

# add links to array
ARR+=("https://github.com/openwrt/packages.git")
ARR+=("https://github.com/openwrt/luci.git")
ARR+=("https://github.com/openwrt/mt76.git")
ARR+=("https://github.com/openwrt/openwrt.git")
ARR+=("https://github.com/openwrt/routing.git")
# ARR+=("https://github.com/openwrt/firmware-selector-openwrt-org.git")
# ARR+=("https://github.com/openwrt/telephony.git")
# ARR+=("https://github.com/openwrt/packages-abandoned.git")
# ARR+=("https://github.com/openwrt/video.git")
# ARR+=("https://github.com/openwrt/bcm63xx-cfe.git")

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
    git clone --quiet "${link}" >/dev/null &
done

for job in $(jobs -p); do
    # barrier
    wait "$job"
done

# go back
cd ..

# delete temp directory
rm -rf temp
