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
                  child: Image.asset('assets/disney.jpg', fit: BoxFit.cover),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      size: 35,
                      color: Color(0xff004cc3),
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
                    child: Icon(
                      Icons.person,
                      color: Colors.black38,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 420,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/disney.jpg'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _buildFilterItem('หมวด', 'นิยายรัก'),
                SizedBox(width: 10),
                _buildFilterItem('สถาณะ', 'ทั้งหมด'),
                SizedBox(width: 10),
                _buildFilterItem('เรียงตาม', 'การอัพเดต'),
                SizedBox(width: 10),
                _buildFilterItem('ช่วงเวลา', 'ตลอดกาล'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategory('อันดับนิยาย'),
                _buildContent('ข้อความของคุณ'),
                _buildContent('ข้อความของคุณ'),
                _buildContent('ข้อความของคุณ'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategory('นิยายรัก'),
                _buildContent('ข้อความของคุณ'),
                _buildContent('ข้อความของคุณ'),
                _buildContent('ข้อความของคุณ'),
              ],
            ),
          ],
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
              Icon(Icons.keyboard_arrow_down, size: 16.0, color: Colors.black12),
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
      border: Border.all(color: const Color.fromARGB(255, 13, 92, 157), width: 2),
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

Widget _buildContent(String text) {
  return Padding(
    padding: EdgeInsets.only(top: 18.0, right: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image(height: 90, image: AssetImage('assets/disney.jpg')),
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
