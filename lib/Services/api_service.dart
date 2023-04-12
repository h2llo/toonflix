import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToon() async {
    List<WebtoonModel> toon = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        toon.add(WebtoonModel.fromJson(webtoon));
      }
      return toon;
    }
    throw Error();
  }
}
