import 'package:flutter/material.dart';
import 'package:toonflix/Models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EpisodesWidget extends StatelessWidget {
  const EpisodesWidget({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  Future ontap() async {
    await launchUrlString(
        'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}');
  }

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            episode.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            '⭐️${episode.rating}   ${episode.date}',
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
