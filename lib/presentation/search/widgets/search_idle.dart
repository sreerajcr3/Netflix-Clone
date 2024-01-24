import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageurl =
    "https://media.themoviedb.org/t/p/w250_and_h141_face/j9LCCCMec4M3lYRKFmksfMfTVZq.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height,
        SearchTitle(title: "Top Searches"),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItem(),
              separatorBuilder: (ctx, index) => listviewheight,
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  const TopSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 60,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageurl))),
        ),
        width,
        const Expanded(
            child: Text(
          "Movie Name",
          style: TextStyle(
              color: kcolor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
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
    );
  }
}
