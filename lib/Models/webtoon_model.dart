class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> webtoonJson)
      : title = webtoonJson["title"],
        thumb = webtoonJson["thumb"],
        id = webtoonJson["id"];
}
