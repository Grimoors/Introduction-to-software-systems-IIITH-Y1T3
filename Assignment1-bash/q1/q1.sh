#!/bin/bash
declare -l inputString
declare -l line
cat $1 > input1Copied.txt
touch q1_output.txt
rm q1_output.txt
touch q1_output.txt

while IFS= read -r line
do
    {  
        echo $line 
        declare -i length
        length=${#line}

        declare -l substr
        substr="${line:0:4}"

        declare -i hashLength
        hashLength=$length-5
        # echo $hashLength
        declare -l output
        if [ ${#line} -gt 4 ]
        then
            output=$substr
                for ((i=0;i<$hashLength;i++))
                do
                    output+='#'
                done

        else
            output=$substr
        fi 

        echo "$output" >> q1_output.txt
    }
done < $1

rm ./input1Copied.txt
