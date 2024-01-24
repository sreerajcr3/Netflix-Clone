import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final widgetList = [const smartDownloads(), Section2(), const section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            title: 'Title passed',
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => widgetList[index],
        itemCount: widgetList.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 25,
        ),
      ),
    );
  }
}

class section3 extends StatelessWidget {
  const section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: blueColorbutton,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                    color: kcolor, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
        height,
        MaterialButton(
          color: kcolor,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: blackcolor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List image = [
    "https://media.themoviedb.org/t/p/w220_and_h330_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/tAmTVjK8fDgFBFYIpa0GqfuIoPe.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Download for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kcolor, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        height,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you, so there will always\nsomething to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        height,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              downloadsImage(
                image: image[0],
                margin: const EdgeInsets.only(left: 170, top: 50, bottom: 30),
                angle: 20,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              downloadsImage(
                image: image[1],
                margin: const EdgeInsets.only(right: 170, top: 50, bottom: 30),
                angle: -20,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              downloadsImage(
                image: image[2],
                margin: const EdgeInsets.only(bottom: 20, top: 50),
                size: Size(size.width * 0.4, size.width * 0.6),
                radius: 5,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class smartDownloads extends StatelessWidget {
  const smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width,
        const Icon(
          Icons.settings,
          color: kcolor,
        ),
        width,
        const Text("Smart Downloads")
      ],
    );
  }
}

class downloadsImage extends StatelessWidget {
  const downloadsImage({
    super.key,
    required this.image,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });
  final Size size;
  final double angle;
  final String image;
  final EdgeInsets margin;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
      ),
    );
  }
}
