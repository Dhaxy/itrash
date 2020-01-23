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
            Visibility(child: Icon(this.icon, size: 75, color: Colors.white), visible: this.icon == null ? false : true),
            Visibility(child: Text(
                this.additionalInfo,
                style: TextStyle(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
            ), visible: this.icon == null ? true : false),
            Text(
              this.text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )
          ],
        ),
    );
  }
}
