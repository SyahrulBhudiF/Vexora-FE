import 'package:flutter/material.dart';
import 'package:vexora_fe/presentation/homepage/homepage_initial.dart';
import 'package:vexora_fe/presentation/more_screen/more_screen.dart';
import 'package:vexora_fe/presentation/scan/scan.dart';
import 'package:vexora_fe/widget/custom_floating_button.dart';

class BottomNavigationBarNew extends StatefulWidget {
  const BottomNavigationBarNew({super.key});

  @override
  State<BottomNavigationBarNew> createState() => _BottomNavigationBarNew();
}

class _BottomNavigationBarNew extends State<BottomNavigationBarNew> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomepageInitial(),
    const MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
      floatingActionButton: CustomFloatingButton(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScanScreen()),
          ); // This should now work
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
