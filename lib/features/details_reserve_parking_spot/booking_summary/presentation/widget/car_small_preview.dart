// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../../../../core/constants/image_string.dart';
//
// class CarSmallPreview extends StatelessWidget {
//   const CarSmallPreview({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset(
//       AppImages.carVehicleCar2,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarSmallPreview extends StatelessWidget {
  final String assetSvg;
   const CarSmallPreview({required this.assetSvg});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetSvg,
      width: 40,
      height: 24,
    );
  }
}
