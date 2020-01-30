import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiUrl = "https://itrash.herokuapp.com/";

  Future<LevelData> getLevelData() async {
    final res = await http.get(apiUrl + 'status');

    if (res.statusCode == 200) {
      Map result = json.decode(res.body);
      // if (result['status'] == "-1") {
      //   throw "Data is resetting, try again later.";
      // }
      return LevelData.fromJson(json.decode(res.body));
    } else {
      throw "Can't get posts.";
    }
  }

  void resetData() async {
    await http.post(apiUrl + 'reset');
    getLevelData();
  }
}
   
class LevelData {
  final String levelData;

  LevelData({this.levelData});

  factory LevelData.fromJson(Map<String, dynamic> json) {
    return LevelData(
      // levelData: json['status']
      levelData: '20'
    );
  }
}