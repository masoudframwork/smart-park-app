import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  final Widget? leading;

  final double leadingSize;

  final double gap;
  final Color? tint;

  const SectionTitle({
    super.key,
    required this.title,
    this.leading,
    this.leadingSize = 30,
    this.gap = 8,
    this.tint,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null)
          SizedBox(
            width: leadingSize.w,
            height: leadingSize.w,
            child: FittedBox(
              fit: BoxFit.contain,
              child: leading!,
            ),
          ),
        if (leading != null) SizedBox(width: gap.w),
        AppText(
          text: title,
          appTextTheme: AppTextTheme.bodyLargeTextStyle().copyWith(
            color: AppColor.blackTextColor,
          ),
        ),
      ],
    );

    return IconTheme.merge(
      data: IconThemeData(
        color: tint ?? AppColor.primaryColor,
        size: leadingSize.w,
      ),
      child: DefaultTextStyle.merge(
        style: AppTextTheme.bodyLargeTextStyle(),
        child: child,
      ),
    );
  }
}
