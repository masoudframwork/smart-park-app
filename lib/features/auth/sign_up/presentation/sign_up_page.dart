import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/button_widget.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/text_field_widget.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/titel_desc_widget.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/arrow_widget_custom_bar.dart';
import '../../../../core/widgets/custom_image_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 31.h,
              children: [
                ArrowWidgetCustomBar(onTap: () {
                  NavigationService.go(RoutePaths.loginPage);
                }),
                Center(
                  child: ClipOval(
                    child: CustomImageWidget(
                      isFlag: true,
                      imageUrl: AppImages.appLogo,
                      width: 107.w,
                      height: 107.w,
                    ),
                  ),
                ),
                const TitelDescrpationWidget(),
                const TextFieldWidget(),
                const ButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
