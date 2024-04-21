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
      title: 'Writing',
      home: Writing(),
    );
  }
}

class Writing extends StatefulWidget {
  const Writing({Key? key}) : super(key: key);

  @override
  _WritingState createState() => _WritingState();
}

class _WritingState extends State<Writing> {
  bool isAddingTitle = true; // กำหนดตัวแปรสถานะเริ่มต้น

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Writing '),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(context, 'Home', Icons.home),
              _buildNavItem(context, 'Fanfic', Icons.star),
              _buildNavItem(context, 'Reading', Icons.book),
              _buildNavItem(context, 'Writing', Icons.create),
              _buildNavItem(context, 'Activity', Icons.notifications),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blueAccent],
            radius: 1.5,
            center: Alignment.center,
          ),
        ),
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff004cc3),
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'เพิ่มงานเขียนของคุณ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ชื่องานเขียน',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'เนื้อเรื่อง',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (isAddingTitle) {
                      // ดำเนินการเพิ่มชื่องานเขียน
                      print('เพิ่มชื่องานเขียน');
                    } else {
                      // ดำเนินการเพิ่มเนื้อเรื่อง
                      print('เพิ่มเนื้อเรื่อง');
                    }
                    // สลับสถานะ
                    isAddingTitle = !isAddingTitle;
                  },
                  child: Text(
                      isAddingTitle ? 'เพิ่มงานเขียน' : 'เพิ่มเนื้อเรื่อง'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String label, IconData icon) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        print('$label tapped');
      },
      tooltip: label,
    );
  }
}