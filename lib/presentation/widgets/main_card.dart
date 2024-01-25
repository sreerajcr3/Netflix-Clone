import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: borderRadius15,
            image: DecorationImage(
                image: NetworkImage(
                    "https://media.themoviedb.org/t/p/w220_and_h330_face/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
