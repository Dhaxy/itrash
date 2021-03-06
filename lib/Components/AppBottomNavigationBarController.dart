import 'package:flutter/material.dart';

import 'package:flutter_app/homePage.dart';
import 'package:flutter_app/binsPage.dart';
import 'package:flutter_app/profilePage.dart';

class AppBottomNavigationBarController extends StatefulWidget {
  @override
  _AppBottomNavigationBarControllerState createState() =>
      _AppBottomNavigationBarControllerState();
}

class _AppBottomNavigationBarControllerState
    extends State<AppBottomNavigationBarController> {
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> pages = [
    HomePage(
      key: PageStorageKey('Home')
    ),
    BinsPage(
        key: PageStorageKey('Bins')
    ),
    ProfilePage(
        key: PageStorageKey('Profile')
    )
  ];


  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => changePage(index),
    currentIndex: selectedIndex,
    backgroundColor: Colors.indigo[700],
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.white,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home), title: Text("Home")
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.restore_from_trash),
          title: Text("Check your bins")
      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.person), title:  Text("Profile")
      )
    ],
  );

  void changePage(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}