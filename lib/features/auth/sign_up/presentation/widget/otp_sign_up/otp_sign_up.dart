
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
import '../../../../../../core/widgets/app_result_dialog.dart'
    show AppResultDialog;
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';
import '../../../../../../core/widgets/pincodestyle.dart';
import '../../../../send_the_code/presentation/controller/send_code_controller.dart';

class OtpSignUpPage extends ConsumerWidget {
  const OtpSignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = TextEditingController();

    final remainingSeconds = ref.watch(sendCodeTimerProvider);

    final minutesStr = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (remainingSeconds % 60).toString().padLeft(2, '0');

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
                  onDone: (code) {
                  },
                ),
                SizedBox(height: 32.h),
                CustomButtonWidget(
                  borderRadius: 10.r,
                  text: 'تأكيد الحساب',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AppResultDialog(
                          headerWidget: SvgPicture.asset(
                            AppImages.trueChek,
                            width: 47.w,
                            height: 47.w,
                          ),
                          message: 'لقد تم إنشاء حسابك بنجاح',
                          buttonText: 'استمرار',
                          onButtonPressed: () {
                            NavigationService.go(RoutePaths.nafathPageLogin);
                          },
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 32.h),

                AppText(
                  text: remainingSeconds > 0
                      ? 'سيتم إرسال رمز جديد خلال $minutesStr:$secondsStr ثانية'
                      : 'يمكنك طلب رمز جديد الآن',
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
