import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiUrl = "https://itrash.herokuapp.com/";
  bool resetTimeLimitUp = true;

  Future<LevelData> getLevelData() async {
    final res = await http.get(apiUrl + 'status');

    if (res.statusCode == 200) {
      Map result = json.decode(res.body);
      if (result['status'] == "-1") {
        throw "Data is resetting, try again later.";
      }
      return LevelData.fromJson(json.decode(res.body));
    } else {
      throw "Can't get posts.";
    }
  }

  void resetData() async {

    if (this.resetTimeLimitUp == true) {
      resetTimeLimitUp = false;
      //await http.post(apiUrl + 'reset');
      Timer(Duration(seconds: 70), () {
        resetTimeLimitUp = true;
      });
    }
    getLevelData();
  }
}
   
class LevelData {
  final String levelData;

  LevelData({this.levelData});

  factory LevelData.fromJson(Map<String, dynamic> json) {
    return LevelData(
      levelData: json['status']
    );
  }
}