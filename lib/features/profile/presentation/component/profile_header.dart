import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';

class ProfileHeader extends StatelessWidget {
  final String fullName;
  final IconData avatarIcon;

  const ProfileHeader({
    super.key,
    required this.fullName,
    required this.avatarIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryButtonColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            right: 16.w,
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColor.whiteColor,
              child: Icon(Icons.account_circle, color: AppColor.primaryColor),
            ),
          ),

          Positioned(
            top: 70.h,
            left: 16.w,
            right: 16.w,
            child: Container(
              height: 55.h,
              decoration: BoxDecoration(
                color: AppColor.primaryButtonColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  fullName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
