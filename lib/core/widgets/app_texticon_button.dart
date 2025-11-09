import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import '../constants/image_string.dart';
import '../theme/app_text_theme.dart';
import 'app_text.dart';
import 'custom_image_widget.dart';

class AppTextIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const AppTextIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: text,
            appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8.w),
          CustomImageWidget(
            isFlag: true,
            imageUrl: AppImages.arrowIcon,
            width: 20.w,
            height: 20.h,
            color: AppColor.whiteColor,
          ),
        ],
      ),
    );
  }
}
