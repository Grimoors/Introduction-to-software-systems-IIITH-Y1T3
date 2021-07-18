import os as os
import sys as sys
import json
import csv

"""
Note : Instead of Commenting,
I have gone with the Stacktrace generation method like in Java,
as that is more familiar to me.

Please check the terminal output for the stacktrace, 
or redirect that to a file to read 'comments'.

"""



print("\n __--Disclaimer--__ \n")
print('This Script was written in a Windows 10 - Development Environment and is expected to run well on the same.\n I do not claim usability on linux or macintosh.\n Please use Windows to run this.')
print("\nPlease ensure presence of the following File structure : \n ./ \n\t ./rules.py \n\t ./lookup.py \n\t ./rules.json ( Or some other json file ) \n\t ./data.csv (or some other csv file)  . \n You will find the output in ./results.csv . \n\nPlease take copies of it after individual runs, or it will be overwritten. \n\n Thank you, Have a nice day.")
print("Note : Instead of Commenting, I have gone with the Stacktrace generation method like in Java, as that is more familiar to me.\n Please check the terminal output for the stacktrace, or redirect that to a file to read 'comments'.")
print("\n __--Begin Program--__ \n")
sys.path.append(".")
if(len(sys.argv) != 3 ):
    print("Usage : PS $PWD>python3 lookup.py [PutNameOfrulesJsonFileHere].json [PutNameOfdataCSVFileHere].json")
    exit()

import rules as ru
#use these when generating flowchart.js code.
# ruleFileName="rules.json"
# dataFileName="data.csv"

#when trying to generate flowchart, an alternate way is used, using the file lookup2.py
# rules= ru.get_JSON(ruleFileName)
# data= ru.get_CSV(dataFileName)

rules= ru.get_JSON(sys.argv[1])
data= ru.get_CSV(sys.argv[2])

print ("Input of Data =")
print( data.data_CSV )

print("Input of Rules = ")
print(rules.rule_JSON)

print("\n\n --Beginning to read the csv Data-- \n\n ")
print("Seeing headers column and saving to an array 'Headers'\n")

print("Version 2 - We need to exclude the 'status' column from the final result output in results.csv,\nhence I shall store the index of it in the variable - 'statInd'\n")
statInd=int()

Headers = []
for row in data.data_CSV:
    #Version 2 Code Edit Start
    i=int()
    i=0
    #Version 2 Code Edit End
    for column_entry in row:
        Headers.append( column_entry.lower() )
        #Version 2 Code Edit Start
        if column_entry.lower() == 'status' :
            statInd=i
        i+=1
        #Version 2 Code Edit End
    break
#Version 2 Code Edit Start
print("Headers Column in data read \nEntries are :", Headers,"\n The number of columns are = ",len(Headers),"\nAppending Results column , such that there are now ", (len(Headers)+1),"Columns\n\n---Version 2---\n\nDeleting Status Column, such that there are now ",(len (Headers)), "Columns")
        #Version 2 Code Edit End
Headers.append("results")
#Version 2 Code Edit Start
Headers.remove("status")
        #Version 2 Code Edit End

print(Headers,'\n')


print("Writing the Headers to results.csv\n")
with open("results.csv","wt",newline='') as file:
    writer=csv.writer(file, delimiter=',')
    writer.writerow(Headers)
    
print("Headers written, now I will read the first entry of 'rules' to See which columns need to be checked every time:\n")


dictkeys=list (rules.rule_JSON[0]["fields"].keys())
print("Searching keys=",dictkeys)
print("\nThe number of keys=",len(dictkeys),"\nCreating a List of indices of these fields in the header , 'SColInd' \n")



SColInd=[]
for i in range(0,len(dictkeys),1):
    SColInd.append( int( Headers.index(dictkeys[i].lower()) ) )
print("Our Relevant columns for lookup are ",SColInd )

#Version 2 Code Edit Start

        #Version 2 Code Edit End

print("Starting lookup and print of rows of 'data.data_CSV' ")

print("\nNOTE : As the 'rules.rules_JSON' is expected to be a list of dictionaries,\nwe will find the element of the list which has a key='field' \nwith a value of a sub-dict matching with 'searchField' ")

with open("results.csv","at",newline='') as file:
    writer=csv.writer(file, delimiter=',')
    data.data_CSV.pop(0)
    rownumber=0
    for row in data.data_CSV:    
        rownumber+=1
        print("\n\n Row Number = ",rownumber,"\n\n")
        print("Reading row = ",row,"\n")
        print("Creating the field that we will search for:\n")
        searchField=dict()
        for index in SColInd:
            keyAdd=Headers[index]
            valAdd=row[index]
            searchField.update({keyAdd:valAdd})
        print("'searchField' created : We need to search for the dict with field sub-dict with value = ",searchField,"\n")
        
        dictNumber=-1
        i=0
        for dict1 in rules.rule_JSON:
            if(dict1["fields"] == searchField):
                dictNumber=i
                
            i+=1
        
        if(i==-1):
            print(" FATAL ERROR - The rules.json is incomplete! Please Update it to have the entry for field = ",searchField,"The program shall exit now. FATAL ERROR")
        else:
            print(" Fields Lookup done, result =", rules.rule_JSON[dictNumber]["results"] ,",\nappending to row\n")
            row.append(rules.rule_JSON[dictNumber]["results"])
            #Version 2 Code Edit Start
            print(" Checking Validity of the Result by doing a subsidary lookup for the status value\n")
            if rules.rule_JSON[dictNumber]["status"] == "In Active":
                print("Due to Inactive Status, Invalidating the Results entry of Row")
                row.pop(-1)
                row.append("No Access")
            else:
                print("Validity is proper, moving on.\n")

            print('Removing Status entry')
            row.pop(statInd)

            print("Writing to File")
                #Version 2 Code Edit End
            writer.writerow(row)


print("We have gone through the entire file of the 'data.data_CSV' supplied to us and printed the Answers.\nThis program ran succesfully. exiting. Have a nice day!\n\nThanking You,\nYours sincerely,\nVivek Mathur\nCND, 2020113002,\nUg2020, IIIT-Hyderabad.")
exit(0)