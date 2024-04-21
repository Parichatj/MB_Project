import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Search.dart'; // เรียกใช้ HomeScreen จากไฟล์ home.dart
import 'package:flutter_application_1/Writing.dart';
import 'package:flutter_application_1/fanfic.dart'; // เรียกใช้ Fanfic จากไฟล์ fanfic.dart
import 'package:flutter_application_1/Goal.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:flutter_application_1/Reading.dart';
import 'package:flutter_application_1/Profile.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/', // เริ่มต้นที่หน้า HomeScreen
    routes: {
      '/': (context) => Home(), // เรียกใช้ HomeScreen จากไฟล์ home.dart
      '/fanfic': (context) => Fanfic(), // เรียกใช้ Fanfic จากไฟล์ fanfic.dart ในเส้นทาง '/fanfic'
      '/search':(context) => Search(),
      '/goal':(context) => Goal(),
      '/Setting':(context) => Setting(),
      '/้home': (context) => Home(),
      '/reading' : (context) => Reading(),
      '/profile' : (context) => Profile(),
    },
  ));
}
