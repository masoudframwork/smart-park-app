import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

class ZoneHeader extends StatelessWidget {
  final String zoneName;
  final String capacityText;

  final bool showDurationSection;

  const ZoneHeader({
    super.key,
    required this.zoneName,
    required this.capacityText,
    this.showDurationSection = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: zoneName,
              appTextTheme: AppTextTheme.titleLargeTextStyle(),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: AppColor.secondaryButtonColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.check,
                    width: 12.w,
                    height: 12.h,
                    color: AppColor.primaryColor,
                  ),
                  SizedBox(width: 6.w),
                  AppText(
                    text: 'متاح الآن',
                    appTextTheme: AppTextTheme.bodyXSmallTextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Icon(
              Icons.directions_car,
              size: 18.w,
              color: AppColor.primaryButtonColor,
            ),
            SizedBox(width: 6.w),
            AppText(
              text: capacityText,
              appTextTheme: AppTextTheme.numberSmallTextStyle(),
            ),
          ],
        ),
        if (showDurationSection) SizedBox(height: 20.h),
        if (showDurationSection)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time,
                color: AppColor.primaryColor,
                size: 28.w,
              ),
              SizedBox(width: 8.w),
              AppText(
                text: 'حدد مدة الوقوف',
                appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
                  color: AppColor.blackNumberSmallColor,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
