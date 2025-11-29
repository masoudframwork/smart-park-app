import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/auth/presentation/screens/login/presentation/widgets/text_field_and_buttons_widget.dart';
import 'package:smart/features/auth/presentation/screens/login/presentation/widgets/titel_desc_widget.dart';
import '../../../../../../core/constants/image_string.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';
import '../../sign_up/presentation/widget/otp_sign_up/widget/descrpation_text.dart';
import 'controller/login_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);

    ref.listen(loginControllerProvider, (prev, next) {
      if (prev?.success == false && next.success == true) {
        final phoneNumber = controller.phoneController.text.trim();

        if (kDebugMode) {
          print("🔵 Login Success - Navigating with phone: '$phoneNumber'");
        }

        if (phoneNumber.isEmpty) {
          if (kDebugMode) {
            print("⚠️ ERROR: Phone number is empty!");
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error: Phone number is missing"),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        // ✅ Use GoRouter navigation
        context.push(RoutePaths.sendTheCodePage, extra: phoneNumber);
      }

      // Show errors
      if (next.errorMessage != null && next.errorMessage != prev?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: ClipOval(
                    child: CustomImageWidget(
                      isFlag: true,
                      imageUrl: AppImages.appLogo,
                      width: 147.w,
                      height: 147.w,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                const DescrpationTitelWidget(),
                SizedBox(height: 40.h),
                TextFieldAndButtonsWidget(
                  formKey: controller.formKey,
                  phoneController: controller.phoneController,
                  phoneValidator: controller.validatePhone,
                  onPhoneChanged: (val) => controller.phoneController.text = val ?? "",
                  onSendCode: controller.sendCode,
                  onLoginWithNafath: () {},
                  isLoading: state.isLoading,
                ),
                SizedBox(height: 40.h),
                TitelDescWidget(
                  onCreateAccount: controller.goToRegister,
                  onGuestLogin: controller.guestLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}