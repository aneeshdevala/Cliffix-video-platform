import 'package:cliffix/app/modules/navigation_screen/view_model/navcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class NaveScreen extends GetView<NavController> {
  NaveScreen({Key? key}) : super(key: key);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              backgroundColor: Colors.yellow,
              label: "Home",
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: "Explore",
              activeIcon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: "Add",
              activeIcon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Favorite",
              activeIcon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: "Library",
              activeIcon: Icon(Icons.video_library),
            ),
          ]),
    );
  }
}
