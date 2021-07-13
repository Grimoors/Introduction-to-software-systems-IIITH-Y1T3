import csv
import json
from os import error
import matplotlib as plt

class get_JSON():
    def __init__(self,filename) -> None:
        try:
            with open(filename,'r') as f:
                self.rule_JSON=json.load(f)
            if( type ( self.rule_JSON ) == ( type( dict() ) or type( list () ) ) ):
                print("JSON ",filename," loaded succesfully")
            else:
                print("JSON not loaded successfull.")
                error("400 error - JSON values not formatted correctly : Must be List of Dictionaries")
            pass
        except FileNotFoundError:
            print("FileNotFoundError: [Errno 2] No such file or directory: '",filename,"'")
            print ("Please ensure that",filename,"is present in the PWD, which is = ' ",__file__," ' \n. Have a nice day! :) ")

class get_CSV():
    def __init__(self,filename) -> None:
        try:
            with open(filename,'r') as f:
                self.data_CSV=json.load(f)
            if( type ( self.data_CSV ) == ( type( dict() ) or type( list () ) ) ):
                print("CSV ",filename," loaded succesfully")
            else:
                print("CSV not loaded successfull.")
                error("400 error - CSV values not formatted correctly : Must be List of Dictionaries")
            pass
        except FileNotFoundError:
            print("FileNotFoundError: [Errno 2] No such file or directory: '",filename,"'")
            print ("Please ensure that",filename,"is present in the PWD, which is = ' ",__file__," ' \n. Have a nice day! :) ")

test=get_JSON("rules.json")
test2=get_CSV("data.csv")


# type(test.rule_JSON()) # output = list 

# type(test.rule_JSON[5]()) # output = dict