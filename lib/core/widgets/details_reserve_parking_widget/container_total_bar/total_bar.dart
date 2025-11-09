import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/image_string.dart';
import '../../../theme/app_color.dart';
import '../../../theme/app_text_theme.dart';
import '../../app_text.dart';

class TotalBar extends StatelessWidget {
  final double total;
  final String? label;

  const TotalBar({
    super.key,
    required this.total,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 54.h,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: label ?? 'الإجمالي',
            appTextTheme: AppTextTheme.yellowTextStyle(),
          ),
          SizedBox(width: 12.w),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: total.toStringAsFixed(0),
                appTextTheme: AppTextTheme.numberLargeTextStyle(),
              ),
              SizedBox(width: 4.w),
              SvgPicture.asset(
                AppImages.realSu,
                width: 15.w,
                height: 16.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
