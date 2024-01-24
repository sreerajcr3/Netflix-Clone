import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(children: [
        MainTitle(text: 'Released in the past year '),
      ],)
    ); 
  }
}
 