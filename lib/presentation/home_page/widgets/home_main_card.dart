import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home_page/screen_home.dart';

class HomeMainCard extends StatelessWidget {
  const HomeMainCard({
    super.key,
    required this.imageurl,
  });

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 HomeStackIcon(icon: Icons.add,text: "My List",),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                  ),
                  label: const Text('Play',style: TextStyle(color: blackcolor),),
                  style: const ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.white),iconColor: MaterialStatePropertyAll(blackcolor)
                  ),
                ),
                   HomeStackIcon(icon: Icons.info,text: "Info",),
              ],
            ),
          ),
        )
      ],
    );
  }
}