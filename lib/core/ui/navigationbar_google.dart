import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:list/features/main/main_controller.dart';

class NavigationbarGoogle extends StatelessWidget {
  const NavigationbarGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find();
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: GNav(
            selectedIndex: controller.currentIndex.value,
            color: Colors.grey,
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            tabBorderRadius: 15,
            activeColor: Colors.white,
            mainAxisAlignment: MainAxisAlignment.center,
            onTabChange: controller.onTabChange,
            tabs: const [
              GButton(icon: Icons.home),
              GButton(icon: Icons.favorite),
              GButton(icon: Icons.search),
            ],
          ),
        ),
      ),
    );
  }
}
