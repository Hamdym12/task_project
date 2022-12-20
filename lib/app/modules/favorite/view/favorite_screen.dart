import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/grocery/controller/grocery_controller.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/in_favorite_item.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({Key? key}) : super(key: key);
  final  controller = Get.put(GroceryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       LayoutBuilder(
        builder: (ctx,constraints)=> Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight *0.05,),
                SizedBox(
                  height: constraints.maxHeight *0.07,
                  child: const CustomText(
                    text: "Favorites",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                      SizedBox(
                        height: constraints.maxHeight *.78,
                        width: (context.isLandscape && GetPlatform.isIOS) ?
                          (Get.width-40) * 0.83 : (Get.width-40)
                          ,
                        child: Obx(()=>
                        controller.favorites.isEmpty ?
                        const Center(
                          child: Text(
                              "Your Favorite is empty, try to add some products",
                            textAlign: TextAlign.center,
                          ) ):
                          ListView.separated(
                            itemCount: controller.favorites.length,
                            separatorBuilder: (context,index)=>
                              const SizedBox(height: 15,),
                            itemBuilder: (context, index) =>
                               BuildInFavoriteItem(index: index,)
                          ),
                        )
                      ),
                SizedBox(height: constraints.maxHeight *0.1,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
