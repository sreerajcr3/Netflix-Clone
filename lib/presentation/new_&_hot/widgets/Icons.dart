import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kcolor,size: 18,
        ),
        Text(text,style: TextStyle(fontSize: 13),)
      ],
    );
  }
}