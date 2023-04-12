class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> detailJson)
      : title = detailJson['title'],
        about = detailJson['about'],
        genre = detailJson['genre'],
        age = detailJson['age'];
}
