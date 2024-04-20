import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Goal(),
    );
  }
}

class Goal extends StatefulWidget {
  @override
  _ReadingGoalsPageState createState() => _ReadingGoalsPageState();
}

class _ReadingGoalsPageState extends State<Goal> {
  Duration readingTime = Duration(minutes: 0);

  void incrementReadingTime() {
    setState(() {
      readingTime += Duration(minutes: 15);  // แต่ละครั้งเพิ่ม 15 นาที
    });
  }

  String getFormattedTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(readingTime.inHours)}:${twoDigits(readingTime.inMinutes.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เป้าหมายในการอ่าน'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(200, 200),painter: HalfCirclePainter(),
                ),
                Text(getFormattedTime(), // แสดงเวลา
                  style: TextStyle(
                    fontSize: 48, // ขนาดตัวอักษร
                    fontWeight: FontWeight.bold, // ตัวหนา
                    color: const Color.fromARGB(255, 32, 32, 32), // สีตัวอักษร
                  )), 
              ],
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: incrementReadingTime,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(height: 20), // ระยะห่างระหว่างปุ่ม
            ElevatedButton(
              onPressed: () {}, // เพิ่มฟังก์ชันแชร์ตรงนี้
              child: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}


class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    // วาดครึ่งวงกลมคว่ำ
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      pi, // เริ่มต้นที่ตำแหน่ง 6 นาฬิกา
      pi, // วาดครึ่งวงกลม (180 องศา)
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
