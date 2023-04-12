class WebtoonEpisodeModel {
  final String id, title, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> episodeJson)
      : id = episodeJson["id"],
        title = episodeJson["title"],
        rating = episodeJson["rating"],
        date = episodeJson["date"];
}
