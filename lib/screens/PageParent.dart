import 'package:flutter/material.dart';
import 'package:hackbourak/screens/MapLoader.dart';
import 'package:hackbourak/screens/RestPage.dart';



class PageParent extends StatefulWidget {
  const PageParent({Key? key}) : super(key: key);

  @override
  State<PageParent> createState() => _PageParentState();
}

class _PageParentState extends State<PageParent> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[

    Text(
      'Index 1: Business',
      style: optionStyle,
    ),

    RestPage(),

    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Acceuil',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFE32929),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
