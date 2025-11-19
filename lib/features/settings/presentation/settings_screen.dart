// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:smart/core/theme/app_color.dart';
// import 'package:smart/generated/l10n.dart';
// import 'widgets/settings_item.dart';
// import 'widgets/settings_toggle_item.dart';
//
// class SettingsScreen extends ConsumerStatefulWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends ConsumerState<SettingsScreen> {
//   bool isDark = false;
//   bool isArabic = true;
//
//   @override
//   Widget build(BuildContext context) {
//     final s = S.of(context);
//
//     return Scaffold(
//       backgroundColor: AppColor.settingsBackgroundColor,
//
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//
//             SizedBox(height: 30.h),
//
//             /// ------- PAGE TITLE + ARROW -------
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   s.settings_title,
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold,
//                     color: AppColor.blackColor,
//                   ),
//                 ),
//                 SizedBox(width: 8.w),
//                 const Icon(Icons.arrow_forward, color: AppColor.primaryButtonColor),
//               ],
//             ),
//
//             SizedBox(height: 20.h),
//
//             /// ------- LIST ITEMS -------
//             SettingsItem(
//               title: s.settings_terms,
//               onTap: () {},
//             ),
//             SettingsItem(
//               title: s.settings_privacy,
//               onTap: () {},
//             ),
//             SettingsItem(
//               title: s.settings_faq,
//               onTap: () {},
//             ),
//             SettingsItem(
//               title: s.settings_support,
//               onTap: () {},
//             ),
//
//             /// ------- DARK MODE -------
//             SettingsToggleItem(
//               title: s.settings_dark_mode,
//               value: isDark,
//               leading: const Icon(Icons.nights_stay, color: AppColor.primaryButtonColor),
//               onChanged: (val) {
//                 setState(() => isDark = val);
//               },
//             ),
//
//             /// ------- LANGUAGE -------
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//               decoration: BoxDecoration(
//                 color: AppColor.whiteColor,
//                 borderRadius: BorderRadius.circular(10.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 6,
//                     offset: const Offset(0, 3),
//                   )
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     s.settings_language,
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
//                   ),
//                   const Spacer(),
//                   _buildLanguageToggle()
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLanguageToggle() {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColor.containerSecondaryColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
//       child: Row(
//         children: [
//           Text(
//             S.current.settings_lang_en,
//             style: TextStyle(color: !isArabic ? Colors.green : Colors.grey),
//           ),
//           Switch(
//             value: isArabic,
//             activeColor: Colors.green,
//             onChanged: (val) => setState(() => isArabic = val),
//           ),
//           Text(
//             S.current.settings_lang_ar,
//             style: TextStyle(color: isArabic ? Colors.green : Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';

import '../../../core/theme/app_text_theme.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_image_widget.dart';
import '../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.settingsBackgroundColor,
        appBar: CustomAppBar(
          backgroundColor: AppColor.backgroundAppBarColor,
          leading: CircleImageButton(
            onTap: () {},
            imageUrl: AppImages.appLogo,
            size: 37,
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const _SettingsHeader(),
              SizedBox(height: 16.h),
              const _SettingsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        spacing: 15.w,
        children: [
          _ArrowBackButton(
            onTap: () => Navigator.of(context).pop(),
          ),
          AppText(
            text: 'الإعدادات',
            appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
              color: AppColor.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ArrowBackButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34.w,
        height: 34.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        child: CustomImageWidget(
          imageUrl: AppImages.arrowRightIcon,
          width: 20.w,
          height: 20.w,
          isFlag: true,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}

class _SettingsList extends StatelessWidget {
  const _SettingsList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          spacing: 12.h,
          children: [
            SettingsCard(
              title: 'الشروط و الأحكام',
              onTap: () {





              },
            ),
            SettingsCard(
              title: 'سياسة الخصوصية',
              onTap: () {},
            ),
            SettingsCard(
              title: 'الأسئلة الشائعة',
              onTap: () {},
            ),
            SettingsCard(
              title: 'المساعدة و الدعم الفني',
              onTap: () {},
            ),
            SettingsCard(
              title: 'الوضع الليلي',
              trailing: const _NightModeTrailing(),
              onTap: () {},
            ),
            SettingsCard(
              title: 'اللغة',
              trailing: const _LanguageTrailing(),
              onTap: () {},
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsCard({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColor.contanearGreyColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          AppText(
            text: title,
            appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(),
          ),
          const Spacer(),
          trailing ?? const _ArrowIcon(),
        ],
      ),
    );

    if (onTap == null) return content;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: content,
    );
  }
}

class _ArrowIcon extends StatelessWidget {
  const _ArrowIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_outlined,
      color: AppColor.primaryColor,
      size: 20,
    );
  }
}

class _NightModeTrailing extends StatelessWidget {
  const _NightModeTrailing();

  @override
  Widget build(BuildContext context) {
    const bool isDark = false;

    return Row(
      spacing: 8.w,
      children: [
        Switch(
          value: isDark,
          onChanged: (_) {},
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          trackColor: WidgetStateProperty.resolveWith((states) {
            final isOn = states.contains(WidgetState.selected);
            return isOn ? AppColor.primaryColor : AppColor.contanearGreyColor;
          }),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          trackOutlineWidth: WidgetStateProperty.all(0),
          thumbColor: WidgetStateProperty.all(AppColor.whiteColor),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        SvgPicture.asset(
          AppImages.dark,
        ),
      ],
    );
  }
}

class _LanguageTrailing extends StatelessWidget {
  const _LanguageTrailing();

  @override
  Widget build(BuildContext context) {
    const bool isArabic = true;

    final enStyle = AppTextTheme.titleMediumTextStyle().copyWith(
      color: isArabic ? AppColor.contanearGreyColor : AppColor.primaryColor,
    );
    final arStyle = AppTextTheme.titleMediumTextStyle().copyWith(
        // color: isArabic ? AppColor.primaryColor : AppColor.contanearGreyColor,
        );

    return Row(
      spacing: 8.w,
      children: [
        AppText(
          text: 'En',
          appTextTheme: AppTextTheme.titleMediumTextStyle()
              .copyWith(color: AppColor.blackColor),
        ),
        Switch(
          value: true,
          onChanged: (_) {},
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          trackColor: WidgetStateProperty.resolveWith((states) {
            final isOn = states.contains(WidgetState.selected);
            return isOn ? AppColor.primaryColor : AppColor.greyColor;
          }),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          trackOutlineWidth: WidgetStateProperty.all(0),
          thumbColor: WidgetStateProperty.all(AppColor.whiteColor),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        AppText(
          text: 'عر',
          appTextTheme: AppTextTheme.titleMediumTextStyle()
              .copyWith(color: AppColor.blackColor),
        ),
      ],
    );
  }
}
