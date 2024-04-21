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
      home: Search(),
    );
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate padding based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double basePadding = 40; // Base padding for tabs
    double padding = screenWidth / 100; // Dynamic padding calculation
    EdgeInsets tabPadding = EdgeInsets.symmetric(horizontal: basePadding + padding);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'ค้นหา',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                // Implement filter dialog or screen opening
              },
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelPadding: tabPadding, // Dynamically adjusted padding
          indicatorColor: Colors.white,
          labelStyle: TextStyle(fontSize: 12), // Smaller font size for tab labels
          unselectedLabelStyle: TextStyle(fontSize: 12), // Consistent font size for unselected tabs
          tabs: [
            Tab(text: 'ทั้งหมด'),
            Tab(text: 'ชื่อเรื่อง'),
            Tab(text: 'นามปากกา'),
            Tab(text: 'แฮชแท็ก'),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 94, 217, 226),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // To go back to the previous screen
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text('ทั้งหมด')),
          Center(child: Text('ชื่อเรื่อง')),
          Center(child: Text('นามปากกา')),
          Center(child: Text('แฮชแท็ก')),
        ],
      ),
    );
  }
}