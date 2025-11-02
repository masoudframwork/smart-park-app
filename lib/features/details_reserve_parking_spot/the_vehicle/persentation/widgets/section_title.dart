import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const SectionTitle({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.primaryColor,
          size: 30,
        ),
        SizedBox(width: 8.w),
        AppText(
          text: title,
          appTextTheme: AppTextTheme.bodyLargeTextStyle(),
        ),
      ],
    );
  }
}
