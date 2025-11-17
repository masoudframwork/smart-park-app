import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class ZoneHeader extends StatelessWidget {
  final String zoneName;
  final String capacityText;
  final String locationText;

  final Widget? leadingIcon;

  final bool showDurationSection;

  const ZoneHeader({
    super.key,
    required this.zoneName,
    required this.capacityText,
    required this.locationText,
    this.leadingIcon,
    this.showDurationSection = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        spacing: 13.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: zoneName,
                appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 9.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: AppColor.textColor,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: AppText(
                  text: capacityText,
                  appTextTheme: AppTextTheme.bodyXSmallTextStyle().copyWith(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              leadingIcon ??
                  SvgPicture.asset(
                    AppImages.iconsMaps,
                  ),
              SizedBox(width: 8.w),
              AppText(
                text: locationText,
                appTextTheme: AppTextTheme.bodyXSmallTextStyle().copyWith(
                  color: AppColor.blackNumberSmallColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
