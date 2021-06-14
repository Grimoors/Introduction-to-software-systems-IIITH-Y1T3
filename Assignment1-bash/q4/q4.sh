#!/bin/bash


declare -l input
declare -l filteredInput
declare -l stopWords
declare -l searchWord
declare -l calc

declare -i wordsInLine
declare -i searchWordFrequencyInInput
declare -i NoOfValidWords


input=`cat $1`
stopWords=`cat $2`
searchWord=$3


#remove this later
# echo "This is the original input :  $input  "
cat $1 > $PWD/input4Copied.txt
echo >> ./input4Copied.txt
# echo

# echo "Trying to just remove stopwords"
        #${input//$words }
        #find and replace $words with "" in inputBuffer4  
                #tr -d "\b$words \b" < ./input4Copied.txt > input4Copied2.txt
# sed 's/('"$(tr '\n' '|' < &2)"')//g' ./input4Copied.txt > ./input4Copied.txt
for words in `cat $2`
do
    { 
        sed -i "s/\b$words \b//g" ./input4Copied.txt
        sed -i "s/\b$words\b//g" ./input4Copied.txt
    }
done
# # echo $input > ./input4Copied2.txt

while read -r line
do
   { 
    wordsInLine=0
    #remove this later
    # echo "$line"
    # echo "This is a line"
    wordsInLine=`echo $line | wc -w`
    # echo "there are $wordsInLine Words in this Line"
    # echo
    # for word in $line
    # do
    #     {
    #      #remove this later
    #      echo "$word"
    #      echo "This is a word"
         
    #     }
    # done
    #A lot more is left
    searchWordFrequencyInInput=`echo $line | grep -o "$searchWord" | wc -w`
    FinalAnswer=`echo "scale=2 ; $searchWordFrequencyInInput/$wordsInLine" | bc`
    echo "$line,$FinalAnswer"
   }
done < "./input4Copied.txt"




rm ./input4Copied.txt
