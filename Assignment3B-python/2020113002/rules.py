import csv
import json
from os import error
import os
import matplotlib as plt

class get_JSON():
    def __init__(self,filename) -> None:
        try:
            with open(filename,'r') as f:
                self.rule_JSON=json.load(f)
                print( type ( self.rule_JSON ) )
            if( type ( self.rule_JSON ) == type ( dict() ) or type ( self.rule_JSON ) == type ( list() ) ) :
                print("JSON ",filename," loaded succesfully")
            else:
                print("JSON not loaded successfully.")
                error("400 error - JSON values not formatted correctly : Must be List of Dictionaries")
            pass
        except FileNotFoundError:
            print("FileNotFoundError: [Errno 2] No such file or directory: '",filename,"'")
            print ("Please ensure that",filename,"is present in the PWD, which is = ' ",os.getcwd()," ' \n. Have a nice day! :) ")

class get_CSV():
    def __init__(self,filename) -> None:
        try:
            self.data_CSV=[]
            with open(filename,'r') as f:
                csv_reader = csv.reader(f,delimiter=',')
                for row in csv_reader: 
                    self.data_CSV.append( row )
                print( type ( self.data_CSV ) )
                
            if( type ( self.data_CSV ) == type ( dict() ) or type ( self.data_CSV ) == type ( list() ) or type ( self.data_CSV ) == type ( csv.reader(range(1,10,1)) ) ) :
                print("CSV ",filename," loaded succesfully")
            else:
                print("CSV not loaded successfull.")
                error("400 error - CSV values not formatted correctly : Must be Comma seperated values.")
            pass
        except FileNotFoundError:
            print("FileNotFoundError: [Errno 2] No such file or directory: '",filename,"'")
            print ("Please ensure that",filename,"is present in the PWD, which is = ' ",os.getcwd()," ' \n. Have a nice day! :) ")



# type(test.rule_JSON()) # output = list 

# type(test.rule_JSON[5]()) # output = dict