#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 folder_prefix start_range end_range"
    exit 1
fi

# This is for and while loops

<< comment
 1 is argument 1 which is folder name
 2 is start range
 3 is end rangeask

comment

for (( num=$2 ; num<=$3; num++ ))
do
    mkdir "$1$num"
done

