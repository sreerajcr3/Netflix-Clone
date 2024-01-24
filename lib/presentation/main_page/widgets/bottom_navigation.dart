import 'package:flutter/material.dart';

ValueNotifier<int> currentIndex = ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: newIndex,
              onTap: (index) => currentIndex.value = index,
              elevation: 0,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.collections,
                    ),
                    label: "New & Hot"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.emoji_emotions,
                    ),
                    label: "Fast Laughs"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.download,
                    ),
                    label: "Downloads")
              ]);
        });
  }
}
