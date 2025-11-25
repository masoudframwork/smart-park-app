import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/otp_sign_up/widget/descrpation_text.dart';

import '../../../../../../core/constants/image_string.dart';
import '../../../../../../core/routing/navigation_service.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_text_theme.dart';

import '../../../../../../core/widgets/app_result_dialog.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';
import '../../../../../../core/widgets/pincodestyle.dart';
import '../../../../../../generated/l10n.dart';
import '../../controller/sign_up_controller.dart';

class OtpSignUpPage extends ConsumerWidget {
  const OtpSignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = ref.watch(otpCodeControllerProvider);

    final remainingSeconds = ref.watch(sendCodeTimerProvider);

    final minutesStr = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (remainingSeconds % 60).toString().padLeft(2, '0');
    final timeStr = '$minutesStr:$secondsStr';

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                ClipOval(
                  child: CustomImageWidget(
                    isFlag: true,
                    imageUrl: AppImages.appLogo,
                    width: 147.w,
                    height: 147.w,
                  ),
                ),
                SizedBox(height: 40.h),
                DescrpationTitelWidget(),
                SizedBox(height: 32.h),
                PinCodeTextField(
                  controller: codeController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  hideCharacter: false,
                  pinBoxWidth: 82.w,
                  pinBoxHeight: 76.w,
                  pinBoxColor: Colors.white,
                  defaultBorderColor: Colors.white,
                  hasTextBorderColor: AppColor.primaryColor,
                  highlightColor: AppColor.primaryColor,
                  highlight: true,
                  pinBoxRadius: 10.r,
                  pinTextStyle: AppTextTheme.titleMediumTextStyle().copyWith(
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                  onDone: (code) {},
                ),
                SizedBox(height: 32.h),
                CustomButtonWidget(
                  borderRadius: 10.r,
                  text: S.of(context).varifyAccount,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AppResultDialog(
                        message:
                            S.of(context).youraccounthasbeencreatedsuccessfully,
                      //  subMessage: S.of(context).help_support_title,
                       // mainButtonText: S.of(context).continu_e,
                        onMainPressed: () => () {
                          NavigationService.go(RoutePaths.nafathPageLogin);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 32.h),
                AppText(
                  text: remainingSeconds > 0
                      ? '${S.of(context).anewcodewillbesentin} $timeStr ${S.of(context).secon}'
                      : S.of(context).youcanrequestanewcodenow,
                  textAlign: TextAlign.center,
                  appTextTheme: AppTextTheme.descriptionTextStyle().copyWith(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
