import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home_page/screen_home.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';



class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height,
          const SearchTitle(title: "Top Searches"),
          Expanded(
            child: FutureBuilder(
              future: Top10Movies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return TopSearchItem(
                          snapshot: snapshot,
                          index: index,
                          title: snapshot.data![index].title,
                          moviePoster:Constants.imagePath+ snapshot.data![index].backdropPath,
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return height;
                      },
                      itemCount: snapshot.data!.length);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// List<Widget> _generateListSearch(AsyncSnapshot snapshot) {
//   List<Widget> generateList = List.generate(
//       snapshot.data.length,
//       (index) => TopSearchItem(
//           snapshot: snapshot,
//           index: index,
//           title: snapshot.data![index].title));
//   return generateList;
// }

class TopSearchItem extends StatelessWidget {
  final String title;
  final String moviePoster;
  const TopSearchItem({
    super.key,
    required this.snapshot,
    required this.index,
    required this.title,
    required this.moviePoster,
  });

  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: screenwidth * 0.35,
              height: 60,
             decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(moviePoster),fit: BoxFit.cover)),
            ),
            width,
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    color: kcolor, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const CircleAvatar(
              backgroundColor: kcolor,
              radius: 23,
              child: CircleAvatar(
                backgroundColor: blackcolor,
                radius: 21,
                child: Icon(
                  CupertinoIcons.play_fill,
                  color: kcolor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
