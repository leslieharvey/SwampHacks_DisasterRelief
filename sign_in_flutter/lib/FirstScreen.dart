import 'package:flutter/material.dart';

void main() {
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {

  PageController _pageController;
  int _page = 2;


  final icons = [Icons.list, Icons.map, Icons.settings, Icons.person];
  final titles = ['List', 'Map', 'Settings', 'Profile'];


  @override
  Widget build(BuildContext context) {
    final title = 'List';

    return MaterialApp(
        title: title,
        home: Scaffold(
            drawer: Drawer(
              child: ListView(
                // Remove all padding form ListView
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image : DecorationImage(
                          image: AssetImage("assets/logo.png"),
                      fit: BoxFit.contain)
                    )
                    ),
                  ListTile(
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('My Profile'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Map'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            appBar: AppBar(
              title: Text(title),
            ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: <Widget>[

              ],

                )
        )
    );
  }
}

abstract class ListItem {}

class HeadingText implements ListItem {
  final String heading;
  final String name;
  HeadingText(this.heading, this.name);
}

class SupplyItem implements ListItem {
  final String name;
  final String description;
  final String sender;
  final String cost;
  // Need Latitude and Longitude for location
  SupplyItem(this.name, this.description, this.sender, this.cost);
}