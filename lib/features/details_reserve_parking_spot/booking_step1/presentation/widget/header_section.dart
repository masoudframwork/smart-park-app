import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/l10n.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: 109.h,
      decoration: BoxDecoration(
        color: AppColor.textColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: S.of(context).zone013,
              appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppText(
              text: S.of(context).khuraisRoadRiyadhSaudiArabia,
           //   text: 'طريق خريص، الرياض، المملكة العربية السعودية',
              appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
