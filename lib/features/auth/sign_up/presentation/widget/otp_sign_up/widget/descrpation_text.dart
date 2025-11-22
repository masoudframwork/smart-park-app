import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../../../core/theme/app_color.dart';
import '../../../../../../../core/theme/app_text_theme.dart';

class DescrpationTitelWidget extends StatelessWidget {
  const DescrpationTitelWidget({super.key});

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
          text: 'لتأكيد الحساب',
          textAlign: TextAlign.center,
          appTextTheme: titleStyle,
        ),
        AppText(
          text:
              ' لقد تم إرسال الرمز إلى الرقم المنتهي ب 000  \n أدخل الرمز لإتمام عملية الدخول  ',
          textAlign: TextAlign.center,
          appTextTheme: descriptionStyle,
        ),
      ],
    );
  }
}
