import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({
    super.key,
    required this.snapshot,
    required this.index,
  });
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 150,
        width: 120,
        child: Image.network(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            '${Constants.imagePath}${snapshot.data[index].posterPath}'),
      ),
    );
  }
}
