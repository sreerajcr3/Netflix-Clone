import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
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
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const NewAndHotMainCard();
        });
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return EverybodyswatchingCard();
      },
    
    );
  }
}

class EverybodyswatchingCard extends StatelessWidget {
  const EverybodyswatchingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EveryonesWatchingCard(),
        height,
        Row(
          children: [
            IconWidget(icon: Icons.share, text: "Share"),
            IconWidget(icon: Icons.add, text: "My List"),
            IconWidget(icon: Icons.play_arrow, text: "Play")
          ],
        ),
        height,
        Text(
          'Lost in Space',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        height,
        Text(
          "This hit sitcon follows the merry misadventures of six 20- something pals as they navigates the pitfalls of work life and love in 1990's manhattan",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ],
    );
  }
}
