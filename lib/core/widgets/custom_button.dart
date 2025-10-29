import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';
import 'app_text.dart';

enum ButtonType { elevated, outlined }

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final double width;
  final double verticalPadding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? customPadding;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.elevated,
    this.width = double.infinity,
    this.verticalPadding = 14,
    this.backgroundColor,
    this.borderColor,
    this.customPadding,
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle buttonTextStyle = type == ButtonType.elevated
        ? AppTextTheme.mainButtonTextStyle()
        : AppTextTheme.secondaryButtonTextStyle();

    return Padding(
      padding: customPadding ?? EdgeInsets.zero,
      child: SizedBox(
        width: width == double.infinity ? width : width.w,
        child: type == ButtonType.outlined
            ? OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: borderColor ?? AppColor.primaryColor),
                  padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius.r),
                  ),
                ),
                child: AppText(text: text, appTextTheme: buttonTextStyle),
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor ?? AppColor.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius.r),
                  ),
                ),
                child: AppText(text: text, appTextTheme: buttonTextStyle),
              ),
      ),
    );
  }
}
