import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/button_widget.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/text_field_widget.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/titel_desc_widget.dart';

import '../../../../core/constants/image_string.dart';
import '../../../../core/widgets/custom_image_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
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
                SizedBox(
                  height: 31.h,
                ),
                TitelDescrpationWidget(),
                SizedBox(
                  height: 31.h,
                ),
                TextFieldWidget(),
                SizedBox(
                  height: 31.h,
                ),
                ButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
