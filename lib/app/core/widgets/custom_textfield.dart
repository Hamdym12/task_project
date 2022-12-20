import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/app/theme/app_colors.dart';

class CustomTextFieldView extends StatelessWidget {
   const CustomTextFieldView({Key? key,
    this.controller,
    this.hintText,
    this.fillColorTextFiled,
    this.filledColorTextFiled,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.textType,
    this.focusNode,
    this.onChangedFunction,
    this.validatorFunction,
    this.onEditingCompleteFunction,
    this.textInputAction,
    this.obscure,
    this.height,
    this.width,
    this.hintStyle,
    this.vertical,
    this.onFieldSubmitted,
    this.label,
    this.labelStyle,
    this.labelText,
    this.maxLines,
    this.inputFormatters,
  }) : super(key: key);

  final TextEditingController? controller;
  final Color? fillColorTextFiled;
  final bool? filledColorTextFiled;
  final TextInputType? textType;
  final TextStyle? hintStyle;
  final String? hintText;
  final ValueChanged<String>? onChangedFunction;
  final FormFieldValidator<String>? validatorFunction;
  final VoidCallback? onEditingCompleteFunction;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final bool? obscure;
  final double? height;
  final double? width;
  final double? vertical;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onFieldSubmitted;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width??MediaQuery.of(context).size.width *0.93,
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,

        enableSuggestions: true,
        keyboardType: textType ?? TextInputType.text,
        onFieldSubmitted: onFieldSubmitted,
        decoration:  InputDecoration(
          label: label,
          labelText:labelText ,
          labelStyle: labelStyle??const TextStyle(
              fontSize: 16,
              // color: AppColors.mainColorBlue,
              height:1
          ),
          hintText: hintText??'',
          hintStyle: hintStyle ??
              const TextStyle(
                fontSize: 14,
                 color: AppColors.textFieldInputColor,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:Color(0xffE0E0E0), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: fillColorTextFiled ?? AppColors.textFieldBackground,
          filled: filledColorTextFiled  ?? true,
          prefixIcon: prefixIconWidget,
          suffixIcon: suffixIconWidget,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 1)),
          errorBorder: OutlineInputBorder(
              borderSide:
              const BorderSide( color: Color(0xffF8B7B6), width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffF8B7B6), width: 2)
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: vertical??12),
        ),
        onChanged: onChangedFunction,
        focusNode: focusNode,
        onEditingComplete: onEditingCompleteFunction,
        validator:validatorFunction,
        textInputAction: textInputAction,
        obscureText: obscure??false,
        maxLines: maxLines,


      ),
    );
  }
}