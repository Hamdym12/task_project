import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/models/deals_model.dart';
import 'package:get/get.dart';

class GroceryController extends GetxController{

   RxList<DealsModel> _favorites = <DealsModel>[].obs;
   RxList<DealsModel> get favorites => _favorites;

  void toggleFavorites(DealsModel product){
    final isExist = _favorites.contains(product);
    if(isExist){
      _favorites.remove(product);
    }else{
      _favorites.add(product);
      Get.snackbar(
          "Added to Favorite",
          "Item has been added to your favorite",
          duration: const Duration(seconds: 2),
          padding: const EdgeInsets.all(10),
          reverseAnimationCurve: Curves.bounceIn,
          messageText: const Text(
            "Item has been added to your favorite",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14
            ),),
          titleText: const Text(
            "Added to Favorite",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
            ),
          )
      );
    }
  }

  bool isFavorite(DealsModel product){
    final isExist = _favorites.contains(product);
    return isExist;
  }
  void clearFavorites(){
    _favorites = <DealsModel>[].obs;
  }
 }
