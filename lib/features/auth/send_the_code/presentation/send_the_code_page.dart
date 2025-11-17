import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../core/widgets/pincodestyle.dart';
import '../../login/presentation/widgets/descrpation_titel_widget.dart';

class SendTheCodePage extends StatelessWidget {
  const SendTheCodePage({super.key});
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
                const DescrpationTitelWidget(),
                SizedBox(height: 32.h),
                PinCodeTextField(
                  controller: codeController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  hideCharacter: false,

                  pinBoxWidth: 65.w,
                  pinBoxHeight: 60.w,

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
                SizedBox(height: 16.h),
                CustomButtonWidget(
                  width: 360.w,
                  height: 50.h,
                  borderRadius: 10.r,
                  text: 'تسجيل الدخول',
                  onPressed: () {
                    NavigationService.go(RoutePaths.signUpPage);
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
