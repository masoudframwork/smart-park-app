import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';

class VisaSmallLogo extends StatelessWidget {
  const VisaSmallLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 28.h,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColor.contanearGreyColor,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        AppImages.visa,
        width: 49.w,
        height: 35.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
