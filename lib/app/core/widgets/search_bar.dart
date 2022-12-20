import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'custom_textfield.dart';

class BuildSearchWidget extends StatelessWidget {
   BuildSearchWidget({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: context.isLandscape
          ? mediaQuery.height * 0.15
          : mediaQuery.height * 0.07,
      width: mediaQuery.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFieldView(
            height: 45,
            width:context.isLandscape?
                GetPlatform.isIOS ?
            mediaQuery.width*.85-20 : mediaQuery.width-20 : mediaQuery.width-20,
            controller: searchController,
            prefixIconWidget: const Icon(
              CupertinoIcons.search,
              color: AppColors.textFieldInputColor,
              size: 22,
            ),
            hintText: 'Search in thousands of products',
            vertical: 10,
          ),
        ],
      ),
    );
  }
}
