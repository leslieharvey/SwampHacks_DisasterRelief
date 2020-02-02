import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class UserManagement {
  storeNewUser(user, context){
    Firestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid,
      'first_name': user.first_name,
      'last_name': user.last_name,
      'city': user.city,
      'state': user.state,
    }).then((value){
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e){
      print(e);
    });
  }
}

class SignupPage extends StatefulWidget{
  @override 
  _SignupPageState createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  String first_name;
  String last_name;
  String city;
  String state;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'First Name'),
                onChanged: (value){
                  setState((){
                    first_name = value;
                  });
                }),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(hintText: 'Last Name'),
                onChanged: (value){
                  setState((){
                    last_name = value;
                  });
                }),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(hintText: 'City'),
                onChanged: (value){
                  setState((){
                    city = value;
                  });
                }),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(hintText: 'State'),
                onChanged: (value){
                  setState((){
                    state = value;
                  });
                }),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value){
                  setState((){
                    _email = value;
                  });
                }),
              SizedBox(height: 10.0), 
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value){
                  setState((){
                    _password = value;
                  });
                }),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('Sign Up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed:() async {
                  try{
                    AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
                    FirebaseUser user = result.user;
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  }catch(error) {
                    print(error);
                  }
                },
              ),
            ],
          )),
        ));
  }
}
