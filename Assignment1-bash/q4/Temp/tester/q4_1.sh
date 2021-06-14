#!/bin/bash

#input=$(cat "$1")
stopWords=$(cat "$2")
searchWord=$3

# DEBUG
#echo "This is the original input :  $input  "
cat "$1" > "$PWD"/input4Copied.txt
echo >> ./input4Copied.txt
#echo

# STEP 1: REMOVE STOP WORDS
echo "Trying to just remove stopwords"

# sed 's/('"$(tr '\n' '|' < &2)"')//g' ./input4Copied.txt > ./input4Copied.txt
for w in $stopWords
do
    {
        w=${w%$'\r'}   
        #echo "Finding: lala{$w}lala"
        #${input//$words }
        #find and replace $words with "" in inputBuffer4
        sed "s/[[:<:]]${w}[[:>:]]/ /g" input4Copied.txt > input4Copied1.txt
        mv input4Copied1.txt input4Copied.txt
        #tr -d "\b$words \b" < ./input4Copied.txt > input4Copied2.txt
    }
done

# echo
# echo "This is the output without stopwords"
# echo
#cat ./input4Copied.txt

# STEP 2: Calculate term frequency using the input search keyword against the input TXT file which is free from noise words

while IFS= read -r line; do
    line=${line%$' '}
    line=$(echo "$line" | sed -E 's/  */ /g')
    line=$(echo "$line" | sed -E 's/^ *//g')
    nw=$(wc -w <<< "$line")
    lw=$(echo "$line" | grep -o  "$searchWord"  | wc -l)
    ans=$(echo "result = $lw/$nw; scale=2; if(result < 1 && result > 0) print 0; result / 1" | bc -l)
    echo "$line", "$ans" >> output.txt

done < input4Copied.txt