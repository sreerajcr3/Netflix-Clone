import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/presentation/new_&_hot/widgets/EveryonesWatching_card.dart';
import 'package:netflix_clone/presentation/new_&_hot/widgets/Icons.dart';

class NewAndHotMainCard extends StatelessWidget {
  const NewAndHotMainCard({
    super.key, required this.snapshot, required this.index, required this.title, required this.overview, required this.date,
  });
   final AsyncSnapshot snapshot;
  final int index;
 final String title;
 final String overview;
 final DateTime date;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(
          width: 50,
         // height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                DateFormat('MMM').format(date).toUpperCase(),
                
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
               DateFormat('dd').format(date),
                style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold),
              ),height,
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
         // height: 500,
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EveryonesWatchingCardImage(snapshot: snapshot,index: index,),
             const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                    // child: Text(
                    //   title,
                    //   style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 35,
                    //       letterSpacing: -3),
                    // ),
                  
                  height,
                   Row(
                    children: [
                      IconWidget(
                          icon: Icons.notifications_off_outlined,
                          text: 'Remind Me'),
                      width,
                      IconWidget(
                        icon: Icons.info_outline_rounded,
                        text: "Info",
                      )
                    ],
                  )
                ],
              ),
              height,
              const Text("Coming on Friday"),
              height,
               Text(
               title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
             height,
               Text(
               overview,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              height
            ],
          ),
          
        ),
      ],
    );
    
  }
}


