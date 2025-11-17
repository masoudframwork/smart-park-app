import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/generated/l10n.dart';

import '../data/models/user_profile.dart';
import 'component/profile_header.dart';
import 'component/profile_tile.dart';


class ProfileScreen extends StatelessWidget {
  final UserProfile? profile; // change later when API ready

  const ProfileScreen({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    final text = S.of(context); // localization shortcut

    return Scaffold(
      backgroundColor: AppColor.lightPurpleColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// TOP HEADER
              ProfileHeader(
                fullName: profile?.fullName ?? "عبدالرحمن أحمد عبدالله",
                avatarIcon: Icons.person_rounded,
              ),

              SizedBox(height: 20.h),

              /// NATIONAL ID + PHONE
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Label(text.profile_nationalId),
                          _Value(profile?.nationalId ?? "ABCD1234"),
                          SizedBox(height: 20.h),
                          _Label(text.profile_phoneNumber),
                          _Value(profile?.phoneNumber ?? "+966 11 234 5678"),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// Additional Information
                    _SectionTitle(text.profile_additionalInfo),

                    ProfileTile(
                      title: text.profile_fines,
                      icon: Icons.receipt_long_rounded,
                    ),
                    ProfileTile(
                      title: text.profile_wallet,
                      icon: Icons.account_balance_wallet_rounded,
                    ),

                    SizedBox(height: 20.h),

                    /// Saved Information
                    _SectionTitle(text.profile_savedInfo),

                    ProfileTile(
                      title: text.profile_vehicles,
                      icon: Icons.local_shipping_rounded,
                    ),
                    ProfileTile(
                      title: text.profile_paymentCards,
                      icon: Icons.credit_card_rounded,
                    ),
                    ProfileTile(
                      title: text.profile_settings,
                      icon: Icons.settings_rounded,
                    ),

                    SizedBox(height: 25.h),

                    /// LOGOUT BUTTON
                    _LogoutButton(text.profile_logout),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Label(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColor.greyTextColor,
      ),
    );
  }

  Widget _Value(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.blackColor,
      ),
    );
  }

  Widget _SectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryButtonColor,
        ),
      ),
    );
  }

  Widget _LogoutButton(String text) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.red.shade400,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/// Wrapper card
class _SectionCard extends StatelessWidget {
  final Widget child;
  const _SectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
