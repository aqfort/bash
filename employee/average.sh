#!/usr/bin/env bash

awk 'BEGIN {FS = " "} ; $3 ~ /sales/ {sum+=$4; count++; print "sum =", sum, "salary =", $4, "count =", count } END{print ""; print "sum =", sum; print "count =", count; print "average =", sum/count}' employee.txt
