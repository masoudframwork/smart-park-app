import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/auth/send_the_code/presentation/widget/descrpation_widget.dart';

import '../../../../core/constants/image_string.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../core/widgets/pincodestyle.dart';
import '../../../bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'controller/send_code_controller.dart';

class SendTheCodePage extends ConsumerWidget {
  const SendTheCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = ref.watch(codeControllerProvider);

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
                const DescrpationWidget(),
                SizedBox(height: 32.h),
                PinCodeTextField(
                  controller: codeController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  hideCharacter: false,
                  pinBoxWidth: 82.w,
                  pinBoxHeight: 76.w,
                  pinBoxColor: AppColor.whiteColor,
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
                SizedBox(height: 25.h),
                CustomButtonWidget(
                  borderRadius: 10.r,
                  text: 'تسجيل الدخول',
                  onPressed: () {
                    ref.read(bottomNavBarController).changeIndex(
                          BottomNavBarController.homeIndex,
                        );
                    NavigationService.go(RoutePaths.bottomNavBar);
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
