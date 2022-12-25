import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/widgets/ads_widget.dart';
import 'package:flutter_task/app/core/widgets/category_item.dart';
import 'package:flutter_task/app/core/widgets/header_widget.dart';
import 'package:flutter_task/app/core/widgets/search_bar.dart';
import 'package:get/get.dart';
import '../../../core/widgets/address_item.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/deals_item.dart';
import '../../../theme/app_colors.dart';
import '../controller/grocery_controller.dart';

class GroceryScreen extends GetView<GroceryController> {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return buildBody(context);
  }

  Widget buildBody(context){
    final mediaQuery = MediaQuery.of(context).size;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width-20,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isLandscape)
                SizedBox(
                  height: mediaQuery.height * 0.02,
                ),
              SizedBox(
                  height: isLandscape ? mediaQuery.height * 0.09 : mediaQuery.height * 0.07,
                  child: const BuildHeaderWidget(
                    imgHeight: 32,
                    title: 'Mustafa St.',
                  )
              ),
              SizedBox(
                height: isLandscape
                    ? mediaQuery.height * 0.03
                    : mediaQuery.height * 0.001,
              ),
              BuildSearchWidget(),
              SizedBox(
                height: mediaQuery.height * 0.03,
              ),
              const BuildAddressWidget(),
              SizedBox(
                height: isLandscape
                    ? mediaQuery.height * 0.04
                    : mediaQuery.height * 0.028,
              ),
              SizedBox(
                height: isLandscape
                    ? mediaQuery.height * 0.07
                    : mediaQuery.height * 0.04,
                width: isLandscape?GetPlatform.isIOS?(mediaQuery.width-20) *.85 : (mediaQuery.width-20) :
                (mediaQuery.width-20) ,
                child: Row(
                  children: const [
                    CustomText(
                      text: 'Explore by Category',
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    Text(
                      'See All (36)',
                      style: TextStyle(
                          color: AppColors.textInputColor2,
                          fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.015,
              ),
              const BuildCategoryWidget(),
              SizedBox(
                height: mediaQuery.height * 0.007,
              ),
              SizedBox(
                height: isLandscape
                    ? mediaQuery.height * 0.04
                    : mediaQuery.height * 0.02,
                width: isLandscape?GetPlatform.isIOS?(mediaQuery.width-20) *.85 : (mediaQuery.width-20) :
                (mediaQuery.width-20) ,
                child: const CustomText(
                  text: 'Deals of the day',
                  fontWeight: FontWeight.w600,
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.025,
              ),
                BuildDealsWidget(),
              SizedBox(
                height: mediaQuery.height * 0.005,
              ),
              const AdsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
