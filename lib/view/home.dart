import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile/profile_page.dart';
import 'recipe/recipe_add.dart';
import 'recipe/recipe_home.dart';
import 'package:recipe_app/controller/tab_bar_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    Get.put(TabBarController());
  }

  final List<Widget> bodies = [
    const RecipeHome(),
    const RecipeAdd(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final TabBarController tabController = Get.find<TabBarController>();
      return Scaffold(
        body: bodies[tabController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabController.currentIndex.value,
          backgroundColor: Theme.of(context).primaryColor,
          iconSize: 30,
          selectedIconTheme: const IconThemeData(size: 36),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: tabController.onTabTapped,
          items: [
            const BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              icon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              label: 'Add Recipe',
            ),
            const BottomNavigationBarItem(
              activeIcon: Icon(Icons.people),
              icon: Icon(Icons.people_outline),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
