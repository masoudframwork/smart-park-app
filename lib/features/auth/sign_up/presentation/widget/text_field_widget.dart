import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/widgets/custome_text_field_widget.dart';
import '../../../../../core/widgets/required_field_label.dart';

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
              RequiredFieldLabel(text: 'الاسم الكامل'),
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
              RequiredFieldLabel(text: ' رقم الهاتف'),
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
