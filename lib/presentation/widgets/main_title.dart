import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
 final String text;
   MainTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),);
  }
}