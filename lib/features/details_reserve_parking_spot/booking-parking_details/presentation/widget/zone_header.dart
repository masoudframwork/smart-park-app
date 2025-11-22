import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class ZoneHeader extends StatelessWidget {
  final String? zoneName;
  final String? capacityText;
  final String? locationText;

  final Widget? leadingIcon;

  final String? description;

  final TextStyle? descriptionTextStyle;

  final TextStyle? zoneNameTextStyle;

  final TextStyle? locationTextStyle;

  final bool showDurationSection;
  final EdgeInsetsGeometry? padding;

  const ZoneHeader({
    super.key,
    this.zoneName,
    this.capacityText,
    this.locationText,
    this.leadingIcon,
    this.description,
    this.descriptionTextStyle,
    this.zoneNameTextStyle,
    this.locationTextStyle,
    this.showDurationSection = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final defaultZoneNameStyle = AppTextTheme.titleLargeTextStyle().copyWith(
      color: AppColor.textColor,
      fontWeight: FontWeight.w600,
    );

    final defaultLocationStyle = AppTextTheme.bodyXSmallTextStyle().copyWith(
      color: AppColor.blackNumberSmallColor,
      fontWeight: FontWeight.w300,
    );

    final defaultDescriptionStyle =
    AppTextTheme.bodySmallTextStyle().copyWith(
      color: AppColor.blackNumberSmallColor,
      fontWeight: FontWeight.w400,
    );

    return Padding(
      padding: padding ?? EdgeInsets.all(12.h),
      child: Column(
        spacing: 13.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (zoneName != null || capacityText != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (zoneName != null)
                  AppText(
                    text: zoneName!,
                    appTextTheme: (zoneNameTextStyle ?? defaultZoneNameStyle),
                  )
                else
                  const SizedBox.shrink(),
                if (capacityText != null)
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
                      text: capacityText!,
                      appTextTheme:
                      AppTextTheme.bodyXSmallTextStyle().copyWith(
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
              ],
            ),

          if (leadingIcon != null || locationText != null)
            Row(
              children: [
                if (leadingIcon != null) leadingIcon!,
                if (leadingIcon != null && locationText != null)
                  SizedBox(width: 8.w),
                if (locationText != null)
                  Flexible(
                    child: AppText(
                      text: locationText!,
                      appTextTheme:
                      (locationTextStyle ?? defaultLocationStyle),
                    ),
                  ),
              ],
            ),

          if (description != null && description!.isNotEmpty) ...[
            SizedBox(height: 12.h),
            AppText(
              text: description!,
              appTextTheme:
              (descriptionTextStyle ?? defaultDescriptionStyle),
            ),
          ],
        ],
      ),
    );
  }
}
