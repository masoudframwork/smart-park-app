import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/image_string.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';
import '../widgets/app_text.dart';

class ArrowWidgetCustomBar extends StatelessWidget {
  final void Function()? onTap;

  String? title;

  final TextStyle? titleStyle;

  final double spacing;

  ArrowWidgetCustomBar({
    super.key,
    this.onTap,
    this.title,
    this.titleStyle,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    final Widget icon = Container(
      width: 34.w,
      height: 34.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColor.contanearGreyColor,
          width: 1,
        ),
      ),
      child: SvgPicture.asset(
        isRtl ? AppImages.arrowIcon2 : AppImages.arrowIcon,
        color: AppColor.primaryColor,
      ),
    );

    return Align(
      alignment: isRtl ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(width: spacing.w),
            Flexible(
              child: AppText(
                text: title ?? '',
                appTextTheme: (titleStyle ??
                    AppTextTheme.titleMSTextStyle().copyWith(
                      color: AppColor.textColor,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
