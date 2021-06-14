#!/bin/bash
cat $1 > input2Copied.txt

touch ./q2_output.txt
rm ./q2_output.txt
touch ./q2_output.txt

while read -r line
do
    { 
        wordsInLine=$(echo "$line" | wc -w)
        # echo $line
        # echo $wordsInLine
        #I amtrying to find the last Column, which would be $wordsInLine

        
        BdayOfPerson=$(echo "$line" | awk '{ print $NF ; }')
        # echo "$BdayOfPerson"
        name=$(echo "${line/$BdayOfPerson}")
        # echo $name
        BdayNum=$(echo "${BdayOfPerson//\/}")
        # echo $BdayNum
        BdayD=$(echo $BdayNum | cut -c1-2)
        BdayM=$(echo $BdayNum | cut -c3-4)
        BdayY=$(echo $BdayNum | cut -c5-8)

        # echo $BdayD $BdayM $BdayY

        NowY=$(date "+%Y")
        NowM=$(date "+%m")
        NowD=$(date "+%d")

        # echo $NowD $NowM $NowY

        if [ $BdayY -le $NowY ]
        then
        {
            # echo "BdayY less then NowY"
            agey=$(($NowY - $BdayY))
            # echo $agey
          
            if [ $BdayM -gt $NowM ]
            then
                {
                    # echo "BdayM more then NowM"
                    agey=$(( $agey - 1))
                }
            elif [ $BdayM -eq $NowM ]
                then
                    {
                        # echo "BdayM equal to NowM"
                        if [ $BdayD -gt $NowD ]
                        then
                            {
                                # echo "BdayD more then NowD"
                                agey=$(( $agey - 1))
                            }
                        fi
                    }
                
            fi
                
        }
        fi
        echo "$name$agey" >> ./q2_output.txt

    }
done < "./input2Copied.txt"

rm ./input2Copied.txt