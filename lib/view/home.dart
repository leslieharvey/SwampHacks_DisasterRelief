// import 'package:disaster_relief/model/supply.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage(
     items: List<ListItem>.generate(12, (index) => 
        SupplyItem("Name" , "Description", "Sender", "Cost"),
        )
    ));
}

class HomePage extends StatelessWidget {
  final List<ListItem> items; 

  final icons = [Icons.list, Icons.map, Icons.settings, Icons.person];
  final titles = ['List', 'Map', 'Settings', 'Profile'];
  HomePage({@required this.items}): super();

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
                ),
              ), 
              ListTile( 
                title: Text('Item 1'),
                onTap: () {
                  

                  Navigator.pop(context);
                },
              ),
              ListTile( 
                title: Text('Item 2'),
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
        body: ListView.builder(
          itemCount: items.length, 
          itemBuilder: (context, index) {
            final item = items[index]; 
            if (item is HeadingText) {
              // return Card(
              //   child: ListTile(
              //     leading: Icon(icons[index]),
              //     title: Text(titles[index])
              //     ),
              // )
              return ListTile(
                title: Text( 
                  item.name,
                  style: Theme.of(context).textTheme.headline,
                )
              );
            }
            if (item is SupplyItem && index < 4) {
              return Card(
                child: ListTile(
                  leading: Icon(icons[index]),
                  title: Text(titles[index])
                  ),
              );
            }
          })
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