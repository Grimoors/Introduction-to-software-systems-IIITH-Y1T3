import flask  
from flask import Flask, jsonify, request


# Jsonify Ka use.
from types import resolve_bases
# "Flask" is a class

stores = [ #A list stored in "server" or "database"
    {
        'name': 'Tesco',
        'items': [
            {
                'name': 'My item',
                'price': 15.99
            }
        ]
    }
]


app = Flask(__name__)


@app.route("/")
def home():
    return "<h1>Hello World</h1>"


@app.route("/")
def json():
    return jsonify({'key': 'value', 'key2': [1, 2, 3]})

# LOOKUP -- JWD Authentication --


@app.route('/store')
def get_store():
    json_file = jsonify({'stores': stores })
    return json_file

#EXPLICIT declaration of post request.
@app.route('/store', method=['POST'])
def create_store():
    request_data = request.get_json()
    #Where is request going? 
    #The browser sends a request to the server and expects a json value back from the server.
    new_store = {'name': request_data['name'],'items':request_data['items']}
    stores.append(new_store)
app.run(port=5000)
