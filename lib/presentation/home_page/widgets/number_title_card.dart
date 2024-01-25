
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(text: 'Top 10 cinemas'),
        height,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => NumberCard(index: index,)),
          ),
        )
      ],
    );
  }
}
