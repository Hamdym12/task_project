import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/widgets/header_widget.dart';
import 'package:get/get.dart';
import '../../../core/widgets/added_to_cart_item.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../theme/app_colors.dart';
import '../controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
  final CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    final RxMap<dynamic, dynamic> newProducts = controller.products;
    return Scaffold(
      backgroundColor: AppColors.homeBackgroundColor,
      body: LayoutBuilder(
        builder: (ctx,constraints)=> Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight *0.012,),
                SizedBox(
                  height:context.isLandscape?
                  constraints.maxHeight *0.13: constraints.maxHeight *0.1,
                  child: const BuildHeaderWidget(
                    imgHeight: 34,
                    title: "Oxford street",
                  ),
                ),
                 SizedBox(height: constraints.maxHeight *0.03,),
                SizedBox(
                  height: constraints.maxHeight *0.05,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: CustomText(
                      text: "Cart",
                      fontSize: 16,
                      color: Color(0xff474747),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                    height:context.isLandscape?
                  constraints.maxHeight *0.72 :constraints.maxHeight *0.75 ,
                    width: (context.isLandscape && GetPlatform.isIOS) ?
                    (Get.width-20) * 0.85 : (Get.width-20),
                  child: Obx(
                        () => newProducts.isEmpty
                        ? const Center(
                         child: Text("Your cart is empty, try to add some products"),
                    ) :
                    SizedBox(
                      child: ListView.builder(
                        itemCount: newProducts.length,
                        itemBuilder: (context, index) => AddedToCartItem(
                          index: index,
                          controller: controller,
                          product: newProducts.keys.toList()[index],
                          quantity: newProducts.values.toList()[index],
                        ),
                      ),
                    ),
                  )
                ),
                SizedBox(height: constraints.maxHeight *0.058,),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
