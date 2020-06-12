import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  static var list = ['Edit Name', 'Notifications', 'Help', 'Theme', 'Logout'];
  static var iList = [
    Icon(Icons.edit),
    Icon(Icons.notifications_none),
    Icon(Icons.help_outline),
    Icon(Icons.filter),
    Icon(Icons.exit_to_app),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, position){
              return Card(
                child: ListTile(
                  title: Text(list[position]),
                  leading: iList[position],
                  onTap: (){},
                ),
              );
            }),
      ),
    );
  }
}
