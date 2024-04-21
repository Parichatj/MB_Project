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
      title: 'Reading',
      home: Reading(),
    );
  }
}

class Reading extends StatefulWidget {
  const Reading({Key? key}) : super(key: key);

  @override
  _ReadingState createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  int _selectedIndex = 0; // เพิ่มตัวแปรเก็บ index ของหัวข้อที่ถูกเลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // สำหรับการเปิดหน้าตั้งค่า
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeaderItem(context, 'หัวข้อ', 0),
                _buildHeaderItem(context, 'บุ๊กมาร์ก', 1),
                _buildHeaderItem(context, 'ติดตาม', 2),
                _buildHeaderItem(context, 'ลิสต์', 3),
                _buildHeaderItem(context, 'ดูล่าสุด', 4),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(context, 'Home', Icons.home, 0),
              _buildNavItem(context, 'Fanfic', Icons.star, 1),
              _buildNavItem(context, 'Reading', Icons.book, 2),
              _buildNavItem(context, 'Writing', Icons.create, 3),
              _buildNavItem(context, 'Activity', Icons.notifications, 4),
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
        child: ListView.builder(
          itemCount: 5, // จำนวนกล่องที่ต้องการ
          itemBuilder: (context, index) {
            String imagePath = '';
            String title = '';
            switch (index) {
              case 0:
                imagePath = 'assets/image1.jpg';
                title = 'แทนที่หัวใจด้วยสายใยรัก';
                break;
              case 1:
                imagePath = 'assets/image2.jpg';
                title = 'ตะวันล้อมดาว';
                break;
              case 2:
                imagePath = 'assets/image3.jpg';
                title = 'เสน่หาหวนคืน';
                break;
              case 3:
                imagePath = 'assets/image4.jpg';
                title = 'สายใยร้ายเล่ห์   ลุ้นรักฉบับไอดอล';
                break;
              case 4:
                imagePath = 'assets/image5.jpg';
                title = 'เล่ห์ร้ายกลรัก';
                break;
              default:
                imagePath = 'assets/Disney.jpg'; // ใส่รูปภาพเริ่มต้นหากไม่พบรูปภาพที่ต้องการ
            }
            return _buildContentBox(context, index, imagePath, title);
          },
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String label, IconData icon, int index) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        setState(() {
          _selectedIndex = index; // เปลี่ยน index เมื่อหัวข้อถูกเลือก
        });
        print('$label tapped');
      },
      tooltip: label,
    );
  }

  Widget _buildHeaderItem(BuildContext context, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // เปลี่ยน index เมื่อหัวข้อถูกเลือก
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _selectedIndex == index ? Colors.black : Colors.grey, // เปลี่ยนสีของข้อความเมื่อถูกเลือก
            ),
          ),
          SizedBox(height: 4),
          AnimatedContainer(
            duration: Duration(milliseconds: 300), // ตั้งค่าความเร็วในการเลื่อนเส้นตรง
            width: 20,
            height: 2,
            color: _selectedIndex == index ? Colors.black : Colors.transparent, // เปลี่ยนสีของเส้นตรงเมื่อถูกเลือก
          ),
        ],
      ),
    );
  }

  Widget _buildContentBox(BuildContext context, int index, String imagePath, String title) {
  // รูปภาพสำหรับแต่ละกล่อง
  Widget imageWidget = Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.blueGrey, // สีพื้นหลังชั่วคราว
      image: DecorationImage(
        image: AssetImage(imagePath), // ใส่รูปภาพจาก assets
        fit: BoxFit.cover, // ปรับขนาดรูปภาพให้พอดีกับกล่อง
      ),
    ),
  );

  // ชื่อเรื่องสำหรับแต่ละกล่อง
  Widget titleWidget = Text(
    title,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );

  // สร้างกล่องเนื้อหา
  Widget contentBox = Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        imageWidget, // รูปภาพด้านซ้าย
        SizedBox(width: 10),
        Expanded(child: titleWidget), // ชื่อเรื่องด้านขวา
      ],
    ),
  );

  return contentBox;
}
}