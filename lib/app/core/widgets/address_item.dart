import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/adress_model.dart';
import '../../modules/grocery/controller/grocery_controller.dart';
import '../../theme/app_colors.dart';
import 'custom_text.dart';

class BuildAddressWidget extends StatelessWidget {
  const BuildAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: context.isLandscape
          ? mediaQuery.height * 0.18
          : mediaQuery.height * 0.09,
      child: ListView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              GetBuilder<GroceryController>(
                init: GroceryController(),
                builder:(controller)=> ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        buildListItem(AddressDataModel.listItemsInfo[index],context),
                    separatorBuilder: (context, index)
                    => const SizedBox(width: 10,),
                    itemCount: AddressDataModel.listItemsInfo.length
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget buildListItem(AddressDataModel model,context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 8),
      width:
      isLandscape?
      GetPlatform.isIOS ?
      (MediaQuery.of(context).size.width-30)/2.3 : (MediaQuery.of(context).size.width-30)/2:
      (MediaQuery.of(context).size.width-30)/2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.textFieldBorderColor,
          )),
      child: LayoutBuilder(
        builder: (context,constraints)=> Row(
          children: [
            Container(
              height: constraints.maxHeight * 0.7,
              width: 44,
              decoration: BoxDecoration(
                color: const Color(0xffE3DDD6),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: model.address,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  Text(
                    model.name.toString(),
                    style: const TextStyle(
                        color: AppColors.textFieldInputColor,
                        fontSize: 11.5,

                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    model.street.toString(),
                    style: const TextStyle(
                        color: AppColors.textFieldInputColor,
                        fontSize: 11,
                        height: 1.2,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
