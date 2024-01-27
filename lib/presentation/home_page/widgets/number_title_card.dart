
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/model/movie.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/number_card.dart';

class NumberTitleCard extends StatelessWidget {
  Future<List<Movie>> MovieType;
   NumberTitleCard({
    super.key,required this.MovieType
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
          child: FutureBuilder(
            future: MovieType,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: _generateList(snapshot),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }
  List<Widget> _generateList(AsyncSnapshot snapshot) {
    List<Widget> generateList = List.generate(snapshot.data.length,
        (index) => NumberCard(snapshot: snapshot, index: index));
    return generateList;
  }
}
