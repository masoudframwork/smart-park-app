import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../core/theme/app_text_theme.dart';

class TitelDescrpationWidget extends StatelessWidget {
  const TitelDescrpationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11.h,
      children: [
        AppText(
          text: 'أهلاً بك في تطبيق المواقف',
          textAlign: TextAlign.center,
          appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppText(
          text: 'يرجى استكمال ملفك الشخصي',
          textAlign: TextAlign.center,
          appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(),
        ),
      ],
    );
  }
}
