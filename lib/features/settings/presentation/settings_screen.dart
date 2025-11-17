import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/generated/l10n.dart';
import 'widgets/settings_item.dart';
import 'widgets/settings_toggle_item.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool isDark = false;
  bool isArabic = true;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColor.lightBackgroundColor,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 30.h),

            /// ------- PAGE TITLE + ARROW -------
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  s.settings_title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
                  ),
                ),
                SizedBox(width: 8.w),
                const Icon(Icons.arrow_forward, color: AppColor.primaryButtonColor),
              ],
            ),

            SizedBox(height: 20.h),

            /// ------- LIST ITEMS -------
            SettingsItem(
              title: s.settings_terms,
              onTap: () {},
            ),
            SettingsItem(
              title: s.settings_privacy,
              onTap: () {},
            ),
            SettingsItem(
              title: s.settings_faq,
              onTap: () {},
            ),
            SettingsItem(
              title: s.settings_support,
              onTap: () {},
            ),

            /// ------- DARK MODE -------
            SettingsToggleItem(
              title: s.settings_dark_mode,
              value: isDark,
              leading: const Icon(Icons.nights_stay, color: AppColor.primaryButtonColor),
              onChanged: (val) {
                setState(() => isDark = val);
              },
            ),

            /// ------- LANGUAGE -------
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  Text(
                    s.settings_language,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                  ),
                  const Spacer(),
                  _buildLanguageToggle()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageToggle() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.containerSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Row(
        children: [
          Text(
            S.current.settings_lang_en,
            style: TextStyle(color: !isArabic ? Colors.green : Colors.grey),
          ),
          Switch(
            value: isArabic,
            activeColor: Colors.green,
            onChanged: (val) => setState(() => isArabic = val),
          ),
          Text(
            S.current.settings_lang_ar,
            style: TextStyle(color: isArabic ? Colors.green : Colors.grey),
          ),
        ],
      ),
    );
  }
}
