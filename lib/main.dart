import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/core/helper/binding.dart';
import 'app/modules/app_navigation/view/navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins"
      ),
      initialRoute: "/home",
      initialBinding: MyBinding(),
      getPages: [
        GetPage(name: "/home", page:()=> const NavigationScreen()),
      ],
    );
  }
}