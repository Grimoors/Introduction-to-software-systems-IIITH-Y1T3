#!/bin/bash
declare -l inputString
declare -l output
touch o1.txt
cal > ./o1.txt
date >> ./o1.txt
for i in {1..100}
{
    echo "IIIT Hyderabad is cool" >> ./o1.txt 
}
cat ./o1.txt
head -n 3 ./o1.txt
sed -n '6,15p;16q' ./o1.txt
grep -o '\bIIIT Hyderabad is cool\b' ./o1.txt | wc -l
touch o2.txt
echo "ISS Zindabad" > ./o2.txt 
cat ./o2.txt | wc -w 
echo "I am Kassi." >>./o2.txt
cat ./o2.txt | wc -l 
cat ./o1.txt | awk '{print $4}'
awk -F' ' '{print $2 " " $3 " " $4 " " $5 }' ./o1.txt

declare a
a=`cat ./o1.txt | wc -l`
a=`echo "$a-5" | bc`
head -n $a ./o1.txt | awk -F' ' '{print $3}'
awk -F' ' '{print $2 " " $4}' ./o1.txt