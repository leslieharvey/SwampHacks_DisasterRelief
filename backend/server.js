var express = require('express');
var firebase = require('firebase');
var app = express();

var config = {
    apiKey: "AIzaSyDNAIRzjfpNG6VIQZC_7xzV2zGuff5IJ8o",
    authDomain: "disaster-relief-582e2.firebaseapp.com",
    databaseURL: "disaster-relief-582e2.firebaseio.com",
    projectId: "disaster-relief-582e2",
    storageBucket: "disaster-relief-582e2.appspot.com"
}
firebase.initializeApp(config);

// REST Endpoints for users
app.get('/', function (req, res) {
    console.log("HTTP Get Request");
    res.send("HTTP GET Request");

    // Test key/value pair
    firebase.database().ref('/TestMessages').set({TestMessage: 'GET Request'});
});

//Return a single user by ID
app.get('/users/:id', function(req, res) {
    var userReference = firebase.database().ref('/users/' + req.params.id).once('value').then(
        function(snapshot) {
            let data = snapshot.val();
            console.log(snapshot.val());
            var userData = [data['first_name'], data['last_name'], data['city'], data['state'], data['messages']];
            res.send(userData);
        }
    );
});
 
//Update user information
app.put('/', function (req, res) {
    console.log("HTTP Put Request");
    res.send("HTTP PUT Request");
});
  
//Create a new user
app.post('/users', function (req, res) {
    firebase.database().ref('users/' + req.query.id).set({ 
       city: req.query.city,
       state: req.query.state,
       first_name: req.query.first_name,
       last_name: req.query.last_name,
       messages: req.query.messages.split(',')
    });
    res.send("New user has been created!");  
});
  
app.delete('/', function (req, res) {
    console.log("HTTP DELETE Request");
    res.send("HTTP DELETE Request");
});

// REST Endpoints for requests
// Create a new request
app.post('/requests', function (req, res) {
    firebase.database().ref('requests/' + req.query.id).set({ 
      city: req.query.city,
      state: req.query.state,
      tags: req.query.tags,
      text: req.query.text,
      zip_code: req.query.zip_code
    })
    res.send("A new request was created in the DB!");
});

//Get all requests
app.get('/requests', function(req, res) {
    let requestData = firebase.database().ref('requests/').once("value").then(
        function(snapshot) {
            let data = snapshot.val();
            console.log(snapshot.val());
        }
    );
    console.log(requestData);
    res.send(requestData)
});

var server = app.listen(8080, function () {
    var host = server.address().address;
    var port = server.address().port;
  
    console.log("Example app listening at http://%s:%s", host, port);
});