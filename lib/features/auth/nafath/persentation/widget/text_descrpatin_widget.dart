import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class TextDescrpationWidget extends StatelessWidget {
  const TextDescrpationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextTheme.titleLargeTextStyle().copyWith(
      color: AppColor.blackColor,
    );

    final descriptionStyle = AppTextTheme.descriptionTextStyle().copyWith(
        color: AppColor.blackColor, fontWeight: FontWeight.w500, fontSize: 20);

    return Center(
      child: Column(
        spacing: 74.h,
        children: [
          AppText(
            text: 'أهلاً بك في تطبيق المواقف',
            textAlign: TextAlign.center,
            appTextTheme: titleStyle,
          ),
          AppText(
            text: 'الربط عبر تطبيق نفاذ',
            textAlign: TextAlign.center,
            appTextTheme: descriptionStyle,
          ),
        ],
      ),
    );
  }
}
