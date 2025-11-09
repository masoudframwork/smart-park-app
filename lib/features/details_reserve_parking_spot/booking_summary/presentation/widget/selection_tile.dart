import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class SelectionTile extends StatelessWidget {
  final String title;
  final Widget? trailingImage;

  const SelectionTile({
    super.key,
    required this.title,
    this.trailingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360.w,
        height: 66.h,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            trailingImage!,
            SizedBox(
              width: 12.w,
            ),
            AppText(
              text: title,
              appTextTheme: AppTextTheme.titleSmallTextStyle().copyWith(
                color: AppColor.blackNumberSmallColor,
              ),
            ),
          ],
        ));
  }
}

class TimeSummaryTile extends StatelessWidget {
  final TimeOfDay start;
  final TimeOfDay end;
  final IconData editIcon;
  final VoidCallback? onTap;

  const TimeSummaryTile({
    super.key,
    required this.start,
    required this.end,
    this.editIcon = Icons.edit,
    this.onTap,
  });

  String _two(int n) => n.toString().padLeft(2, '0');

  String _format12hArabic(TimeOfDay t) {
    final h = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final m = _two(t.minute);
    final period = t.period == DayPeriod.am ? 'ص' : 'م';
    return '$h:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 360.w,
        height: 66.h,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            AppText(
              text: _format12hArabic(start),
              appTextTheme: AppTextTheme.timeTextStyle().copyWith(
                color: AppColor.blackColor,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 30.w),
            Image.asset(
              AppImages.arrowIcon,
              width: 24.w,
              height: 24.h,
              color: AppColor.primaryColor,
            ),
            SizedBox(width: 30.w),
            AppText(
              text: _format12hArabic(end),
              appTextTheme: AppTextTheme.timeTextStyle().copyWith(
                color: AppColor.blackColor,
                fontSize: 20,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
