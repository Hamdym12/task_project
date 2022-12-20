import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class BuildHeaderWidget extends StatelessWidget {
  const BuildHeaderWidget({Key? key, required this.title, required this.imgHeight}) : super(key: key);
  final String title;
  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
         children: [
           Image.asset(
             "assets/images/Group 16051.png",
             height: imgHeight,
           ),
           Padding(
             padding: const EdgeInsets.only(left: 4),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children:  [
                 const Icon(
                   Icons.location_on_outlined,
                   color: Colors.white,
                   size: 18,
                 ),
                 const SizedBox(
                   width: 2,
                 ),
                 Text(
                   title,
                   style: const TextStyle(
                       fontSize: 13,
                       color: Colors.white,
                       fontWeight: FontWeight.w500
                   ),
                 ),
               ],
             ),
           ),
         ],
        ),

        const Spacer(),
        Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.groceryCircleContainer),
              shape: BoxShape.circle),
        )
      ],
    );
  }
}
