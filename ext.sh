#!/bin/bash

ftypes=$(find . -type f | grep -E ".*\.[a-zA-Z0-9]*$" | sed -e 's/.*\(\.[a-zA-Z0-9]*\)$/\1/' | sort | uniq)

for ft in $ftypes
do
    echo -ne "$ft\t"
    find . -name "*${ft}" -exec du -bcsh '{}' + | tail -1 | sed 's/\stotal//'
done
