import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home_page/widgets/home_main_card.dart';
import 'package:netflix_clone/presentation/home_page/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card_home.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  final imageurl =
      "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/yNySAgpAnWmPpYinim9E0tUzJWG.jpg";
  final logo = "https://pngimg.com/uploads/netflix/netflix_PNG15.png";
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
                    ScrollNotifier.value == true
                        ? AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 80,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        logo,
                                        height: 30,
                                        width: 30,
                                      ),
                                      Spacer(),
                                      IconButton(
                                          onPressed: () {},
                                          color: kcolor,
                                          icon: const Icon(Icons.cast,size: 30,)),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    HomeAppbarText(text: 'TV Shows',),
                                HomeAppbarText(text: 'Movies',),
                                HomeAppbarText(text: 'Categories',)
                                  ],
                                ),
                              ],
                            ),
                          )
                        : height
                  ],
                ),
              );
            }));
  }
}

class HomeAppbarText extends StatelessWidget {
  final String text;
  const HomeAppbarText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),);
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
