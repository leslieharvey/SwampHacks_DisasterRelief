import 'package:disaster_relief/model/supply.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(HomePage(
     items: List<ListItem>.generate(12, (index) => index % 6 == 0 ? 
        HeadingText("Heading $index", "Name $index") : 
        SupplyItem("Name" , "Description", "Sender", "Cost"),
        )
    ));
}

class HomePage extends StatelessWidget {
  final List<ListItem> items; 

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
              return ListTile(
                title: Text( 
                  item.name,
                  style: Theme.of(context).textTheme.headline,
                )
              );
            }
            if (item is SupplyItem) {
              return ListTile(
                title: Text( 
                  item.name,
                  style: Theme.of(context).textTheme.headline,
                )
              );
            }
          })
      )
    );
  } 
}