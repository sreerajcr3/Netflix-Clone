import 'package:flutter/material.dart';
import 'package:netflix_clone/assets/assets.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/play_button_widget.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoLIstState();
}

class _VideoLIstState extends State<VideoListItem> {
  VideoPlayerController? playerController;
  bool isVolumeOn = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      playerController =
          VideoPlayerController.networkUrl(Uri.parse(videoList[widget.index]));
    });
    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(4);
    playerController!.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          // width: playerController!.value.size.width,
          // height: playerController!.value.size.height,
          child: VideoPlayer(playerController!),
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
                  onPressed: () {
                    setState(() {
                      isVolumeOn == false
                          ? playerController!.setVolume(4)
                          : playerController!.setVolume(0);
                      isVolumeOn = !isVolumeOn;
                    });
                  },
                  icon: isVolumeOn
                      ? const Icon(Icons.volume_up,color: Colors.white,)
                      : const Icon(Icons.volume_off),color: Colors.white,
                ),
              ),
              //right side
               Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                       images[widget.index],
                      ),
                    ),
                  ),
                  const IconsVideoList(
                    iconPassed: Icons.emoji_emotions,
                    text: 'Lol',
                  ),
                  const IconsVideoList(
                    iconPassed: Icons.add,
                    text: 'My List',
                  ),
                  const IconsVideoList(iconPassed: Icons.share, text: 'Share'),
                 VideoPlayButton(playerController: playerController!)
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Column(
        children: [
          Icon(
            iconPassed,
            color: Colors.white,
            size: 30,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
