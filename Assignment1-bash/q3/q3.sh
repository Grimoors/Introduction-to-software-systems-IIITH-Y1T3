#!/bin/bash
# declare -l input
# declare -a Array1
# declare -a Array2
# declare -a Array3
# declare -a Array4
# declare -i i1
# declare -i i2
# declare -i i3
# declare -i i4

# for words in $input
# do
#     {
#         if [ "`echo ${words:0:1}`" == "s" ] && [ `echo ${words:1:1}` != "a" ]
#         then
#             {
#                 Array1[i1]=$words
#                 i1+=1
#             }
#         fi
#         if [ `echo ${words:0:1}` == "w" ] && [ `echo ${words:1:1}` == "h" ]
#         then
#             {
#                 Array2[i2]=$words
#                 i2+=1
#             }
#         fi
#         if [ `echo ${words:0:1}` == "t" ] && [ `echo ${words:1:1}` == "h" ]
#         then
#             {
#                 Array3[i3]=$words
#                 i3+=1
#             }
#         fi
#         if [ `echo ${words:0:1}` == "a" ] && [ `echo ${words:1:1}` != "n" ]
#         then
#             {
#                 Array4[i4]=$words
#                 i4+=1
#             }
#         fi
#     }
# done

# echo "1. Words -start with ‘s’ and is not follow by ‘a’"
# declare -i counter
# counter=0
# for words in $Array1
# do
#     {
#         printf "%s, " "$words"
#         counter+=1
#     }
# done
# echo
# echo "2. Word starts with ‘w’ and is followed by ‘h’"
# counter=0
# for (( counter=0; counter<i2; counter++ ))
# do
#     {
#         printf "%s, " "${Array2[counter]}"
#         counter+=1
#     }
# done
# echo
# echo "3. Word starts with ‘t’ and is followed by \‘h\’"
# counter=0
# for (( counter=0; counter<i3; counter++ ))
# do
#     {
#         printf "%s, " "${Array3[counter]}"
#         counter+=1
#     }
# done
# echo
# echo "4. Word starts with ‘a’ and is not followed by ‘n’"
# counter=0
# for (( counter=0; counter<i4; counter++ ))
# do
#     {
#         printf "%s, " "${Array4[counter]}"
#         counter+=1
#     }
# done
# echo

touch temp1.txt
rm temp1.txt
touch temp1.txt

touch temp2.txt
rm temp2.txt
touch temp2.txt

touch temp3.txt
rm temp3.txt
touch temp3.txt

touch temp4.txt
rm temp4.txt
touch temp4.txt

input=`cat $1`
echo "1. Words -start with ‘s’ and is not follow by ‘a’"
for words in $input
do
    {
        echo $words | egrep "\bs[^a].+\b" | tr -s "\n" " " | tr -s "\r" " " >> temp1.txt
        echo $words | egrep "\bwh.+\b" | tr -s "\n" " " | tr -s "\r" " " >> temp2.txt 
        echo $words | egrep "\bth.+\b" | tr -s "\n" " " | tr -s "\r" " " >> temp3.txt
        echo $words | egrep "\ba[^n].+\b" | tr -s "\n" " " | tr -s "\r" " " >> temp4.txt
    }
done
for word in $(cat ./temp1.txt)
do
{
    printf "%s " $word
}
done
echo
echo
echo "2. Word starts with ‘w’ and is followed by ‘h’"
for word in $(cat ./temp2.txt)
do
{
    printf "%s " $word
}
done
echo
echo
echo "3. Word starts with ‘t’ and is followed by ‘h’"

for word in $(cat ./temp3.txt)
do
{
    printf "%s " $word
}
done
echo
echo
echo "4. Word starts with ‘a’ and is not followed by ‘n’"

for word in $(cat ./temp4.txt)
do
{
    printf "%s " $word
}
done
echo



rm temp1.txt
rm temp2.txt
rm temp3.txt
rm temp4.txt