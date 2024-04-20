import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Setting(),
    );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.settings, color: Color.fromARGB(255, 0, 0, 0)),
              SizedBox(width: 10),
              Text('Settings'),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          buildUserCard(),
          buildSettingItem('การแสดงผล', Icons.arrow_forward_ios, () {}),
          buildSettingItem('ประสิทธิภาพ', Icons.arrow_forward_ios, () {}),
          buildSettingItem('การแจ้งเตือน', Icons.arrow_forward_ios, () {}),
          buildSettingItem('ความเป็นส่วนตัว', Icons.arrow_forward_ios, () {}),
          buildSettingItem('โหมดกลางคืน', Icons.nightlight_round, () {}),
        ],
      ),
    );
  }

  Widget buildUserCard() {
    return Card(
      color: Color.fromARGB(255, 162, 160, 211),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0), // Add margin to separate the user card
      child: ListTile(
        title: Text('User Name', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        subtitle: Text('username@example.com', style: TextStyle(fontSize: 16.0)),
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          radius: 30.0,
        ),
      ),
    );
  }

  Widget buildSettingItem(String title, IconData trailingIcon, VoidCallback onTap) {
    return Card(
      color: Color.fromARGB(255, 162, 160, 211),
      margin: EdgeInsets.zero, // Remove any outer margins
      child: ListTile(
        title: Text(title),
        trailing: Icon(trailingIcon),
        onTap: onTap,
      ),
    );
  }
}