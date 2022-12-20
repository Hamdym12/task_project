import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color? color;
  final Alignment? alignment;
  final int? maxLine;
  final double? height;
  final double? width;
  final double? containerHeight;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  const CustomText({Key? key,
    this.text = '',
    this.fontSize = 14,
    this.color,
    this.alignment ,
    this.maxLine,
    this.height = 1,
    this.width,
    this.containerHeight,
    this.fontWeight = FontWeight.w500,
    this.textOverflow,
    this.textAlign,
    this.decoration,
    this.fontStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        width: width,
        height: containerHeight,
        child: Text(
          text!,
          textAlign: textAlign,
          style: TextStyle(
            color: color??AppColors.textFieldInputColor,
              height: height,
              fontSize: fontSize,
              decoration:decoration ,
              fontStyle:fontStyle ,
              fontWeight: fontWeight,
              overflow: textOverflow,
            ),
          maxLines: maxLine,

        )
    );
  }
}
