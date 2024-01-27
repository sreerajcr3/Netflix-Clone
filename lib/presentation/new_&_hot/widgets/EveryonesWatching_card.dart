import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class EveryonesWatchingCardImage extends StatelessWidget {
  const EveryonesWatchingCardImage({
    super.key, required this.snapshot, required this.index,
  });
   final AsyncSnapshot snapshot;
  final int index;

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            '${Constants.imagePath}${snapshot.data[index].posterPath}'),
        ),
        Positioned(
          bottom: 10,
          right: 5,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: const Icon(
              Icons.volume_off,
              color: kcolor,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}