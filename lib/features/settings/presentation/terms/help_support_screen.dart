import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../generated/l10n.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

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
          // title: S.of(context).terms_title,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              const _HelpAndSupportHeader(),
              SizedBox(height: 16.h),
              _CardItem(
                icon: AppImages.helpSupportContactUs,
                title: S.of(context).help_contact_us,
              ),
              SizedBox(height: 12.h),
              _CardItem(
                icon: AppImages.helpSupportMessageUs,
                title: S.of(context).help_message_us,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HelpAndSupportHeader extends StatelessWidget {
  const _HelpAndSupportHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        spacing: 15.w,
        children: [
          _ArrowBackButton(
            onTap: () => Navigator.of(context).pop(),
          ),
          AppText(
            text: S.of(context).help_support_title,
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

class _CardItem extends StatelessWidget {
  final String icon;
  final String title;

  const _CardItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Detect if current language is RTL (Arabic)
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.contanearGreyColor, width: 1),
      ),

      // Build Row based on language direction
      child: Row(
        children: isRTL
            ? [
                // Arabic: TEXT RIGHT → ICON LEFT
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AppText(
                      text: title,
                      appTextTheme: AppTextTheme.titleMediumTextStyle(),
                    ),
                  ),
                ),
                CustomImageWidget(
                  imageUrl: icon,
                  width: 22.w,
                  height: 22.w,
                  isFlag: true,
                  color: AppColor.primaryColor,
                ),
              ]
            : [
                // English: TEXT LEFT → ICON RIGHT
                CustomImageWidget(
                  imageUrl: icon,
                  width: 22.w,
                  height: 22.w,
                  isFlag: true,
                  color: AppColor.primaryColor,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: title,
                      appTextTheme: AppTextTheme.titleMediumTextStyle(),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
