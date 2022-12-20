import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/deals_model.dart';
import '../../modules/grocery/controller/grocery_controller.dart';
import '../../theme/app_colors.dart';
import 'custom_text.dart';

class BuildInFavoriteItem extends StatelessWidget {
   BuildInFavoriteItem({Key? key, required this.index}) : super(key: key);

  final int index;
  final GroceryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final item = DealsModel.dealsData[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        if(Get.size.width > 400)
        const SizedBox(width:20 ,),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Summer Sun Ice Cream Pack',
                fontWeight: FontWeight.w600,
                fontSize: 14,
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
                    size: 17,
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
        ),
        (Get.size.width > 400)?
          const SizedBox(width:20 ,):const SizedBox(width:5 ,),
        Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Obx(()=>
                 GestureDetector(
                  onTap: () {
                    controller.toggleFavorites(item);
                  },
                  child:
                  controller.isFavorite(item)?
                  const Icon(
                    CupertinoIcons.heart_fill,
                    size: 25,
                    color: Colors.red,
                  ) : const Icon(
                    CupertinoIcons.heart,
                    size: 25,
                    color: AppColors.navbarItemColor,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
