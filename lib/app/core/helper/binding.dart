import 'package:get/get.dart';
import '../../modules/app_navigation/controller/navigation_controller.dart';
import '../../modules/grocery/controller/grocery_controller.dart';

class MyBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut<NavigationController>(() => NavigationController());
   Get.put(GroceryController());
  }
}