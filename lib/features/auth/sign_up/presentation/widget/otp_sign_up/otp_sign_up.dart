import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/otp_sign_up/widget/descrpation_text.dart';

import '../../../../../../core/constants/image_string.dart';
import '../../../../../../core/routing/navigation_service.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/widgets/app_result_dialog.dart' show AppResultDialog;
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';
import '../../../../../../core/widgets/pincodestyle.dart';

class OtpSignUpPage extends StatelessWidget {
  const OtpSignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
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

                  // pinTextStyle: TextStyle(
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  //   color: AppColor.primaryColor,
                  // ),
                  onDone: (code) {},
                ),
                SizedBox(height: 32.h),
                CustomButtonWidget(
                  width: 360.w,
                  height: 50.h,
                  borderRadius: 10.r,
                  text: 'تأكيد الحساب',
                  onPressed: () {
                    // NavigationService.go(RoutePaths.bottomNavBar);

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
                  text: 'سيتم إرسال رمز جديد خلال 00:23 ثانية',
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
