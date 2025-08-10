import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_color.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: AppColor.pureWhite.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColor.pureWhite.withOpacity(0.2)),
          ),
          child: Text(
            'AML Gold Guard',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColor.pureWhite,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Advanced Anti-Money Laundering',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColor.pureWhite.withOpacity(0.9),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 1.h),
        Text(
          'نظام متقدم لمكافحة غسيل الأموال',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColor.pureWhite.withOpacity(0.8),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
