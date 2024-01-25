import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    MainTitle(text: title),
    height,
    LimitedBox(
      maxHeight: 200,
      child: ListView(
       // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) => HomeMovieCard()),
      ),
    )
      ],
    );
  }
}