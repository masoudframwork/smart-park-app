import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/dependency_injection/service_locator.dart';
import 'package:smart/core/network/dio_client.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/auth/login/data/data_source/login_remote_ds.dart';
import 'package:smart/features/auth/login/data/repository/login_repository.dart';
import 'package:smart/features/auth/login/domain/repository/login_repository_interface.dart';
import 'package:smart/features/auth/login/domain/usecase/login_usecases.dart';
import 'package:smart/features/auth/login/presentation/widgets/descrpation_titel_widget.dart';
import 'package:smart/features/auth/login/presentation/widgets/text_field_and_buttons_widget.dart';
import 'package:smart/features/auth/login/presentation/widgets/titel_desc_widget.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import 'controller/login_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.watch(loginControllerProvider.notifier);

    ref.listen(loginControllerProvider, (prev, next) {
      if (next.errorMessage != null &&
          next.errorMessage != prev?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                  onPhoneChanged: controller.onPhoneChanged,
                  phoneValidator: controller.validatePhone,
                  onSendCode: controller.sendCode,
                  onLoginWithNafath: controller.loginWithNafath,
                  isLoading: state.isLoading,
                ),
                SizedBox(height: 40.h),
                TitelDescWidget(
                  onCreateAccount: controller.goToRegister,
                  onGuestLogin: controller.guestLogin,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: Text("data"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
