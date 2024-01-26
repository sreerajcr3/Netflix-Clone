import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/new_&_hot/new_n_hot.dart';

class EveryonesWatchingCard extends StatelessWidget {
  const EveryonesWatchingCard({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imageurl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 5,
          child: CircleAvatar(
            radius: 25,
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