import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiUrl = "https://itrash.herokuapp.com/status";

  Future<LevelData> getLevelData() async {
    final res = await http.get(apiUrl);

    if (res.statusCode == 200) {
      return LevelData.fromJson(json.decode(res.body));
    } else {
      throw "Can't get posts.";
    }
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