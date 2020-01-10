import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app/homePage.dart';
import 'package:flutter_app/binsPage.dart';
import 'package:flutter_app/profilePage.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iTrash',
      theme: ThemeData(
        primaryColor: Colors.indigo[700],
        accentColor: Colors.indigoAccent,
        brightness: Brightness.light,
      ),
      home: _MainPage(),
    );
  }
}

class _MainPage extends StatefulWidget {
  _MainPage({Key key}): super(key: key);

  _MainState createState() => new _MainState();
}

class _MainState extends State<_MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    BinsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.indigo[700],
            primaryColor: Colors.white30,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent[100],
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text("Home")
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.restore_from_trash),
                title: new Text("Check your bins")
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.person), title: new Text("Profile")
            )
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
