#!/bin/bash
echo "This is the Program for Q2"
echo "START"
declare -l inputString
declare -l output
echo
echo "Starting the Processing"
echo

for entry in "$PWD"/*
    do 
    echo "$(basename "$entry" | sed 's/\(.*\)\..*/\1/')"
    done

echo "Processed"
echo
echo "Printing output"
echo "Output = $output"

echo "END"


