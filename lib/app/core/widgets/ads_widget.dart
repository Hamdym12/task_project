import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'custom_text.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return  Container(
        height: mediaQuery.height > 700 ?
        context.isLandscape?
        mediaQuery.height * 0.30 : mediaQuery.height *0.14
            : mediaQuery.height < 600 ?
        context.isLandscape?
        mediaQuery.height * 0.33 :  mediaQuery.height *0.2 :
        context.isLandscape? mediaQuery.height * 0.32: mediaQuery.height *0.17
        ,
        decoration: BoxDecoration(
            color: AppColors.groceryCont,
            borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Mega',
                    color: Color(0xffD03A27),
                    fontWeight: FontWeight.w500,
                  ),
                  RichText(
                      text:const TextSpan(
                          children: [
                            TextSpan(
                                text: "WHOPP",
                                style: TextStyle(
                                    color: Color(0xff21114B),
                                    fontSize: 31,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                            TextSpan(
                                text: "E",
                                style: TextStyle(color: Color(0xffD03A27), fontSize: 31   , fontWeight: FontWeight.w800)
                            ),
                            TextSpan(
                                text: "R",
                                style: TextStyle(color: Color(0xff21114B), fontSize: 31
                                    , fontWeight: FontWeight.w800)
                            ),
                          ]
                      ) ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: const [
                      CustomText(
                        text: '\$ 17',
                        fontSize: 18,
                        color: Color(0xffEE6A61),
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      CustomText(
                        text: '\$ 32',
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: '* Available until 24 December 2020',
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
