import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
   final title;
  const SearchTitle({
    super.key,required this.title,
  });
 

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}