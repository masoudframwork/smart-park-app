import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/app_text.dart';
import '../../../../../../../core/routing/navigation_service.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../../../../core/theme/app_color.dart';
import '../../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../../generated/l10n.dart';

class TitelDescWidget extends StatelessWidget {
  const TitelDescWidget({
    super.key,
    required this.onCreateAccount,
    required this.onGuestLogin,
  });

  final VoidCallback onCreateAccount;
  final VoidCallback onGuestLogin;

  @override
  Widget build(BuildContext context) {
    final descriptionStyle = AppTextTheme.descriptionTextStyle();
    final titleStyle = AppTextTheme.titleLargeTextStyle();

    return Column(
      spacing: 26.h,
      children: [
        AppText(
          text: S.of(context).you_dont_have_an_account,
          textAlign: TextAlign.center,
          appTextTheme: titleStyle.copyWith(
            color: AppColor.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: descriptionStyle.copyWith(
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(text: S.of(context).you_can),
              TextSpan(
                text: S.of(context).create_anew_account,
                style: descriptionStyle.copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    NavigationService.go(RoutePaths.signUpPage);
                  },
              ),
              TextSpan(text: S.of(context).easily),
            ],
          ),
        ),
        AppText(
          text: S.of(context).or,
          textAlign: TextAlign.center,
          appTextTheme: titleStyle.copyWith(
            color: AppColor.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
        GestureDetector(
          onTap: onGuestLogin,
          child: Row(
            spacing: 14.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: S.of(context).use_as_aguest,
                textAlign: TextAlign.center,
                appTextTheme: titleStyle.copyWith(
                  color: AppColor.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColor.primaryColor,
                size: 20.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
