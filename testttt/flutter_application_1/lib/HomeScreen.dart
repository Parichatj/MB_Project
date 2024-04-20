import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Column(
          children: [
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                fillColor: Color(0xffF1F1F1),
                filled: true,
                border: InputBorder.none,
              ),
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
        // Here you can add navigation logic
        // For instance:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => YourNewPage()));
        print('$label tapped');
      },
      tooltip: label,
    );
  }
}
