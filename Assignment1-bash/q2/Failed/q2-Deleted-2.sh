#!/bin/bash
echo "This is the Program for Q2"
echo "START"

outputArraySize=$(find . | wc -l)

echo
echo "Starting the Processing"
echo


# for entry in "$PWD"/*
#     do 
#     modiEntry="$(basename "$entry" | sed 's/\(.*\)\..*/\1/')"
#     echo $modiEntry
#     if [ ${#modiEntry} -gt 2 ]
#     then
#     {
#         if [ $modiEntry == "(\w )+ \d{2}/\d{2}/\d{4}" ]
#         then
#         {
#             echo "It Is A file with the expected Name Formant"
#             output[i]=$modiEntry
#             i+=1
#         }
#         else
#         {
#             echo "It is NOT A file with the expected Name Formant"
#         }
#         fi
#     }
#     else
#     {
#         echo "It has only one string entry"
#     }
#     fi
#     done

declare -i wordsInLine

for entry in "$PWD"/*
    do
    
    if [ $(cat "$entry" | wc -l) -eq 1 ]
        then
            wordsInLine=$(cat "$entry" | wc -w)
            if [ $wordsInLine -gt 1 ]
                then
                    cat "$entry" | awk '{ 
                        if ( $"$wordsInLine" -eq "[0-9]{2}\/[0-9]{2}\/[0-9]{4}" )
                        {
                            print "This File $entry has contents Matching input format."
                        }
                     }'
            fi
    fi

    done


echo "Processed"
echo
echo "Printing output"
echo "Output = $output"

echo "END"
 
