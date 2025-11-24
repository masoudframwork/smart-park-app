import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/settings/presentation/terms/help_support_screen.dart';
import 'package:smart/features/settings/presentation/terms/terms_conditions_screen.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/arrow_widget_custom_bar.dart';
import '../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../generated/l10n.dart';
import '../../../l10n/app_locale.dart';

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
            imageUrl: AppImages.appLogo,
            size: 37,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              ArrowWidgetCustomBar(
                onTap: () {
                  Navigator.of(context).pop();
                },
                title: S.of(context).settings_title,
              ),
              SizedBox(height: 16.h),
              const _SettingsList(),
            ],
          ),
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
              title: S.of(context).settings_terms,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TermsScreen()),
                );
              },
            ),
            SettingsCard(
              title:  S.of(context).settings_privacy,
              onTap: () {},
            ),
            SettingsCard(
              title:  S.of(context).settings_faq,
              onTap: () {},
            ),
            SettingsCard(
              title:  S.of(context).settings_support,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpSupportScreen()),
                );
              },
            ),
            SettingsCard(
              title:  S.of(context).settings_dark_mode,
              trailing: const _NightModeTrailing(),
              onTap: () {},
            ),
            SettingsCard(
              title:  S.of(context).settings_language,
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

// class _LanguageTrailing extends StatelessWidget {
//   const _LanguageTrailing();
//
//   @override
//   Widget build(BuildContext context) {
//     const bool isArabic = true;
//
//     return Row(
//       spacing: 8.w,
//       children: [
//         AppText(
//           text: 'En',
//           appTextTheme: AppTextTheme.titleMediumTextStyle()
//               .copyWith(color: AppColor.blackColor),
//         ),
//         Switch(
//           value: true,
//           onChanged: (_) {},
//           overlayColor: WidgetStateProperty.all(Colors.transparent),
//           trackColor: WidgetStateProperty.resolveWith((states) {
//             final isOn = states.contains(WidgetState.selected);
//             return isOn ? AppColor.primaryColor : AppColor.greyColor;
//           }),
//           trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
//           trackOutlineWidth: WidgetStateProperty.all(0),
//           thumbColor: WidgetStateProperty.all(AppColor.whiteColor),
//           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         ),
//         AppText(
//           text: 'عر',
//           appTextTheme: AppTextTheme.titleMediumTextStyle()
//               .copyWith(color: AppColor.blackColor),
//         ),
//       ],
//     );
//   }
// }

class _LanguageTrailing extends StatelessWidget {
  const _LanguageTrailing();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppLocale>(
      builder: (context, _, localeModel) {
        final isArabic = localeModel.isArabic();

        return Row(
          spacing: 8.w,
          children: [
            AppText(
              text: 'En',
              appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                color: isArabic ? AppColor.blackColor : AppColor.primaryColor,
              ),
            ),
            Switch(
              value: isArabic,
              onChanged: (_) async {
                await localeModel.changeLanguage();
              },
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              trackColor: WidgetStateProperty.resolveWith((states) {
                final isOn = states.contains(WidgetState.selected);
                return isOn ? AppColor.primaryColor : AppColor.primaryColor;
              }),
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              trackOutlineWidth: WidgetStateProperty.all(0),
              thumbColor: WidgetStateProperty.all(AppColor.whiteColor),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            AppText(
              text: 'عر',
              appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                color: AppColor.primaryColor,
                // isArabic ? AppColor.primaryColor : AppColor.blackColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
