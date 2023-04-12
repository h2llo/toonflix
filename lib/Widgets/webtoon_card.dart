import 'package:flutter/material.dart';
import 'package:toonflix/Screens/detail_screen.dart';

class WebtoonCard extends StatelessWidget {
  final String title, thumb, id;

  const WebtoonCard({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      title: title,
                      thumb: thumb,
                      id: id,
                    )));
      },
      child: Column(
        children: [
          Hero(
            tag: id,
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
                thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
