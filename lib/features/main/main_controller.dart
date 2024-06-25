import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:list/features/home/home_binding.dart';
import 'package:list/features/home/home_page.dart';
import 'package:list/features/list/list_binding.dart';
import 'package:list/features/list/list_page.dart';

class MainController extends GetxController {
  final List<String> pages = ['/home', '/list','/home'];

  var currentIndex = 0.obs;

  void onTabChange(int index) {
    currentIndex.value = index;
    Get.offNamed(pages[index], id: 10); // Sử dụng nested navigation key
  }
  
  Route<dynamic>? onCreateRoutePage(RouteSettings settings) {
    if (settings.name == '/home') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomePage(),
        binding: HomeBinding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == "/list") {
      return GetPageRoute(
        settings: settings,
        page: () => const ListPage(),
        binding: ListBinding(),
        transition: Transition.fadeIn,
      );
    }

    // if (settings.name == "/list") {
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => const ListPage(),
    //     binding: ListBinding(),
    //     transition: Transition.fadeIn,
    //   );
    // }
    return null;
  }
}
