#!/bin/bash

FILES=$*

for file in $FILES; do
    base=$(basename $file)
    sum=$(awk '{s+=$1}END{print s}' $file)
    echo "Sum of counts $base = $sum"
done

