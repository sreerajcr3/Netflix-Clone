import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/download_page/download_page.dart';
import 'package:netflix_clone/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix_clone/presentation/home_page/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_navigation.dart';
import 'package:netflix_clone/presentation/new_&_hot/new_n_hot.dart';
import 'package:netflix_clone/presentation/search/search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
    ScreenHome(),
    ScreenNewNHot(),
    FastLaugh(),
    SearchPage(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, int newIndex, _) {
                return pages[newIndex];
              }),
        ),
        bottomNavigationBar: BottomNavigationBarWidget());
  }
}
