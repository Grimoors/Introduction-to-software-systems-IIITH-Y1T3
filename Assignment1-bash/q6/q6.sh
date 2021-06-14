#!/bin/bash

#functions 
cust_Insert( )
{
    entry="$1,$2,$3,$4"
    echo $entry >> contacts.csv 
}
cust_Edit( )
{
    ./q6.sh -C delete -c lname -v "$1"
    ./q6.sh -C insert -f "$2" -l "$3" -n "$4" -o "$5"
}
cust_Display ( )
{
    touch temp.txt
    rm temp.txt
    touch temp.txt

    Num=$(cat "./temp.txt" | wc -l)
    Num=$(echo "$Num-1" | bc)

    while IFS=, read -r fname lname mobile Office
    do
        echo "$fname,$lname,$mobile,$Office" >> temp.txt
    done <<< "$(cat contacts.csv | tail -n $Num)"

    case $1 in
        "1")
            sort ./temp.txt
        ;;
        "0")
            sort -r ./temp.txt
        ;; 
    esac 
    rm temp.txt
}

cust_Search_And_Display ( )
{
    # echo "Entered cust_Search_And_Display ( )"
    
    case "$1" in 
        "fname")
            SearchColumn=1
        ;;
        "lname")
            SearchColumn=2
        ;;
        "mobile")
            SearchColumn=3
        ;;
        *) echo "invalid -c for search and display" 
        ;;
    esac 
    SearchValue=$2

    touch temp.txt
    rm temp.txt
    touch temp.txt

    while IFS=, read -r fname lname mobile Office
    do
        echo "$fname,$lname,$mobile,$Office" >> temp.txt
    done < contacts.csv

    touch temp2.txt
    rm temp2.txt
    touch temp2.txt

    find ./ -type f -name "temp.txt" -exec grep "$2"  {} \;

    rm temp.txt
    rm temp2.txt
}

cust_Delete ( )
{
    # echo "Entered cust_Delete ( )"
        case "$1" in 
        "fname")
            SearchColumn=1
        ;;
        "lname")
            SearchColumn=2
        ;;
        "mobile")
            SearchColumn=3
        ;;
        *) echo "invalid -c for search and display" 
        ;;
    esac 
    SearchValue=$2

    touch temp.txt
    rm temp.txt
    touch temp.txt

    while IFS=, read -r fname lname mobile Office
    do
        echo "$fname,$lname,$mobile,$Office" >> temp.txt
    done < contacts.csv

    touch temp2.txt
    rm temp2.txt
    touch temp2.txt

    rm contacts.csv

    N1=$(grep -n "$SearchValue" ./temp.txt)
    NT=$(cat temp.txt | wc -l)

    DelValue=$(find ./ -type f -name "temp.txt" -exec grep "$2"  {} \;)
    
    sed "/$DelValue/d" ./temp.txt >> contacts.csv
}

#Decision Tree - Main

case $2 in

    "insert")
        cust_Insert "$4" "$6" "$8" "${10}"
    ;;
    "edit")
        cust_Edit "$4" "$6" "$8" "${10}" "${12}"
    ;;
    "display")
        case $3 in
            "-a")
            cust_Display "1"
            ;;
            "-d")
            cust_Display "0"
            ;;
            *)
            echo "Invalid Display flag"
            ;;
        esac
        ;;
    "search")
        case $3 in
            "-c")
            cust_Search_And_Display "$4" "$6"
            ;;
            "-v")
            cust_Search_And_Display "$6" "$4"
            ;;
            *)
            echo "Invalid Search and Display flag"
            ;;
        esac
    ;;
    "delete")
        case $3 in
            "-c")
            cust_Delete "$4" "$6"
            ;;
            "-v")
            cust_Delete "$6" "$4"
            ;;
            *)
            echo "Invalid Delete flag"
            ;;
        esac
    ;;
    *)
    echo "Invalid -C flag"
    ;;

esac