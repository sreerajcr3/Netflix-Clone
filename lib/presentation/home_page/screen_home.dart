import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/model/movie.dart';
import 'package:netflix_clone/presentation/home_page/widgets/home_main_card.dart';
import 'package:netflix_clone/presentation/home_page/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card_home.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

late Future<List<Movie>> trendingMovies;
late Future<List<Movie>> nowPlayingMovies;
late Future<List<Movie>> upComingMovies;
late Future<List<Movie>> Top10Movies;

class _ScreenHomeState extends State<ScreenHome> {
  final imageurl =
      "https://mir-s3-cdn-cf.behance.net/project_modules/1400/30ffaa58808319.5bf4f5ed3e17a.jpg";

  final logo = "https://pngimg.com/uploads/netflix/netflix_PNG15.png";

  @override
  initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    nowPlayingMovies = Api().getPopularMovie();
    upComingMovies = Api().getUpComingMovies();
    Top10Movies = Api().getTop10Movies();
  }

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
                        MainTitleCard(
                          title: 'Now Playing',
                          MovieType: nowPlayingMovies,
                        ),
                        MainTitleCard(
                          title: 'Trending now',
                          MovieType: trendingMovies,
                        ),
                        NumberTitleCard(MovieType: Top10Movies,),
                        MainTitleCard(
                          title: 'Upcoming',
                          MovieType: upComingMovies,
                        ),
                        MainTitleCard(
                          title: 'Trending now',
                          MovieType: trendingMovies,
                        ),
                      ],
                    ),
                    ScrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 80,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        logo,
                                        height: 30,
                                        width: 30,
                                      ),
                                      const Spacer(),
                                      // IconButton(
                                      //     onPressed: () {},
                                      //     color: kcolor,
                                      //     icon: const Icon(
                                      //       Icons.cast,
                                      //       size: 30,
                                      //     )),
                                          widget,
                                      // SizedBox(
                                      //   width: 30,
                                      //   height: 30,
                                      //  child: Image.network("https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-88wkdmjrorckekha.jpg"),
                                      // )
                                    ],
                                  ),
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    HomeAppbarText(
                                      text: 'TV Shows',
                                    ),
                                    HomeAppbarText(
                                      text: 'Movies',
                                    ),
                                    HomeAppbarText(
                                      text: 'Categories',
                                    )
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
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
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
