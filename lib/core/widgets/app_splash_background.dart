import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_color.dart';

class AppSplashBackground extends StatelessWidget {
  final Widget child;
  const AppSplashBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: AppColor.whiteColor,
      child: Stack(
        children: [
          Positioned(
            top: -77.h,
            left: -77.w,
            child: Container(
              width: 250.w,
              height: 250.h,
              decoration: BoxDecoration(
                color: AppColor.secondaryButtonColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(250.r),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -50.h,
            right: -50.w,
            child: Container(
              width: 250.w,
              height: 250.h,
              decoration: BoxDecoration(
                color: AppColor.secondaryButtonColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(250.r),
                ),
              ),
            ),
          ),

          Center(child: child),
        ],
      ),
    );
  }
}
