import 'package:get/get.dart';
import 'package:list/features/main/main_binding.dart';
import 'package:list/features/main/main_page.dart';
import 'package:list/core/routes/routes.dart';

class Pages {
  static const initial = Routes.none;

  static const main = Routes.main;

  static final routes = [

    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
  ];
  
}
