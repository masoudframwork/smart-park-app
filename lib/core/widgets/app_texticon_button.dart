import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../image_string.dart';
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Icon(icon, size: 20.sp, color: AppColor.blackColor),
            CustomImageWidget(
              isFlag: true,
              imageUrl: AImages.arrowIcon,
              width: 25.w,
              height: 25.h,
            ),

            SizedBox(width: 12.w),
            AppText(
              text: text,
              appTextTheme: AppTextTheme.titleLargeTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
