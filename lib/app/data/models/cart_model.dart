
import 'package:flutter/material.dart';

class ProductModel{
  Color? productColor;
  String? productName;
  int? price;
  String? quantity;

  ProductModel({
   required this.price,
   required this.productName,
    required this.productColor,
    required this.quantity,
  });

  static  List<ProductModel> products =[
    ProductModel(price: 10, productName: "Steak",productColor: const  Color(0xffF9BDAD),quantity: "137 grams"),
    ProductModel(price: 15, productName: "Meat",productColor: const Color(0xffCCB8FF),quantity: "2 serving"),
    ProductModel(price: 16, productName: "Bread",productColor: const  Color(0xffB0EAFD),quantity: "200 grams"),
    ProductModel(price: 14, productName: "Salmon",productColor: const Color(0xffFF9DC2),quantity: "2 Bottle"),
    ProductModel(price: 19, productName: "Rice",productColor: const  Color(0xffFAD96D),quantity: "137 grams"),
    ProductModel(price: 20, productName: "Water",productColor: const Color(0xff21114B),quantity: "3 serving"),
    ProductModel(price: 5, productName: "Pasta",productColor: const Color(0xffCCB8FF),quantity: "1 Bottle"),
    ProductModel(price: 6, productName: "Pizza",productColor: const Color(0xffF9BDAD),quantity: "120 grams"),
    ProductModel(price: 8, productName: "Shrimp",productColor: const Color(0xffB0EAFD),quantity: "4 Bottle"),
    ProductModel(price: 4, productName: "Fish",productColor: const Color(0xffFF9DC2),quantity: "5 serving"),
  ];
}

