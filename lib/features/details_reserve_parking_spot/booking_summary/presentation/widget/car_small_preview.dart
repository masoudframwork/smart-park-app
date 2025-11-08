import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';

class CarSmallPreview extends StatelessWidget {
  const CarSmallPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppImages.carVehicleCar2,
    );
  }
}
