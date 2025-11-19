import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/custom_button.dart';

class AppResultDialog extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;

  final Widget? headerWidget;

  final IconData defaultIcon;
  final Color defaultIconBackgroundColor;
  final Color defaultIconColor;

  const AppResultDialog({
    super.key,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
    this.headerWidget,
    this.defaultIcon = Icons.check,
    this.defaultIconBackgroundColor = AppColor.primaryColor,
    this.defaultIconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 0.78.sw,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 28.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (headerWidget != null) ...[
                headerWidget!,
              ] else ...[
                Container(
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    color: defaultIconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    defaultIcon,
                    color: defaultIconColor,
                    size: 32.sp,
                  ),
                ),
              ],
              SizedBox(height: 24.h),
              AppText(
                text: message,
                textAlign: TextAlign.center,
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 28.h),
              CustomButtonWidget(
                width: 140.w,
                height: 40.h,
                onPressed: onButtonPressed,
                text: buttonText,
                type: ButtonType.elevated,
                borderRadius: 6.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
