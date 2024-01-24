import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(child: Text(title,style:const TextStyle(fontSize: 30,fontWeight: FontWeight.w900))),
        IconButton(onPressed: () {},color: kcolor, icon: const Icon(Icons.cast)),
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        )
      ],
    );
  }
}
