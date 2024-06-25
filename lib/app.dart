import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/core/configs/colors.dart';
import 'package:list/core/routes/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Pages.main,
      getPages: Pages.routes,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
        scaffoldBackgroundColor:AppColors.white, 
      ),
    );
  }
}
