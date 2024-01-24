import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});
  final imageurl =  "https://media.themoviedb.org/t/p/w220_and_h330_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitle(title: 'Movies & TV'),
        height,
        Expanded(child: GridView.count(crossAxisCount: 3,mainAxisSpacing: 8,childAspectRatio: 1/1.4,
        crossAxisSpacing: 8,
        shrinkWrap: true,children: List.generate(20, (index) => MainCard())

        ,))
      ],
    );
  }
}
class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(7),
    image: DecorationImage(image: NetworkImage(imageurl,),fit:BoxFit.cover )
  ),
    );
  }
}