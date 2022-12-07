#!/usr/bin/env bash

echo -n "Enter number between 3 and 5: "

# read input value
read -r userinput

# symbol for printing diamond
symbol="."

# symbol for printing background
space=" "

# check input
if [[ $userinput -lt 3 || $userinput -gt 5 ]]; then
    echo "Bad input"
    exit 1
else
    for ((i = 1; i < userinput; i++)); do
        for ((j = userinput - i; j >= 0; j--)); do
            echo -n "$space"
        done
        for ((j = 0; j < i; j++)); do
            echo -n " $symbol"
        done
        echo ""
    done

    for ((i = userinput; i > 0; i--)); do
        for ((j = i; j <= userinput; j++)); do
            echo -n "$space"
        done
        for ((j = 0; j < i; j++)); do
            echo -n " $symbol"
        done
        echo ""
    done
fi
