import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../../../../../core/theme/app_color.dart';
import '../../../../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../../../../generated/l10n.dart';

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
          text: S.of(context).verifyAccount,
          textAlign: TextAlign.center,
          appTextTheme: titleStyle,
        ),
        AppText(
          text: S.of(context).an_otp_has_been_sent_to_the_number_ending,
          textAlign: TextAlign.center,
          appTextTheme: descriptionStyle,
        ),
      ],
    );
  }
}
