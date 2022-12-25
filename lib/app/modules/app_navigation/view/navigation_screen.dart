import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/cart/controller/cart_controller.dart';
import 'package:flutter_task/app/theme/app_colors.dart';
import 'package:flutter_task/app/core/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../cart/view/cart_screen.dart';
import '../../favorite/view/favorite_screen.dart';
import '../../grocery/view/grocery_screen.dart';
import '../../news/view/news_screen.dart';
import '../controller/navigation_controller.dart';

class NavigationScreen extends StatelessWidget {
   const NavigationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controllerCart = Get.put(CartController());
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return GetBuilder<NavigationController>(
      init: NavigationController(),
        builder: (controller) => Scaffold(
          backgroundColor: AppColors.homeBackgroundColor,
              body: SafeArea(
                left: false,
                right: false,
                child: IndexedStack(
                  index: controller.navigatorValue,
                  children:   [
                    const GroceryScreen(),
                    const NewsScreen(),
                     FavoriteScreen(),
                     CartScreen()
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.navBarBackgroundColor,
                selectedItemColor: AppColors.bottomNavBarColor,
                unselectedItemColor: AppColors.navbarItemColor,
                selectedIconTheme: const IconThemeData(
                  color: AppColors.bottomNavBarColor,
                ),
                selectedFontSize: 12,
                currentIndex: controller.navigatorValue,
                onTap: controller.changeSelectedValue,
                items: const [
                  BottomNavigationBarItem(
                    label: "Grocery",
                    icon: Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Icon(
                          Icons.storefront,
                          size: 25,
                        )),
                  ),
                  BottomNavigationBarItem(
                      label: "News",
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Icon(
                            CupertinoIcons.bell,
                            size: 25,
                          ))),
                  BottomNavigationBarItem(
                      label: "Favorite",
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Icon(
                            CupertinoIcons.heart,
                            size: 25,
                          ))),
                  BottomNavigationBarItem(
                      label: "Cart",
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 25,
                          ))),
                ],
              ),
              floatingActionButton: Visibility(
                visible: !keyboardIsOpen,
                child: FloatingActionButton(
                  backgroundColor: AppColors.bottomNavBarColor,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6,top: 0),
                        child: Image.asset(
                          'assets/images/floatImage.png',
                          width: 35,
                        ),
                      ),
                       Obx(() {
                         var totalQ = controllerCart.total.toString().split('.');
                         return Padding(
                           padding: const EdgeInsets.only(bottom: 3,right: 10),
                           child: CustomText(
                            text:"\$${totalQ[0]}",
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                             fontSize: 12,
                      ),
                         );
                       },
                       ),
                    ],

                  ),
                  onPressed: () {},
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ));
  }
}
