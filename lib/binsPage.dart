import 'package:flutter/material.dart';
import 'Components/HttpService.dart';

class BinsPage extends StatefulWidget {
  const BinsPage({Key key}) : super(key: key);

  @override
  _BinsState createState() => new _BinsState();
}

class _BinsState extends State<BinsPage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: FutureBuilder(
          future: httpService.getLevelData(),
          builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.levelData);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            return CircularProgressIndicator();
          }
      )
    );
  }
}