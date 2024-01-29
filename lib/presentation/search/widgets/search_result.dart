// import 'package:flutter/material.dart';
// import 'package:netflix_clone/constants/constants.dart';
// import 'package:netflix_clone/presentation/home_page/screen_home.dart';
// import 'package:netflix_clone/presentation/search/widgets/title.dart';

// class SearchResult extends StatelessWidget {
//   const SearchResult({super.key});
//   final imageurl =
//       "https://media.themoviedb.org/t/p/w220_and_h330_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg";
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SearchTitle(title: 'Movies & TV'),
//         height,
//         SizedBox(
//           // height: 400,
//           child: FutureBuilder(
//             future: Top10Movies,
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text(snapshot.error.toString()),
//                 );
//               } else if (snapshot.hasData) {
//                 return GridView.count(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 8,
//                   childAspectRatio: 1 / 1.4,
//                   crossAxisSpacing: 8,
//                   shrinkWrap: true,
//                   children: List.generate(
//                       snapshot.data!.length,
//                       (index) => MainCard(
//                             snapshot: snapshot,
//                             index: index,
//                             image: Constants.imagePath +
//                                 snapshot.data![index].posterPath,
//                           )),
//                 );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         )
//       ],
//     );
//   }
// }

// //    GridView.count(
// //             crossAxisCount: 3,
// //             mainAxisSpacing: 8,
// //             childAspectRatio: 1 / 1.4,
// //             crossAxisSpacing: 8,
// //             shrinkWrap: true,
// //             children: List.generate(20, (index) => const MainCard()),
// //           ),
// // }

//  FutureBuilder(
//           future: Top10Movies,
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(snapshot.error.toString()),
//               );
//             } else if (snapshot.hasData) {
//               return ListView.separated(
//                   shrinkWrap: true,
//                   itemBuilder: ((context, index) {
//                     return TopSearchItem(
//                       snapshot: snapshot,
//                       index: index,
//                       title: snapshot.data![index].title,
//                       moviePoster:Constants.imagePath+ snapshot.data![index].backdropPath,
//                     );
//                   }),
//                   separatorBuilder: (context, index) {
//                     return height;
//                   },
//                   itemCount: snapshot.data!.length);
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),

// class MainCard extends StatelessWidget {
//   final AsyncSnapshot snapshot;
//   final String image;
//   final int index;
//   const MainCard(
//       {super.key,
//       required this.snapshot,
//       required this.index,
//       required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(7),
//           image: DecorationImage(
//               image: NetworkImage(
//                 image,
//               ),
//               fit: BoxFit.cover)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/presentation/home_page/screen_home.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});
  final imageurl =
      "https://media.themoviedb.org/t/p/w220_and_h330_face/qhb1qOilapbapxWQn9jtRCMwXJF.jpg";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTitle(title: 'Movies & TV'),
          height,
          FutureBuilder(
              future: trendingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1 / 1.4,
                      crossAxisSpacing: 8,
                      shrinkWrap: true,
                      children: List.generate(
                          18,
                          (index) => MainCard(
                                poster: Constants.imagePath +
                                    snapshot.data![index].posterPath,
                              )),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  final String poster;
  const MainCard({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: NetworkImage(
                poster,
              ),
              fit: BoxFit.cover)),
    );
  }
}
