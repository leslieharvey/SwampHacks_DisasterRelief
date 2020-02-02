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
  
app.put('/', function (req, res) {
    console.log("HTTP Put Request");
    res.send("HTTP PUT Request");
});
  
app.post('/', function (req, res) {
    console.log("HTTP POST Request");
    res.send("HTTP POST Request");  
});
  
app.delete('/', function (req, res) {
    console.log("HTTP DELETE Request");
    res.send("HTTP DELETE Request");
});

var server = app.listen(8080, function () {

    var host = server.address().address;
    var port = server.address().port;
  
    console.log("Example app listening at http://%s:%s", host, port);
});