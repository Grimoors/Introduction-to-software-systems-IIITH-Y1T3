from flask import Flask,jsonify,request # "Flask" is a class

#What is a webserver? 
# It is a software which accepts web request.

#What happens when you type in www.google.com ??

#This is what server sees:
"""
GET / HTTPS/1.1  #This is a path.
HOST: https://www.google.com
"""
# "GET" is called a 'work verb' , eg POST, DELETE, PUT
#
# Get Retievees data from server
# Post gives data to server
# Delete tells server to delete data, 
# Put is like Updation of data on server
# 
#   
# Giving a path that server doesnt know gives a 404 page 
#  eg. https://www.google.com/xyz 

'''
Another Quick example : https://www.twitter.com

Now let us write a Hello world of Flask.

'''


app=Flask(__name__) #__name__ gives a unique identifier name to the application.
# Now we need to tell what request it needs to process. This is a Decorator which acts as a method modifier on a method.


#The following line implicitly states that this is a Get Request thing for the server.
@app.route("/") # we just defined a path on the rest api call. This is a Decorator
def home():
    return "<h1>Hello World</h1>"

app.run(port=5000) # This is a PORT . Refer wiipedia.  The webite will run on "localhost/" or "127.0.0.1:5000/"

'''
"__" is called a "dunder", it comes in classes and is called a magic method.
'''


#Please Read about django at https://www.djangoproject.com 
