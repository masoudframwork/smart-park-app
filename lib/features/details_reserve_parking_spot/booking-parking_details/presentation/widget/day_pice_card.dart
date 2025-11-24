import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/l10n.dart';

class DayPriceCard extends StatelessWidget {
  const DayPriceCard({
    super.key,
    this.leadingIcon,
  });

  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    List<_PricePeriod> periods = [
      _PricePeriod(
        label: S.of(context).free,
        timeStart: '7:00 ص',
        timeEnd: '11:59 ص',
      ),
      _PricePeriod(
        label: '    5',
        timeStart: '12:00 م',
        timeEnd: '10:59 م',
        isHighlighted: true,
        showCurrencyIcon: true,
      ),
      _PricePeriod(
        label: S.of(context).close,
        timeStart: '11:00 م',
        timeEnd: '6:59 ص',
      ),
    ];

    return Container(
      width: 361.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(
          color: AppColor.greyDividerColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (leadingIcon != null) ...[
                  leadingIcon!,
                  SizedBox(width: 8.w),
                ],
                AppText(
                  text: S.of(context).pricethroughouttheday,
                  appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            ...periods.map(
              (p) => _PriceRow(period: p),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final _PricePeriod period;

  const _PriceRow({required this.period});

  @override
  Widget build(BuildContext context) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    final String arrowText = isRtl ? '←' : '→';

    final timeStyle = AppTextTheme.timeTextStyle().copyWith(
      color: AppColor.blackNumberSmallColor,
      fontWeight: FontWeight.w300,
    );

    final labelStyle = AppTextTheme.timeTextStyle().copyWith(
      color: AppColor.blackNumberSmallColor,
      fontWeight: period.isHighlighted ? FontWeight.w700 : FontWeight.w300,
    );

    return Row(
      children: [
        Row(
          children: [
            AppText(
              text: period.timeStart,
              appTextTheme: timeStyle,
            ),
            SizedBox(width: 12.w),
            AppText(
              text: arrowText,
              appTextTheme: timeStyle,
            ),
            SizedBox(width: 12.w),
            AppText(
              text: period.timeEnd,
              appTextTheme: timeStyle,
            ),
          ],
        ),
        SizedBox(width: 17.w),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: period.label,
              appTextTheme: labelStyle,
            ),
            if (period.showCurrencyIcon) ...[
              SizedBox(width: 4.w),
              SvgPicture.asset(
                AppImages.realSu,
                width: 9,
                height: 10,
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _PricePeriod {
  final String label;
  final String timeStart;
  final String timeEnd;
  final bool isHighlighted;
  final bool showCurrencyIcon;

  const _PricePeriod({
    required this.label,
    required this.timeStart,
    required this.timeEnd,
    this.isHighlighted = false,
    this.showCurrencyIcon = false,
  });
}
