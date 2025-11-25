import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/image_string.dart';
import '../../../../../../core/theme/app_color.dart';
import '../../../../../../core/theme/app_text_theme.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/arrow_widget_custom_bar.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';
import '../../../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../../../generated/l10n.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

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
                title: S.of(context).help_support_title,
              ),

              SizedBox(height: 16.h),

              /// Contact Us
              _CardItem(
                icon: AppImages.helpSupportContactUs,
                title: S.of(context).help_contact_us,
              ),
              SizedBox(height: 12.h),

              /// Message Us
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

class _CardItem extends StatelessWidget {
  final String icon;
  final String title;

  const _CardItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.contanearGreyColor, width: 1),
      ),
      child: Row(
        children: [
          /// TEXT first (left)
          Expanded(
            child: Align(
              alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
              child: AppText(
                text: title,
                appTextTheme: AppTextTheme.titleMediumTextStyle(),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          /// ICON second (right)
          CustomImageWidget(
            imageUrl: icon,
            width: 22.w,
            height: 22.w,
            isFlag: true,
            color: AppColor.primaryColor,
          ),
        ],
      ),
    );
  }
}
