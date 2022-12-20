import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/cart_model.dart';

class CartController extends GetxController{

  final RxMap<dynamic, dynamic> _products = {}.obs;

  void addProduct(ProductModel product){
    if(_products.containsKey(product)){
      _products[product] += 1;
    }else{
      _products[product] = 1;
    }
    Get.snackbar(
        "Product Added" ,
        "${product.productName} has been added to your cart",
      duration: const Duration(seconds: 2),
      reverseAnimationCurve: Curves.bounceIn,
      padding: const EdgeInsets.all(10),
      messageText: Text(
          "${product.productName} has been added to your cart",
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14
        ),
      ),
      titleText: const Text(
        "Product Added",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w500,
          fontSize: 16
        ),
      )
    );
  }

  get  products => _products;

  void removeProduct(ProductModel product){
    if(_products.containsKey(product)  && _products[product] ==1){
      _products.removeWhere((key, value) => key == product);
    }else{
      _products[product] -= 1;
    }
  }

  get productSubTotal => _products.entries
      .map((product) => product.key.price * product.value).
       toList();

  get total {
    if(_products.isEmpty){
      return "0";
    }else {
      return
      _products.entries
      .map((product) => product.key.price * product.value).
    toList().reduce((value, element) => value + element)
    .toStringAsFixed(2);
    }
  }

}