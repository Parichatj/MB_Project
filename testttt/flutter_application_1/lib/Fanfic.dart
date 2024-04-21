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
      title: 'Fanfic',
      home: Fanfic(),
    );
  }
}

class Fanfic extends StatefulWidget {
  @override
  _FanficState createState() => _FanficState();
}

class _FanficState extends State<Fanfic> {
  final List<String> categories = ['เพื่อนสนิท', 'โรงเรียน', 'เเอบรัก', 'มหาวิทยาลัย', 'omegaverse'];
  List<bool> isSelected = [false, false, false, false, false]; // เก็บสถานะการเลือกของแต่ละหัวข้อ

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
                IconButton(
                  icon: Icon(Icons.book),
                  onPressed: () {
                    Navigator.pushNamed(context, '/reading');
                  },
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
              child: FanFicPage(),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('อ่านต่อ', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            SizedBox(height: 20),
            NovelBoxList(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ฟิค Boy love',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ToggleButtons(
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(categories[index]),
                  ),
                ),
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    isSelected = List.generate(categories.length, (i) => i == index);
                  });
                },
                borderRadius: BorderRadius.circular(8),
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                splashColor: Colors.blueAccent,
                renderBorder: false,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(context, 'Home', Icons.home, '/'),
              _buildNavItem(context, 'Fanfic', Icons.star, '/fanfic'),
              _buildNavItem(context, 'Reading', Icons.book, '/reading'),
              _buildNavItem(context, 'Writing', Icons.create, '/writing'),
              _buildNavItem(context, 'Activity', Icons.notifications, '/activity'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, IconData icon, String routeName) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(height: 4),
          Text(title),
        ],
      ),
    );
  }
}

class FanFicPage extends StatefulWidget {
  @override
  _FanFicPageState createState() => _FanFicPageState();
}

class _FanFicPageState extends State<FanFicPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < 0) {
          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        } else if (details.delta.dx > 0) {
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
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/cosmic.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NovelBoxList extends StatefulWidget {
  @override
  _NovelBoxListState createState() => _NovelBoxListState();
}

class _NovelBoxListState extends State<NovelBoxList> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < 0) {
          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        } else if (details.delta.dx > 0) {
          _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      },
      child: Container(
        height: 120,
        child: PageView.builder(
          controller: _pageController,
          itemCount: 5,
          itemBuilder: (_, index) {
            return NovelBox(
              imageUrl: 'https://example.com/novel_$index.jpg',
              title: 'ชื่อนิยาย $index',
            );
          },
        ),
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
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
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
