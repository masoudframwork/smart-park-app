// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../core/theme/app_color.dart';
// import '../../../../../core/theme/app_text_theme.dart';
// import '../../../../../core/widgets/app_text.dart';
//
// class DurationRow extends StatelessWidget {
//   final int hours;
//   final VoidCallback onMinus;
//   final VoidCallback onPlus;
//   final ValueChanged<double> onChanged;
//
//   const DurationRow({
//     super.key,
//     required this.hours,
//     required this.onMinus,
//     required this.onPlus,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       spacing: 24.w,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SliderTheme(
//           data: SliderTheme.of(context).copyWith(
//             activeTrackColor: AppColor.primaryColor,
//             inactiveTrackColor: AppColor.sliderInactiveColor,
//             thumbColor: AppColor.primaryColor,
//             trackHeight: 7.0,
//             trackShape: const RectangularSliderTrackShape(),
//             thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
//           ),
//           child: Expanded(
//             child: Slider(
//               padding: EdgeInsets.symmetric(horizontal: 1.w),
//               value: hours.toDouble(),
//               min: 1,
//               max: 24,
//               onChanged: onChanged,
//             ),
//           ),
//         ),
//         Container(
//           width: 63.w,
//           height: 40.h,
//           decoration: BoxDecoration(
//             color: AppColor.whiteColor,
//             borderRadius: BorderRadius.circular(6.r),
//             border: Border.all(
//               color: AppColor.greyBorderColor,
//               width: 1.w,
//             ),
//           ),
//           child: FittedBox(
//             fit: BoxFit.scaleDown,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 AppText(
//                   text: hours.toString(),
//                   appTextTheme: AppTextTheme.numberSmallTextStyle().copyWith(
//                     color: AppColor.blackColor,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(width: 10.w),
//                 AppText(
//                   text: 'ساعات',
//                   appTextTheme: AppTextTheme.titleSmallTextStyle().copyWith(
//                       color: AppColor.greyTextVerySmallColor, fontSize: 8),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
