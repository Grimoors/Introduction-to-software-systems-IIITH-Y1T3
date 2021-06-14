#!/bin/bash
declare -i counter  
counter=0
for line in `egrep "([a-zA-Z]+ )+[0-3]?[0-9]\/[0-1]?[0-9]\/[0-9]{1,4}" $1`
do
    counter+=1
    echo $line $counter
    wordsInLine=`echo $line | wc -c`
    echo $wordsInLine 
done
