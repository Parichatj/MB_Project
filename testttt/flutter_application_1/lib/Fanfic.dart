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
      title: 'My App',
      home: Fanfic(),
    );
  }
}

class Fanfic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ทั้งหมด   เเชท   บรรยาย"),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              child: FanFicPage(), // เรียกใช้ FanFicPage
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('อ่านต่อ', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            SizedBox(height: 20),
            NovelBox(imageUrl: 'https://example.com/novel.jpg', title: 'ชื่อนิยาย'),
          ],
        ),
      ),
    );
  }
}

class FanFicPage extends StatefulWidget { // เปลี่ยน FanFicPage เป็น StatefulWidget
  @override
  _FanFicPageState createState() => _FanFicPageState();
}

class _FanFicPageState extends State<FanFicPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8); // ประกาศ PageController

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // ใช้ GestureDetector สำหรับการเลื่อน
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < 0) { // เลื่อนไปทางซ้าย
          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        } else if (details.delta.dx > 0) { // เลื่อนไปทางขวา
          _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      },
      child: PageView.builder(
        controller: _pageController,
        itemCount: 5,
        itemBuilder: (_, i) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 2), // เพิ่มกรอบรอบรูปภาพ
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/cosmic.png",
                  fit: BoxFit.fitWidth, // ปรับขนาดรูปภาพให้เต็มความกว้างของ Container
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NovelBox extends StatelessWidget {
  final String imageUrl;
  final String title;

  const NovelBox({Key? key, required this.imageUrl, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            height: 100,
            width: 100,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(title, style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
