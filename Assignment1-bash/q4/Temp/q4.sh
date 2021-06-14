#!/bin/bash
#declare -l inputBuffer4

#touch inputBuffer4.txt

#We use a temporary buffer file called ./inputBuffer4.txt
declare -l searchWord
declare -i searchWordFrequencyInInput
searchWord=$3
#reading the input to the temp input buffer
cat $1 > inputBuffer4.txt
chmod 777 ./inputBuffer4.txt

#part 1
for words in `cat $2`
do
    { 
        #find and replace $words with "" in inputBuffer4  
        sed -i "s/\b$words //g" ./inputBuffer4.txt
        sed -i "s/\b$words\b//g" ./inputBuffer4.txt

    }
#\bHello((\b)( \b))?
#"s/\b$words[ "\n"]\b//g"
done

#part 2
searchWordFrequencyInInput=`egrep "$searchWord" ./inputBuffer4.txt | wc -l`

#part 3
cat ./inputBuffer4.txt

echo $searchWordFrequencyInInput

cat ./inputBuffer4.txt
declare -i varNoOfValidWords
varNoOfValidWords=`cat ./inputBuffer4.txt | wc -w`
echo $varNoOfValidWords
declare -i calc
calc=$(echo "(1.00 * $searchWordFrequencyInInput) / $varNoOfValidWords"|bc)

echo $calc
