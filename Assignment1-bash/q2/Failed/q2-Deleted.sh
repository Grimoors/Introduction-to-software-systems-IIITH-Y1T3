#!/bin/bash
echo "This is the Program for Q2"
echo "START"
declare -l inputString
declare -i outputArraySize
outputArraySize=`ls | wc -l`
declare modiEntry
echo
echo "Starting the Processing"
echo
declare output[$outputArraySize]
declare -i counter
counter=0

for entry in "$PWD"/*
    do 
    modiEntry="$(basename "$entry" | sed 's/\(.*\)\..*/\1/')"
    echo $modiEntry
    if [ ${#modiEntry} -gt 2 ]
    then
    {
        if [ $modiEntry == "(\w )+ \d{2}/\d{2}/\d{4}" ]
        then
        {
            echo "It Is A file with the expected Name Formant"
            output[i]=$modiEntry
            i+=1
        }
        else
        {
            echo "It is NOT A file with the expected Name Formant"
        }
        fi
    }
    else
    {
        echo "It has only one string entry"
    }
    fi
    done


echo "Processed"
echo
echo "Printing output"
echo "Output = $output[i]"

echo "END"
 

# THIS DOES NOT WORK CAUSE : Names cannot have '/' in them. 