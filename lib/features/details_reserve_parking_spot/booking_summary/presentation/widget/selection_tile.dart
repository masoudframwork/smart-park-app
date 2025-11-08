import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class SelectionTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget trailingImage;

  const SelectionTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.trailingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360.w,
        height: 66.h,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            trailingImage,
            SizedBox(
              width: 12.w,
            ),
            AppText(
              text: title,
              appTextTheme: AppTextTheme.titleSmallTextStyle().copyWith(
                color: AppColor.blackNumberSmallColor,
              ),
            ),
            Spacer(),
            Icon(
              leadingIcon,
              color: AppColor.primaryColor,
              size: 24.w,
            ),
          ],
        ));
  }
}
