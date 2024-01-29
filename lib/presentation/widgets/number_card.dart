import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final AsyncSnapshot snapshot;

  const NumberCard({super.key, required this.index, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 60,
              height: 100,
            ),
            SizedBox(
              height: 170,
              width: 120,
              child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[index].posterPath}'),
            ),
          ],
        ),
        Positioned(
          left: 30,
          bottom: 0,
          child: BorderedText(
            strokeWidth: 10,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  fontSize: 100,
                  decoration: TextDecoration.none,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
