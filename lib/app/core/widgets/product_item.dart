import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/models/cart_model.dart';
import 'package:flutter_task/app/modules/cart/controller/cart_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../theme/app_colors.dart';
import 'custom_text.dart';

class BuildProductCartItem extends StatelessWidget{
  final int index;

   BuildProductCartItem({
     Key? key,
     required this.index,
   }) : super(key: key);

  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: const EdgeInsets.symmetric(horizontal: 10),
     height: 70,
     child: Row(
       children: [
         Container(
           height:56,
           width: 56,
           decoration: BoxDecoration(
             color: ProductModel.products[index].productColor,
             borderRadius: BorderRadius.circular(15),
           ),
         ),
         const SizedBox(width: 20,)
         ,Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children:  [
             CustomText(
               text: ProductModel.products[index].productName.toString(),
               fontWeight: FontWeight.w500,
               fontSize: 16,
             ),
             const SizedBox(
               height: 7,
             ),
              CustomText(
               text: '\$ ${ProductModel.products[index].price.toString()}',
               fontSize: 16,
               color: AppColors.productPrice,
               fontWeight: FontWeight.w300
               ,),
           ],
         ),
         const Spacer(),
         Container(
           height:30,
           width: 30,
           decoration: BoxDecoration(
             color: AppColors.plusContainer,
             borderRadius: BorderRadius.circular(8),
           ),
           child:  Center(
             child: InkWell(
                 onTap: (){
                   cartController.addProduct(ProductModel.products[index]);
                 },
                 child: const Icon( Icons.add,color: AppColors.plusIcon,)),
           ),
         ),
       ],
     ),
   );
  }
}