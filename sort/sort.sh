#!/usr/bin/env bash

# bubble sort function
function sort_array() {
    # reference to given array outside
    typeset -n _ARR="$1"

    # only in function
    local _TMP

    for ((i = 0; i < $((${#_ARR[@]} - 1)); i++)); do
        for ((j = ((i + 1)); j < ((${#_ARR[@]})); j++)); do
            if [[ ${_ARR[i]} -gt ${_ARR[j]} ]]; then
                _TMP=${_ARR[i]}
                _ARR[i]=${_ARR[j]}
                _ARR[j]=$_TMP
            fi
        done
    done
}
