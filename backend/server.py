import pyrebase
import json
import flask

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def home(): 
    return '''<h1>Distant Reading Archive</h1><p>This site is a prototype API for distant reading of science fiction novels.</p>'''

config = {
    "apiKey": "AIzaSyDNAIRzjfpNG6VIQZC_7xzV2zGuff5IJ8o",
    "authDomain": "disaster-relief-582e2.firebaseapp.com",
    "databaseURL": "https://disaster-relief-582e2.firebaseio.com",
    "storageBucket": "disaster-relief-582e2.appspot.com",
}

firebase = pyrebase.initialize_app(config)
auth = firebase.auth()

db = firebase.database()
children = db.child("users")

sample = {
    "city": "Tallahassee",
    "state": "FL",
    "first_name": "Wallace",
    "last_name": "Johnson",
    "messages": [

    ], 
}

app.run()

children.push(json.dumps(sample))