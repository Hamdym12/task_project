import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/deals_model.dart';
import '../../modules/grocery/controller/grocery_controller.dart';
import '../../theme/app_colors.dart';
import 'custom_text.dart';

class BuildDealsWidget extends StatelessWidget {
   BuildDealsWidget({Key? key}) : super(key: key);

  final GroceryController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: context.isLandscape ? mediaQuery.height * 0.3 : mediaQuery.height * 0.16,
      child: ListView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildListDealsItem(DealsModel.dealsData[index], index);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
              itemCount: DealsModel.dealsData.length),
        ],
      ),
    );
  }

  Widget buildListDealsItem(DealsModel product, int index) {
    final GroceryController controller = Get.find();
    final item = DealsModel.dealsData[index];
    return Row(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Align(
                alignment: const Alignment(0.8, -1.1),
                child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Obx(()=>
                          Center(
                          child: GestureDetector(
                          onTap: () {
                            controller.toggleFavorites(item);
                          },
                          child:
                             controller.isFavorite(item)?
                            const Icon(
                              CupertinoIcons.heart_fill,
                              size: 15,
                              color: Colors.red,
                            ) : const Icon(
                              CupertinoIcons.heart,
                              size: 15,
                              color: AppColors.navbarItemColor,
                            ),
                        ),
                      ),
                    )))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Summer Sun Ice Cream Pack',
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomText(
                text: 'Pieces 5',
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.textInputColor,
                    size: 18,
                  ),
                  CustomText(
                    text: '15 Minutes Away',
                    fontSize: 14,
                    height: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: const [
                  CustomText(
                    text: "\$12",
                    color: AppColors.priceColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: '\$ 18',
                    fontSize: 15,
                    decoration: TextDecoration.lineThrough,
                    color: Color(0xffACADAD),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
