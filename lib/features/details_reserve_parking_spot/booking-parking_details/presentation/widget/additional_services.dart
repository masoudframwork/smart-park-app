import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/constants/image_string.dart';

class AdditionalServicesSection extends StatelessWidget {
  const AdditionalServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    const items = <_ServiceItem>[
      _ServiceItem(title: 'خدمة غسيل', iconPath: AppImages.laundryService),
      _ServiceItem(title: 'شحن EV', iconPath: AppImages.shipping2),
      _ServiceItem(title: 'مظلّة', iconPath: AppImages.umbrella),
      _ServiceItem(title: 'WIFI مجاني', iconPath: AppImages.wifi),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'الخدمات الإضافية',
          appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
            color: AppColor.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: items
              .map(
                (e) => SizedBox(
                  width: (361.w - 12.w) / 2,
                  child: _ServiceCard(item: e),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ServiceItem {
  final String title;
  final String iconPath;

  const _ServiceItem({
    required this.title,
    required this.iconPath,
  });
}

class _ServiceCard extends StatelessWidget {
  final _ServiceItem item;

  const _ServiceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 12.w),
          SvgPicture.asset(
            item.iconPath,
          ),
          SizedBox(width: 12.w),
          AppText(
            text: item.title,
            appTextTheme: AppTextTheme.titleSmallTextStyle().copyWith(
              color: AppColor.blackNumberSmallColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
