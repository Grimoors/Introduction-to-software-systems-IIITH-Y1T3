#!/bin/bash
echo "This is the Program for Q1"
echo "START"
echo

declare -l inputString
read -p "Enter var inputString: " inputString

echo "Input = " $inputString
echo
echo "Starting the Processing"

declare -i length
length=${#inputString}
echo "Length of '$inputString' is $length"   
echo

declare -l substr
substr="${inputString:0:4}"
echo "The First four or lesser characters are: '${substr}' "
echo "Total characters in Substring: ${#substr} "  
echo

declare -i hashLength
hashLength=$length-4
declare -l output
if [ ${#inputString} -gt 4 ]
then
    echo "The size of the string is greater that 4, We need to insert [[${hashLength}]] Hashes at the end "
    output=$substr
        for ((i=0;i<$hashLength;i++))
        do
            output+='#'
        done

else
    echo "The size of the string is less than or equal to 4, this is our final Answer"
    output=$substr
fi 

echo
echo "Processed"
echo
echo "Printing output"
echo "Output = $output"

echo "END"