#sqlite3
import sqlite3
# from sqlite3.dbapi2 import Cursor

connection = sqlite3.connect("data.db") #for servers, add username, password and host.
#CRUD - Create, Update, Delete

cursor = connection.cursor() # responsible to execute quesry and store results
create_table = "CREATE TABLE users (id int, username text, password text)" #defining a schema

cursor.execute(create_table)

user = (1, 'Abhinav', "Test1234")

insert_query = "INSERT INTO users VALUES (?,?,?)"

cursor.execute(insert_query,user)

#for data persistence , ie, to save it to the db beyond runtime,

connection.commit()

connection.close()

