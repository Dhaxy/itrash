import 'package:flutter/material.dart';

import 'package:flutter_app/Components/DashboardTilesComponent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: (40 / 65) ,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            new GestureDetector(
              onTap: () {

              },
              child: Card(
                margin: const EdgeInsets.all(8),
                child: DashboardTilesComponent("Check your bins", icon:Icons.restore_from_trash, additionalInfo: ""),
                color: Colors.indigo[400],
              ),
            ),
            new GestureDetector(
              child: Card(
                margin: const EdgeInsets.all(8),
                child: DashboardTilesComponent("full bins !", additionalInfo: "0",),
                color: Colors.indigo[700],
              ),
            ),
            new GestureDetector(
              child: Card(
                margin: const EdgeInsets.all(8),
                child: DashboardTilesComponent("steps today.", additionalInfo: "500"),
                color: Colors.indigo[700],
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Card(
                margin: const EdgeInsets.all(8),
                child: DashboardTilesComponent("Check your profile", icon:Icons.person, additionalInfo: ""),
                color: Colors.indigo[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}