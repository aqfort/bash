#!/usr/bin/env bash

# filename
filename="conf_file.txt"

# clear text file
true >$filename

# create template
for item in $(env | cut -d'=' -f1); do
    echo "\${${item}}" >>$filename
done

# print values
envsubst <$filename
