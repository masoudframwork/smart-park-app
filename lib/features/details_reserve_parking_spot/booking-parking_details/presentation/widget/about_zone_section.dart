import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

class AboutZoneSection extends StatelessWidget {
  const AboutZoneSection({
    super.key,
    this.title = '',
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11.h,

      children: [
        AppText(
          text: title,
          appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
            color: AppColor.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppText(
          text: description,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.blackNumberSmallColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
