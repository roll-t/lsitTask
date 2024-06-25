


import 'package:get/get.dart';
import 'package:list/features/main/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>MainController());
  }

}