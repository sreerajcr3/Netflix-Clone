import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/presentation/new_&_hot/widgets/EveryonesWatching_card.dart';
import 'package:netflix_clone/presentation/new_&_hot/widgets/Icons.dart';

class NewAndHotMainCard extends StatelessWidget {
  const NewAndHotMainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child:  const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EveryonesWatchingCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TALL GIRL 2",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        letterSpacing: -3),
                  ),
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
              Text("Coming on Friday"),
              height,
              Text(
                'Tall Girl 2',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              height,
              Text(
                "Landing the lead in the school musical is a dream come true for jodi, until the pressure send her confidence - and her relationship - into a tallspain",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}


