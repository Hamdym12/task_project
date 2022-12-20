import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/widgets/custom_text.dart';
import 'package:flutter_task/app/modules/cart/controller/cart_controller.dart';
import 'package:get/get.dart';
import '../../data/models/cart_model.dart';
import '../../theme/app_colors.dart';

buildDialog({
  BuildContext? context,
  String? productName,
  Color? productColor,
  int? productPrice,
  int? index,
 }){
  showDialog(context: context!, builder: (context){
    CartController cartController = Get.find();
    return Dialog(
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: const Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: productColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      CustomText(
                        text: productName,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10,),
                      CustomText(
                        text: "\$ ${productPrice.toString()}",
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: AppColors.priceColor,
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){
                      cartController.addProduct(ProductModel.products[index!]);
                    },
                    style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(AppColors.plusContainer)
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(
                          color: AppColors.plusIcon
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                onPressed: (){
                  Get.back();
                },
                style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(AppColors.bottomNavBarColor)
                ),
                child: const Text(
                  'close',
                ),
              )
            ],
          ),
        ),
      ),
    );
  });
}