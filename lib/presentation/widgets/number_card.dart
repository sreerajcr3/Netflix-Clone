import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(width: 60,height: 100,),
            Container(
                height: 170,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: borderRadius15,
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://media.themoviedb.org/t/p/w220_and_h330_face/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg"),
                        fit: BoxFit.cover)),
              ),
          ],
        ),
        Positioned(
          left: 30,
          bottom:0 ,
          
          child: BorderedText(
            strokeWidth: 10,
            child: Text('${index+1}',style: const TextStyle(fontSize: 100,decoration: TextDecoration.none,decorationColor:Colors.red ),)))
      ],
    );
  }
}