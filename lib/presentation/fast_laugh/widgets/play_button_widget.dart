import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayButton extends StatefulWidget {
  final VideoPlayerController playerController;

  const VideoPlayButton({super.key, required this.playerController});

  @override
  State<VideoPlayButton> createState() => _VideoPlayButtonState();
}

class _VideoPlayButtonState extends State<VideoPlayButton> {
  bool isPlaying = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                if (isPlaying) {
                  widget.playerController.pause();
                } else {
                  widget.playerController.play();
                }
              });
              isPlaying = !isPlaying;
            },
            icon: isPlaying
                ? const Icon(
                    Icons.pause,
                    color: kcolor,
                    size: 30,
                  )
                : const Icon(
                    Icons.play_arrow,
                    color: kcolor,
                    size: 30,
                  )),
        isPlaying
            ? const Text(
                'Pause',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : const Text(
                "Play",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
      ],
    );
  }
}
