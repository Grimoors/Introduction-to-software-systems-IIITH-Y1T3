#!/bin/bash
declare -l inputString
declare -l output
if [ "$#" -ne 3 ]; 
    then
    {
        echo "You must enter exactly 3 command line arguments"
    }
  
    else
    {
        output=`echo "$1*$2*$3" | bc`
    }
    echo $output
fi