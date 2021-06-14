#!/bin/bash

#functions 

cust_Display ( )
{
    touch temp.txt
    rm temp.txt
    touch temp.txt
    while IFS=, read -r fname lname mobile Office
    do
        echo "$fname,$lname,$mobile,$Office" >> temp.txt
    done < contacts.csv

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
    echo "Entered cust_Search_And_Display ( )"
}

cust_Delete ( )
{
    echo "Entered cust_Delete ( )"
}

#Decision Tree - Main

case $1 in

    "-insert")
    ;;
    "-edit")
    ;;
    "-display")
        case $2 in
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
    "-search")
        case $2 in
            "-c")
            cust_Search_And_Display "$3" "$5"
            ;;
            "-v")
            cust_Search_And_Display "$5" "$3"
            ;;
            *)
            echo "Invalid Search and Display flag"
            ;;
        esac
    ;;
    "-delete")
        case $2 in
            "-c")
            cust_Delete "$3" "$5"
            ;;
            "-v")
            cust_Delete "$5" "$3"
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