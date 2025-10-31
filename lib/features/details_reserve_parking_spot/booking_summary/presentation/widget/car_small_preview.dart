import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';

class CarSmallPreview extends StatelessWidget {
  const CarSmallPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 28.h,
      child: Icon(
        Icons.directions_car,
        size: 28.w,
        color: AppColor.primaryColor,
      ),
    );
  }
}
