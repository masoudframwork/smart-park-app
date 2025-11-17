// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/theme/app_color.dart';
// import '../../../../../core/theme/app_text_theme.dart';
// import '../../../../../core/widgets/app_text.dart';
//
// class DayPriceCard extends StatelessWidget {
//   const DayPriceCard({super.key});
//
//   static const List<_PricePeriod> _periods = [
//     _PricePeriod(
//       label: 'مجانا',
//       timeStart: '7:00 ص',
//       timeEnd: '11:59 ص',
//     ),
//     _PricePeriod(
//       label: '# 5',
//       timeStart: '12:00 م',
//       timeEnd: '10:59 م',
//       isHighlighted: true,
//     ),
//     _PricePeriod(
//       label: 'مغلق',
//       timeStart: '11:00 م',
//       timeEnd: '6:59 ص',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 361.w,
//       height: 120.h,
//       decoration: BoxDecoration(
//         color: AppColor.whiteColor,
//         border: Border.all(
//           color: AppColor.greyDividerColor,
//           width: 1.w,
//         ),
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Padding(
//         padding:  EdgeInsets.all(10.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppText(
//               text: 'السعر على مدار اليوم',
//               appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
//                 color: AppColor.textColor,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 12.h),
//             ..._periods.map(
//               (p) => _PriceRow(period: p),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _PriceRow extends StatelessWidget {
//   final _PricePeriod period;
//
//   const _PriceRow({required this.period});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             AppText(
//               text: period.timeStart,
//               appTextTheme: AppTextTheme.timeTextStyle().copyWith(
//                 color: AppColor.blackNumberSmallColor,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             SizedBox(width: 8.w),
//             AppText(
//               text: '←',
//               appTextTheme: AppTextTheme.timeTextStyle().copyWith(
//                 color: AppColor.blackNumberSmallColor,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             SizedBox(width: 8.w),
//             AppText(
//               text: period.timeEnd,
//               appTextTheme: AppTextTheme.timeTextStyle().copyWith(
//                 color: AppColor.blackNumberSmallColor,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 20.h),
//         AppText(
//           text: period.label,
//           appTextTheme: AppTextTheme.timeTextStyle().copyWith(
//             color: AppColor.blackNumberSmallColor,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class _PricePeriod {
//   final String label;
//   final String timeStart;
//   final String timeEnd;
//   final bool isHighlighted;
//
//   const _PricePeriod({
//     required this.label,
//     required this.timeStart,
//     required this.timeEnd,
//     this.isHighlighted = false,
//   });
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class DayPriceCard extends StatelessWidget {
  const DayPriceCard({
    super.key,
    this.leadingIcon,
  });

  final Widget? leadingIcon;

  static const List<_PricePeriod> _periods = [
    _PricePeriod(
      label: 'مجانا',
      timeStart: '7:00 ص',
      timeEnd: '11:59 ص',
    ),
    _PricePeriod(
      label: '5',
      timeStart: '12:00 م',
      timeEnd: '10:59 م',
      isHighlighted: true,
      showCurrencyIcon: true, // هنا رح تنعرض الصورة جنب 5
    ),
    _PricePeriod(
      label: 'مغلق',
      timeStart: '11:00 م',
      timeEnd: '6:59 ص',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(10.h),
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
                  text: 'السعر على مدار اليوم',
                  appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            ..._periods.map(
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
              text: '←',
              appTextTheme: timeStyle,
            ),
            SizedBox(width: 12.w),
            AppText(
              text: period.timeEnd,
              appTextTheme: timeStyle,
            ),
          ],
        ),
        SizedBox(width: 22.w),
        Row(
          children: [

            AppText(
              text: period.label,
              appTextTheme: labelStyle,
            ),
            if (period.showCurrencyIcon) ...[
              SizedBox(width: 4.w),
              SvgPicture.asset(
                AppImages.realSu,


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
