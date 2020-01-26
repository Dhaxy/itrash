import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
                return Scaffold(
                  body: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      children: <Widget>[
                                        Column(
                                            children: <Widget>[
                                              Text("Your bins")
                                            ],
                                          ),
                                        Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.all(50.0),
                                                    child: LinearPercentIndicator(
                                                        leading: Text("Bin 1"),
                                                        width: 250.0,
                                                        animation: true,
                                                        animationDuration: 1000,
                                                        lineHeight: 20.0,
                                                        linearStrokeCap: LinearStrokeCap.butt,
                                                        progressColor: Colors.red,
                                                        percent: double.tryParse(snapshot.data.levelData)/100,
                                                        center: Text(snapshot.data.levelData + '%')
                                                      ),
                                                    )
                                              ]
                                            )
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(top: 400),
                                              child: IconButton(
                                                icon: Icon(Icons.refresh),
                                                color: Colors.indigo[700],
                                                onPressed: () => {
                                                    httpService.resetData()
                                                },
                                              ),
                                            )
                                          ],
                                        )
                      ],
                  ),
                  )
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            return Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator()
                      ],
                  )
                );
          }
      )
    );
  }
}