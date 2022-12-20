import 'dart:ui';

class DealsModel {
   Color? color;
  DealsModel(
       {
         required this.color,
  });

  static List<DealsModel> dealsData = [
    DealsModel(
      color: const Color(0xffFBEDD8),
    ),
    DealsModel(
      color: const Color(0xffFAD96D),
    ),
    DealsModel(
      color: const Color(0xffCCB8FF),
    ),
    DealsModel(
      color: const Color(0xffB0EAFD),
    ),
    DealsModel(
      color: const Color(0xffFF9DC2),
    ),
  ];
}

