import 'package:flutter/material.dart';

class DashboardTilesComponent extends StatelessWidget {
  IconData icon;
  String text;
  String additionalInfo;

  DashboardTilesComponent(this.text, {this.icon, this.additionalInfo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(child: Icon(this.icon, size: 100, color: Colors.white60), visible: this.icon == null ? false : true),
            Visibility(child: Text(this.additionalInfo), visible: this.icon == null ? true : false),
            Text(this.text)
          ],
        ),
    );
  }
}
