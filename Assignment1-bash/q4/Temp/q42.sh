#!/bin/bash
#declare -l inputBuffer4

cat $1 
cat $3

#touch inputBuffer4.txt

#We use a temporary buffer file called ./inputBuffer4.txt
declare -l searchWord
declare -i searchWordFrequencyInInput
searchWord=$3
#reading the input to the temp input buffer
cat $1 > inputBuffer4.txt
#part 1
for words in `cat $2`
do
    { 
        echo $words
        tester="$words"
        #find and replace $words with "" in inputBuffer4  
        sed -i "s|`echo $tester`||g" inputBuffer4.txt
        
        sed -i "s|"\b$words\b"||g" ./inputBuffer4.txt

        sed -i "s|$words||g" ./inputBuffer4.txt

    }
#\bHello((\b)( \b))?
#"s/\b$words[ "\n"]\b//g"
done

#part 2
searchWordFrequencyInInput=`egrep "$searchWord" ./inputBuffer4.txt | wc -l`

#part 3
cat ./inputBuffer4.txt

echo $searchWordFrequencyInInput


declare -i varNoOfValidWords
varNoOfValidWords=`cat ./inputBuffer4.txt | wc -w`
declare -l calc
calc=$(echo "$searchWordFrequencyInInput + $varNoOfValidWords"|bc)

echo calc

