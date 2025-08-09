import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';

class FooterInfoWidget extends StatelessWidget {
  const FooterInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: AppColor.pureWhite.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.verified_user_outlined,
                  size: 22.w,
                  color: AppColor.pureWhite.withOpacity(0.8),
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                'Secure • Compliant • Trusted',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColor.pureWhite.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
            decoration: BoxDecoration(
              color: AppColor.pureWhite.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Version 1.0.0 • Gold & Jewelry Edition',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.pureWhite.withOpacity(0.7),
                fontSize: 11,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
