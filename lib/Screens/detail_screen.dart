import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/Models/webtoon_detail_model.dart';
import 'package:toonflix/Models/webtoon_episode_model.dart';
import 'package:toonflix/Services/api_service.dart';
import 'package:toonflix/Widgets/episodes_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> toonDetail;
  late Future<List<WebtoonEpisodeModel>> toonEpisode;
  late SharedPreferences prefs;
  bool isliked = false;

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isliked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isliked = !isliked;
      });
    }
  }

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isliked = true;
        });
      }
    } else {
      prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    super.initState();
    toonDetail = ApiService.getToonById(widget.id);
    toonEpisode = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 242, 242, 242),
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: onHeartTap,
              icon: Icon(
                isliked ? Icons.favorite : Icons.favorite_border,
              ),
            )
          ],
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: widget.id,
                      child: Container(
                        width: 220,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              offset: const Offset(2, 6),
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.network(
                          widget.thumb,
                          headers: const {
                            "User-Agent":
                                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                  future: toonDetail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Text('...');
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                    future: toonEpisode,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            var episode = snapshot.data![index];
                            return EpisodesWidget(
                                episode: episode, webtoonId: widget.id);
                          }),
                          separatorBuilder: (context, index) => const Divider(
                            thickness: 1.2,
                          ),
                          itemCount: snapshot.data!.length,
                        );
                      }
                      return Container();
                    }),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }
}
