import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/video_list.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
              scrollDirection: Axis.vertical,
      children: 
        List.generate(10, (index) {
          return VideoLIst(index:index ,);
        }),
      
    )));
  }
}
