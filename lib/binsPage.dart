import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'Components/HttpService.dart';
import 'dart:math';

class BinsPage extends StatefulWidget {
  const BinsPage({Key key}) : super(key: key);

  @override
  _BinsState createState() => new _BinsState();
}

class _BinsState extends State<BinsPage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LevelData>(
      future: httpService.getLevelData(),
      builder: (BuildContext context, AsyncSnapshot<LevelData> snapshot) {
        bool displayGauges = false;
        Widget children;
        Widget gauge1;
        Widget gauge2;
        Widget gauge3;

        if (snapshot.hasData) {
          displayGauges = true;
          gauge1 = buildGauge(snapshot, 1);
          gauge2 = buildGauge(snapshot, 2);
          gauge3 = buildGauge(snapshot, 3);
        } else if (snapshot.hasError) {
          displayGauges = false;
          children = buildErrorText(snapshot);
        } else {
          displayGauges = false;
          children = CircularProgressIndicator();
        }
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Your bins", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                  ],
                ),
                SizedBox(
                  height: 200, 
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (displayGauges) ...[
                          SizedBox(height: 30),
                          gauge1,
                          SizedBox(height: 15),
                          gauge2,
                          SizedBox(height: 15),
                          gauge3
                        ] else ...[
                          children
                        ]
                      ]
                    ),
                ),
                SizedBox(height: 280),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton.icon(
                        icon: Icon(Icons.refresh),
                        color: Colors.indigo[700],
                        textColor: Colors.white,
                        label: Text("Refresh"),
                        onPressed: () => {
                            httpService.resetData()
                        },
                    ),
                  ]
                )
              ],
            ),
          )
          );
      }
    );
  }


  Widget buildGauge(snapshot, number) {
      List<Color> colors = [Colors.red, Colors.green, Colors.amber];
      Random random = new Random();
      int randomNumber = random.nextInt(100);
      String randNumberString = randomNumber.toString();

      return LinearPercentIndicator(
                leading: Text("Bin $number", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                padding: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width - 150,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: colors[number - 1],
                // percent: double.tryParse(snapshot.data.levelData)/100,
                // center: Text(snapshot.data.levelData + '%')
                percent: (randomNumber / 100).toDouble(),
                center: Text(randNumberString + '%'),
              );
  }

  Widget buildErrorText(snapshot) {
    return Text("${snapshot.error}");
  }
}