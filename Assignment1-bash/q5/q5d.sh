#!/bin/bash


#Define Functions
cust_List_Dir (  ) 
{
    echo "Entered Func"
    # for entry in $(ls $1)
    # do
    #     {
    #         echo "Entered Func with $1"
    #         echo "$(basename "$entry" | sed 's/(.)../\$1/')"
    #     }
    # done
    # find $1 -type d -print0 | xargs -0 -n1 bash -c 'echo -n "$1, "; ls -1 "$1" | wc -l' -- > tempFile1.txt
    # find $1 -type d -print0 | xargs -0 -n1 bash -c 'echo -n "$1, "; ls -1 "$1" | wc -l' -- > tempFile1.txt
    # cat ./tempFile1.txt | awk '{ print $1" "$2" file(s)" }'
    # rm ./tempFile1.txt 
    while IFS= read -r "$({ find "$1" -mindepth 2 -type f | cut -d/ -f2 | sort && find "$1" -maxdepth 1 -type f | cut -d/ -f1; } | uniq -c | sort -nr)" line
    do
    {
        if [ "$(echo "$line" | awk '{print $2;}')" == "." ]
        then
        {
            break 
        }
        else
        {
            echo $line
            echo $line | awk '{print $" "$1" file(s)";}'
            cust_List_Dir "$1/$(echo "$line" | awk '{print $2;}')"
        }
        fi
    }
    done
}
cust_List_File (  )
{
   du -ah $1 | grep -v '\s/[^.]*$' | sort -rh 
}

#Invoke Functions
if [ -z "$1" ]
then
    {
        echo "Sending PWD to func"
        cust_List_Dir "$PWD"
        cust_List_File "$PWD"
    }
else
    {
        dirPath="$1"
        echo "Sending dirPath= $dirPath to func"

        cust_List_Dir "$dirPath"
    }
fi
