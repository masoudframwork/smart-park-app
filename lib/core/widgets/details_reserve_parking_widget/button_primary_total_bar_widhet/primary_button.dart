import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_color.dart';

import '../../custom_button.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Widget? trailingIcon;

  final bool showDefaultIcon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.trailingIcon,
    this.showDefaultIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget? resolvedIcon;

    if (trailingIcon != null) {
      resolvedIcon = trailingIcon;
    } else if (showDefaultIcon) {
      resolvedIcon = Icon(
        Icons.chevron_right_outlined,
        color: AppColor.whiteColor,
        size: 30.w,
      );
    } else {
      resolvedIcon = null;
    }

    return CustomButtonWidget(
      onPressed: onPressed,
      backgroundColor: AppColor.primaryColor,
      borderRadius: 8,
      width: double.infinity,
      text: text,
      // icon: resolvedIcon,
    );
  }
}
