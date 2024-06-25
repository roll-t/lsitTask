import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/core/ui/navigationbar_google.dart';
import 'package:list/features/main/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Navigator(
        key: Get.nestedKey(10),
        initialRoute: "/home",
        onGenerateRoute: controller.onCreateRoutePage,
      ),

      bottomNavigationBar:const NavigationbarGoogle(),

    );
  }
}
