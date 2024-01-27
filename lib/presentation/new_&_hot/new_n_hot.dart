import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home_page/screen_home.dart';
import 'package:netflix_clone/presentation/new_&_hot/widgets/EveryonesWatching_card.dart';
import 'package:netflix_clone/presentation/new_&_hot/widgets/Icons.dart';
import 'package:netflix_clone/presentation/new_&_hot/widgets/hot_and_new_widget.dart';

const imageurl =
    "https://media.themoviedb.org/t/p/w355_and_h200_multi_faces/rx6FXL5Pu2FQC3HrowNQrdqojnM.jpg";

class ScreenNewNHot extends StatelessWidget {
  const ScreenNewNHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(95),
            child: AppBar(
              title: const Text("New & Hot",
                  style: TextStyle(
                      color: kcolor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900)),
              actions: [
                IconButton(
                    onPressed: () {},
                    color: kcolor,
                    icon: const Icon(Icons.cast)),
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                )
              ],
              bottom: TabBar(
                  dividerColor: blackcolor,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: -20),
                  //   labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  isScrollable: true,
                  labelColor: blackcolor,
                  unselectedLabelColor: kcolor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kcolor, borderRadius: borderRadius30),
                  tabs: const [
                    Tab(
                      text: "🍿 Comming Soon",
                    ),
                    Tab(
                      text: " 👀 Everyone's watching",
                    )
                  ]),
            )),
        body: TabBarView(children: [
          _buildComingSoon(context),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon(context) {
    return FutureBuilder(
      future: trendingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return ListView(
            children: _generateList(snapshot),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<Widget> _generateList(AsyncSnapshot snapshot) {
    List<Widget> generateList = List.generate(
      snapshot.data.length,
      (index) => NewAndHotMainCard(
        date: snapshot.data![index].releaseDate,
        snapshot: snapshot,
        index: index,
        title: snapshot.data![index].title,
        overview: snapshot.data![index].overview,
      ),
    );
    return generateList;
  }

  List<Widget> _generateListEveryonesWatching(AsyncSnapshot snapshot) {
    List<Widget> generateList = List.generate(
      snapshot.data.length,
      (index) => EverybodyswatchingCard(
        snapshot: snapshot,
        index: index,
        title: snapshot.data![index].title,
        overview: snapshot.data![index].overview,
      ),
    );
    return generateList;
  }

  Widget _buildEveryonesWatching() {
    return FutureBuilder(
      future: upComingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return ListView(
            children: _generateListEveryonesWatching(snapshot),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class EverybodyswatchingCard extends StatelessWidget {
  const EverybodyswatchingCard({
    super.key,
    required this.snapshot,
    required this.index,
    required this.title,
    required this.overview,
  });
  final AsyncSnapshot snapshot;
  final int index;
  final String title;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EveryonesWatchingCardImage(
          snapshot: snapshot,
          index: index,
        ),
        height,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconWidget(icon: Icons.share, text: "Share"),
            width,
            IconWidget(icon: Icons.add, text: "My List"),
            width,
            IconWidget(icon: Icons.play_arrow, text: "Play")
          ],
        ),
        height,
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        height,
        Text(
          overview,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        height,
      ],
    );
  }
}
