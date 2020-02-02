import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_up.dart';
import 'profile_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landinpage': (BuildContext context)=> new MyApp(),
        '/signup': (BuildContext context)=> new SignupPage(),
        '/homepage': (BuildContext context)=> new MyHomePage()
      }
    );
  }
}


