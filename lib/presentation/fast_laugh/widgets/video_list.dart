import 'package:flutter/material.dart';

class VideoLIst extends StatelessWidget {
  final int index;
  const VideoLIst({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left side
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.volume_off,size: 30,color: Colors.white,))),
              //right side
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 25 ,
                      backgroundImage: NetworkImage(
                        "https://media.themoviedb.org/t/p/w220_and_h330_face/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg",
                      ),
                    ),
                  ),
                  IconsVideoList(
                    iconPassed: Icons.emoji_emotions,
                    text:'Lol',
                  ),
                  IconsVideoList(
                    iconPassed: Icons.add,
                    text: 'My List',
                  ),
                  IconsVideoList(
                    iconPassed: Icons.share,
                    text:'Share'
                  ),
                  IconsVideoList(
                    iconPassed:Icons.play_arrow,
                    text: 'Play',
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class IconsVideoList extends StatelessWidget {
  final IconData iconPassed;
  final String text;
  const IconsVideoList({
    super.key,
    required this.text,
    required this.iconPassed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      child: Column(
        children: [Icon(iconPassed,color: Colors.white,size: 30,), Text(text,style: TextStyle(fontSize: 13),)],
      ),
    );
  }
}
