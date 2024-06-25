

import 'package:get/get.dart';
import 'package:list/features/list/list_controller.dart';

class ListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ListController());
  }

}