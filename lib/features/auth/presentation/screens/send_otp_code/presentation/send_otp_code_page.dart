import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/auth/presentation/screens/send_otp_code/presentation/widget/description_widget.dart';
import '../../../../../../core/constants/image_string.dart';
import '../../../../../../core/routing/navigation_service.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';
import '../../../../../../core/widgets/pincodestyle.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'controller/send_code_timer_provider.dart';
import '../../../../provider/auth_providers.dart';

class SendOTPCodePage extends ConsumerWidget {
  final String mobileNumber;

  const SendOTPCodePage({
    super.key,
    required this.mobileNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Debug print - Check if mobile number is received
    print("🔵 OTP Screen - Mobile Number: $mobileNumber");

    if (mobileNumber.isEmpty) {
      print("⚠️ ERROR: Mobile number is EMPTY in OTP screen!");
      // Show error and go back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: Phone number not provided"),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.pop(context);
      });
    }

    // ✅ Get OTP state and controller
    final otpState = ref.watch(otpControllerProvider(mobileNumber));
    final otpController = ref.read(otpControllerProvider(mobileNumber).notifier);

    // ✅ Get code controller and timer
    final codeController = ref.watch(codeControllerProvider);
    final remainingSeconds = ref.watch(sendCodeTimerProvider);

    // ✅ Format timer display
    final minutesStr = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (remainingSeconds % 60).toString().padLeft(2, '0');
    final timeStr = '$minutesStr:$secondsStr';

    // ✅ Listen for verification success
    ref.listen(otpControllerProvider(mobileNumber), (prev, next) {
      if (next.isVerified) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("✅ OTP Verified Successfully!"),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to home
        Future.delayed(Duration(milliseconds: 500), () {
          ref.read(bottomNavBarController).changeIndex(
            BottomNavBarController.homeIndex,
          );
          NavigationService.go(RoutePaths.bottomNavBar);
        });
      }

      // Show errors
      if (next.errorMessage != null &&
          next.errorMessage != prev?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    });

    // ✅ Enable resend when timer hits 0
    ref.listen(sendCodeTimerProvider, (prev, next) {
      if (next == 0 && prev != 0) {
        otpController.enableResend();
      }
    });

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),

                // Logo
                ClipOval(
                  child: CustomImageWidget(
                    isFlag: true,
                    imageUrl: AppImages.appLogo,
                    width: 147.w,
                    height: 147.w,
                  ),
                ),

                SizedBox(height: 40.h),

                // Description
                const DescriptionWidget(),

                // ✅ Show mobile number
                SizedBox(height: 16.h),
                Text(
                  "Code sent to: $mobileNumber",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[300],
                  ),
                ),

                SizedBox(height: 32.h),

                // ✅ PIN Code Input
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
                  onDone: (code) {
                    // ✅ Auto-verify when 4 digits entered
                    if (code.length == 4) {
                      print("🔵 Auto-verifying OTP: $code");
                      otpController.verifyOtp(code);
                    }
                  },
                ),

                SizedBox(height: 25.h),

                // ✅ Verify/Login Button
                CustomButtonWidget(
                  borderRadius: 10.r,
                  text: otpState.isLoading ? "Verifying..." : S.of(context).login,
                  onPressed: otpState.isLoading
                      ? null
                      : () {
                    if (codeController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter OTP code"),
                          backgroundColor: Colors.orange,
                        ),
                      );
                      return;
                    }
                    print("🔵 Manual verify OTP: ${codeController.text}");
                    otpController.verifyOtp(codeController.text);
                  },
                ),

                SizedBox(height: 32.h),

                // ✅ Timer / Resend Button
                if (remainingSeconds > 0)
                  AppText(
                    text:
                    '${S.of(context).anewcodewillbesentin ?? 'A new code will be sent in'} $timeStr',
                    textAlign: TextAlign.center,
                    appTextTheme: AppTextTheme.descriptionTextStyle().copyWith(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                else
                  Column(
                    children: [
                      AppText(
                        text: S.of(context).youcanrequestanewcodenow ??
                            'You can request a new code now',
                        textAlign: TextAlign.center,
                        appTextTheme:
                        AppTextTheme.descriptionTextStyle().copyWith(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      TextButton(
                        onPressed: otpState.canResend && !otpState.isLoading
                            ? () {
                          print("🔵 Resending OTP to: $mobileNumber");
                          otpController.resendOtp();
                          codeController.clear();
                        }
                            : null,
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: otpState.canResend
                                ? AppColor.primaryColor
                                : Colors.grey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}