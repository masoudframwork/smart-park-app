import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/widgets/custom_button.dart';

import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custome_text_field_widget.dart';

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          // key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: ' رقم الهوية*',
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColor.blackColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                //  controller: phoneController,
                borderRadius: 10.r,
                hintStyle: AppTextTheme.numberSmallTextStyle().copyWith(
                  color: AppColor.greyBorderColor,
                  fontWeight: FontWeight.w300,
                ),
                borderSideColor: AppColor.greyDividerColor,
                textInputType: TextInputType.phone,

                borderSide: BorderSide(
                  color: AppColor.greyDividerColor,
                  width: 5.w,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButtonWidget(
                  borderRadius: 10.r,
                  text: 'تسجيل الدخول',
                  onPressed: () {
                    NavigationService.push('/nafathOtpScreen');
                  }),
              SizedBox(
                height: 150.h,
              ),
              CustomButtonWidget(
                borderRadius: 10.r,
                textStyle: AppTextTheme.titleMediumTextStyle().copyWith(
                  color: AppColor.primaryColor,
                ),
                text: 'لاحقاً',
                onPressed: () {
                  NavigationService.push('/bottomNavBar');
                },
                type: ButtonType.outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
