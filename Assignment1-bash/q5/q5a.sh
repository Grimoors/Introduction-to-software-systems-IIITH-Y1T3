#!/bin/bash


#Define Functions
cust_List_Dir (  ) 
{

find $1 -mindepth 0 -type d | while read -r dir; do printf "%s\t " "$(basename $dir)"; printf "%s" "$(find "$dir" -type f | wc -l)"; printf " file(s)\n"; done > ../temp1.txt
Num=$(cat "../temp1.txt" | wc -l)
Num=$(echo "$Num-1" | bc)
# echo $Num
while IFS= read -r line
do
{
    echo "$line"
    # Folder_Name=$(echo "$line" | awk '{ print $1 }' )
    # NextPath="$1/$Folder_Name"
    # cust_List_Dir "$NextPath"
    
}
done <<< $(cat ../temp1.txt | tail -n $Num)


rm ../temp1.txt
}
cust_List_File (  )
{
   du -ah "$1" | grep -v '\s/[^.]*$' | sort -rh > ../temp2.txt

    Num=$(cat "../temp2.txt" | wc -l)
Num=$(echo "$Num-1" | bc)

   while IFS= read -r line
    do
        {
            # echo $line 
            echo "$(basename $(echo $line | awk '{ print $2 }'))" | grep "\."
        }
    done <<< $(cat ../temp2.txt | tail -n $Num)

    rm ../temp2.txt
}

#Invoke Functions
if [ -z "$1" ]
then
    {
        # echo "Sending PWD to func"
        echo "Directories:"
        cust_List_Dir "$PWD"
        echo
        echo "Files:"
        cust_List_File "$PWD"
    }
else
    {
        dirPath="$1"
        # echo "Sending dirPath= $dirPath to func"
        echo "Directories:"
        cust_List_Dir "$dirPath"
        echo
        echo "Files:"
        cust_List_File "$dirPath"
    }
fi
