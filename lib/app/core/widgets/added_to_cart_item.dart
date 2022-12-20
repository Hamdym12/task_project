import 'package:flutter/material.dart';
import '../../data/models/cart_model.dart';
import '../../modules/cart/controller/cart_controller.dart';
import '../../theme/app_colors.dart';
import 'custom_text.dart';

class AddedToCartItem extends StatelessWidget {
  final CartController controller;
  final ProductModel product;
  final int index;
  final int quantity;

  const AddedToCartItem({
    Key? key,
    required this.controller,
    required this.product,
    required this.index,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: product.productColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              CustomText(
                text: product.productName.toString(),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              const SizedBox(height: 6,),
              CustomText(
                text: product.quantity.toString(),
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColors.cartQuantity,
              ),
              const SizedBox(height: 6,),
              CustomText(
                text: '\$ ${product.price.toString()}',
                fontSize: 16,
                color: const Color(0xffB13E55),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),

          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColors.plusContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: InkWell(
                  onTap: () {
                    controller.removeProduct(product);
                  },
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.plusIcon,
                  )),
            ),
          ),
          CustomText(
            text: quantity.toString(),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColors.plusContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: InkWell(
                  onTap: () {
                    controller.addProduct(product);
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.plusIcon,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}