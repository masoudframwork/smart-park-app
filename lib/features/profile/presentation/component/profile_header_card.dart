import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_color.dart';
import '../../data/models/user_profile.dart';

class ProfileHeaderCard extends StatelessWidget {
  final UserProfile profile;
  final Widget? trailingLogo;

  const ProfileHeaderCard({
    super.key,
    required this.profile,
    this.trailingLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          // 🔹 Background (Top Strip)
          Container(
            height: 90.h,
            color: AppColor.primaryBackgroundColor, // Dark green
          ),

          // 🔹 Foreground Content
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Right Side
                Align(
                  alignment: Alignment.topRight,
                  child: trailingLogo ?? const SizedBox.shrink(),
                ),
                SizedBox(height: 12.h),

                // 🔹 Green Name Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primaryButtonColor, // Green button color
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          profile.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColor.whiteTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),

                      // Avatar Circle
                      Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.whiteColor,
                        ),
                        child: Icon(
                          Icons.person_rounded,
                          color: AppColor.primaryButtonColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
