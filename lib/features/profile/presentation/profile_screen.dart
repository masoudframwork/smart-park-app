import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_color.dart';
import '../data/models/user_profile.dart';
import 'component/profile_header_card.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile profile;

  const ProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                // HEADER
                ProfileHeaderCard(
                  profile: profile,
                ),

                SizedBox(height: 12.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ===== BASIC INFO CARD =====
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 14.h),
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.shadowCardColor,
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'رقم الهوية',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.greyTextColor,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              profile.nationalId,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.blackTextColor,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Divider(color: AppColor.greyDividerColor),
                            SizedBox(height: 12.h),
                            Text(
                              'رقم الهاتف',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.greyTextColor,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              profile.phoneNumber,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),

                      _sectionTitle("بيانات إضافية"),

                      SizedBox(height: 12.h),

                      Row(
                        children: [
                          Expanded(
                            child: _smallButton(
                              title: "المخالفات",
                              icon: Icons.receipt_long_rounded,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: _smallButton(
                              title: "المحفظة",
                              icon: Icons.account_balance_wallet_outlined,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),

                      _sectionTitle("المعلومات المحفوظة مسبقًا"),
                      SizedBox(height: 12.h),

                      _largeTile(
                        title: "المركبات",
                        icon: Icons.directions_car_rounded,
                      ),
                      SizedBox(height: 12.h),
                      _largeTile(
                        title: "بطاقات الدفع الإلكتروني",
                        icon: Icons.credit_card,
                        showDot: true,
                      ),
                      SizedBox(height: 12.h),
                      _largeTile(
                        title: "الإعدادات",
                        icon: Icons.settings_rounded,
                      ),

                      SizedBox(height: 28.h),

                      // LOGOUT BUTTON
                      SizedBox(
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.secondaryContainerColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "تسجيل الخروج",
                            style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===== Helper Widgets =====

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryTextColor,
      ),
    );
  }

  Widget _smallButton({
    required String title,
    required IconData icon,
  }) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowCardColor,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.blackTextColor,
            ),
          ),
          const Spacer(),
          Icon(icon, size: 22, color: AppColor.primaryColor),
        ],
      ),
    );
  }

  Widget _largeTile({
    required String title,
    required IconData icon,
    bool showDot = false,
  }) {
    return Container(
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowCardColor,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.blackTextColor,
            ),
          ),
          const Spacer(),
          if (showDot)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryTextColor,
              ),
            ),
          if (showDot) SizedBox(width: 8.w),
          Icon(icon, size: 22, color: AppColor.primaryColor),
        ],
      ),
    );
  }
}
