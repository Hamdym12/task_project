import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/cart_model.dart';
import 'custom_text.dart';
import 'dialoge_widget.dart';

class BuildCategoryWidget extends StatelessWidget {
  const BuildCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: context.isLandscape
          ? mediaQuery.height * 0.3
          : mediaQuery.height * 0.13,
      child: ListView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    buildListItem2(ProductModel.products[index],context,index),
                separatorBuilder: (context, index) =>
                const SizedBox(
                  width: 10,
                ),
                itemCount: ProductModel.products.length),
        ],
      ),
    );
  }

  Widget buildListItem2(ProductModel model,context,int index) {
    return InkWell(
      onTap:(){
        buildDialog(
          context: context,
          productColor: model.productColor,
          productName: model.productName,
          productPrice: model.price,
          index: index
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: model.productColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const  SizedBox(height: 8,),
          CustomText(
            text:model.productName,
            fontWeight: FontWeight.w300,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}
