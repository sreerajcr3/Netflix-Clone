import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/presentation/home_page/widgets/home_main_card.dart';
import 'package:netflix_clone/presentation/home_page/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card_home.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  final imageurl =
      "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/yNySAgpAnWmPpYinim9E0tUzJWG.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: ScrollNotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;

                  if (direction == ScrollDirection.reverse) {
                    ScrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    ScrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        HomeMainCard(imageurl: imageurl),
                        const MainTitleCard(
                          title: 'Released in the past year',
                        ),
                        const MainTitleCard(title: 'Trending now'),
                        const NumberTitleCard(),
                        const MainTitleCard(title: 'Tense Dramas'),
                        const MainTitleCard(title: 'South Indian Cinemas')
                      ],
                    ),
                  ScrollNotifier.value == true?  Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.deepPurpleAccent,
                    ):height
                  ],
                ),
              );
            }));
  }
}

class HomeStackIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const HomeStackIcon({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        Text(text)
      ],
    );
  }
}
