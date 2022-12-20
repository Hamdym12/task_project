import 'package:get/get.dart';

class NavigationController extends GetxController{
  int navigatorValue = 0;

  void changeSelectedValue(int selectedValue){
    navigatorValue = selectedValue;
    update();
  }


}