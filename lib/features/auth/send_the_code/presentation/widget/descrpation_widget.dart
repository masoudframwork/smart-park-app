import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';

class DescrpationWidget extends StatelessWidget {
  const DescrpationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextTheme.titleLargeTextStyle().copyWith(
      color: AppColor.whiteColor,
    );

    final descriptionStyle = AppTextTheme.descriptionTextStyle().copyWith(
      color: AppColor.whiteColor,
      fontWeight: FontWeight.w300,
    );

    return Column(
      spacing: 26.h,
      children: [
        AppText(
          text: 'تسجيل الدخول',
          textAlign: TextAlign.center,
          appTextTheme: titleStyle,
        ),
        AppText(
          text:'لقد تم إرسال الرمز إلى الرقم المنتهي ب 000\nدخل الرمز لإتمام عملية الدخولn',
          textAlign: TextAlign.center,
          appTextTheme: descriptionStyle,
        ),
      ],
    );
  }
}
