import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _buildNavItem(context, 'Home', Icons.home),
              ),
              Expanded(
                child: _buildNavItem(context, 'Fanfic', Icons.star),
              ),
              Expanded(
                child: _buildNavItem(context, 'Reading', Icons.book),
              ),
              Expanded(
                child: _buildNavItem(context, 'Writing', Icons.create),
              ),
              Expanded(
                child: _buildNavItem(context, 'Activity', Icons.notifications),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Colors.blueAccent],
              radius: 1.5,
              center: Alignment.center,
            ),
          ),
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 20.0, bottom: 90),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff004cc3),
                      ),
                      child: Image.asset('assets/Logo.jpg', fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'นิยาย',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Color(0xff004cc3),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Badge(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 1),
                          )
                        ],
                        
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.search, color: Colors.black),
                          Spacer(),
                          Icon(Icons.timelapse, color: Colors.black),
                          Spacer(),
                          Icon(Icons.person, color: Colors.black),
                           ],
                          ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 500,
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/นิยาย1.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
               children: <Widget>[
                 SizedBox(width: 10), // รักษาขอบข้างซ้าย
                 _buildFilterItem('หมวด', 'นิยายรัก'),
                 Spacer(), // เพิ่ม Spacer เพื่อกระจายระยะห่าง
                 _buildFilterItem('สถาณะ', 'ทั้งหมด'),
                 Spacer(), 
                 _buildFilterItem('เรียงตาม', 'การอัพเดต'),
                 Spacer(), 
                 _buildFilterItem('ช่วงเวลา', 'ตลอดกาล'),
                 SizedBox(width: 10), // รักษาขอบข้างขวา
               ],
),

              SizedBox(height: 20),
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategory('อันดับนิยาย'),
                  _buildContentWithImage('assets/image1.jpg', '1 ผม(ไม่)ชอบเด็ก'),
                  _buildContentWithImage('assets/image2.jpg', '2 ไอ้ดื้อ…ของเฮีย'),
                  _buildContentWithImage('assets/image3.jpg', '3 เด็กใหม่ #ของเสี่ย'),
// ซ้ำเหมือนเดิมสำหรับรูปภาพอื่นๆ

                ],
              ),
              SizedBox(height: 20),
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategory('นิยายรัก'),
                  _buildContentWithImage('assets/image4.jpg', 'บ้านนี้หมาคลั่งรัก'),
                  _buildContentWithImage('assets/image5.jpg', 'ถ่านไฟรัก'),
                  _buildContentWithImage('assets/image6.jpg', 'อ้อนรักละลายหัวใจ'),
// ซ้ำเหมือนเดิมสำหรับรูปภาพอื่นๆ

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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

Widget _buildFilterItem(String title, String value) {
  return Column(
    children: [
      Text(title, style: TextStyle(color: Colors.black, fontSize: 12)),
      SizedBox(height: 4),
      Container(
        height: 35,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.keyboard_arrow_down,
                  size: 16.0, color: Colors.black12),
              SizedBox(width: 4),
              Text(value),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildCategory(String title) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 121, 181, 230),
      border:
          Border.all(color: const Color.fromARGB(255, 13, 92, 157), width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}

Widget _buildContentWithImage(String imagePath, String text) {
  return Padding(
    padding: EdgeInsets.only(top: 18.0, right: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
