import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../../../core/routing/navigation_service.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../../generated/l10n.dart';

class TitelDescrpationWidget extends StatelessWidget {
  const TitelDescrpationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11.h,
      children: [
        AppText(
          text: S.of(context).create_anew_account,
          textAlign: TextAlign.center,
          appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColor.whiteColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: S.of(context).already_have_an_account,
              textAlign: TextAlign.center,
              appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            GestureDetector(
              onTap: () {
                NavigationService.go(RoutePaths.loginPage);
              },
              child: AppText(
                text: S.of(context).login,
                textAlign: TextAlign.center,
                appTextTheme: AppTextTheme.font18SimiBoldBlack()
                    .copyWith(color: AppColor.primaryColor),
              ),
            ),
          ],
        )
      ],
    );
  }
}
