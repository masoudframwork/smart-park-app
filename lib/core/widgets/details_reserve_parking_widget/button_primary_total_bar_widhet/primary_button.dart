import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_color.dart';
import '../../../theme/app_text_theme.dart';
import '../../app_text.dart';
import '../../custom_button.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Widget? trailingIcon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onPressed: onPressed,
      backgroundColor: AppColor.primaryColor,
      borderRadius: 8,
      width: double.infinity,
      label: AppText(
        text: text,
        appTextTheme: AppTextTheme.mainButtonTextStyle(),
      ),
      icon: trailingIcon ??
          Icon(
            Icons.chevron_right_outlined,
            color: AppColor.whiteColor,
            size: 30.w,
          ),
    );
  }
}
