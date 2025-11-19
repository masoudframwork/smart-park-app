import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/widgets/custome_text_field_widget.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

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
                text: 'الاسم الكامل *',
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColor.whiteColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                width: 356.w,
                //  controller: phoneController,
                borderRadius: 10.r,

                textInputType: TextInputType.emailAddress,
                hintStyle: const TextStyle(
                  color: AppColor.greyBorderColor,
                ),
                //   onChanged: onPhoneChanged,
                // validator: phoneValidator,
              ),
              SizedBox(
                height: 20.h,
              ),
              AppText(
                text: 'رقم الهاتف *',
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColor.whiteColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                width: 356.w,
                //  controller: phoneController,
                borderRadius: 10.r,

                textInputType: TextInputType.phone,
                hintStyle: const TextStyle(
                  color: AppColor.greyBorderColor,
                ),
                //   onChanged: onPhoneChanged,
                // validator: phoneValidator,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
