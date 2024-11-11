import 'package:flutter/material.dart';
import 'package:vexora_fe/presentation/history_screen/history_screen.dart';
import 'package:vexora_fe/presentation/homepage/homepage_initial.dart';
import 'package:vexora_fe/presentation/more_screen/more_screen.dart';
import 'package:vexora_fe/presentation/scan/scan.dart';
import 'package:vexora_fe/widget/custom_floating_button.dart';

// class BottomNavigationBarApp extends StatelessWidget {
//   const BottomNavigationBarApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BottomNavigationBarNew(),
//     );
//   }
// }

class BottomNavigationBarNew extends StatefulWidget {
  BottomNavigationBarNew({super.key});

  @override
  State<BottomNavigationBarNew> createState() => _BottomNavigationBarNew();
}

class _BottomNavigationBarNew extends State<BottomNavigationBarNew> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomepageInitial(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
