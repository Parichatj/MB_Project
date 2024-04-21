import 'package:flutter/material.dart';
// Import the profile.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Profile(), // Set the Profile widget as the home screen
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        children: <Widget>[
          buildUserCard(),
          buildSettingItem('คอยน์ของฉัน', Icons.arrow_forward_ios, () {}),
          buildSettingItem('รายการที่ชอบ', Icons.arrow_forward_ios, () {}),
          buildSettingItem('งานเขียนของฉัน', Icons.arrow_forward_ios, () {}),
          buildSettingItem('ความเป็นส่วนตัว', Icons.arrow_forward_ios, () {}),
          buildSettingItem('ตั้งค่า', Icons.settings, () {}),
          buildLogoutButton(context),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.people, color: Colors.black),
            SizedBox(width: 10),
            Text('Profile'),
          ],
        ),
      ),
    );
  }

  Widget buildUserCard() {
    return Card(
      color: Color.fromARGB(255, 162, 160, 211),
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10.0,
      ),
      child: ListTile(
        title: Text(
          'User Name',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'username@example.com',
          style: TextStyle(fontSize: 16.0),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          radius: 30.0,
        ),
      ),
    );
  }

  Widget buildSettingItem(
      String title, IconData trailingIcon, VoidCallback onTap) {
    return Card(
      color: Color.fromARGB(255, 162, 160, 211),
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(title),
        trailing: Icon(trailingIcon),
        onTap: onTap,
      ),
    );
  }

  Widget buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,
          // Set the background color of the ElevatedButton
          // and the text color when it's pressed
        ),
        onPressed: () {
          // Perform logout operation or any action you want when user logs out
        },
        child: Text('LOGOUT'),
      ),
    );
  }
}
