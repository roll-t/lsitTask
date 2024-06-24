import 'package:get/get.dart';

class ListController extends GetxController{
  
  var showMainList=false.obs;

  var valueRadiobox="";

  var behindId="";
  
  bool toggleList({required String idList,required bool state}){
    state = !state;
    update([idList]);
    return state;
  }

}