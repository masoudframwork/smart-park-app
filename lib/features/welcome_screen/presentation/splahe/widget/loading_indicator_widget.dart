import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final String text;

  const LoadingIndicatorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColor.pureWhite.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.pureWhite.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.pureWhite.withOpacity(0.3)),
              ),
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColor.pureWhite.withOpacity(0.9),
                ),
                backgroundColor: AppColor.pureWhite.withOpacity(0.2),
              ),
            ),
            SizedBox(height: 30.h),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                text,
                key: ValueKey<String>(text),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColor.pureWhite.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
