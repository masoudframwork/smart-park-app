// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../core/theme/app_color.dart';
// import '../../../../../core/theme/app_text_theme.dart';
// import '../../../../../core/widgets/app_text.dart';
// import '../../../../../generated/l10n.dart';
//
// class BookingTabBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTabChanged;
//
//   const BookingTabBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onTabChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     bool isRTL = Directionality.of(context) == TextDirection.rtl;
//
//     return Container(
//
//       margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//      // padding: EdgeInsets.all(4.w),
//       decoration: BoxDecoration(
//         color: AppColor.textColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12.r),
//           topRight: Radius.circular(12.r),
//         ),
//       ),
//
//       child: Row(
//         textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
//         children: [
//           Expanded(
//             child: _buildTab(
//               title: S.of(context).booking_current_tab,   // localization
//               isSelected: selectedIndex == 0,
//               onTap: () => onTabChanged(0),
//               isRTL: isRTL,
//             ),
//           ),
//           Expanded(
//             child: _buildTab(
//               title: S.of(context).booking_previous_tab, // localization
//               isSelected: selectedIndex == 1,
//               onTap: () => onTabChanged(1),
//               isRTL: isRTL,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTab({
//     required String title,
//     required bool isSelected,
//     required VoidCallback onTap,
//     required bool isRTL,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 38.h,
//             alignment: Alignment.center,
//             child: AppText(
//               text: title,
//               appTextTheme: AppTextTheme.mainButtonTextStyle(),
//             ),
//           ),
//
//           /// Bottom indicator bar
//           SizedBox(
//             width: double.infinity,
//             height: 3.h,
//             //height: 3.h,
//             child: Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   color: AppColor.textColor,
//                 ),
//                 if (isSelected)
//                   Center(
//                     child: FractionallySizedBox(
//                       widthFactor: 0.7,
//                       child: Container(
//                         color: AppColor.primaryColor,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/l10n.dart';

class BookingTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const BookingTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColor.textColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Row(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Expanded(
            child: _buildTab(
              title: S.of(context).booking_current_tab,
              isSelected: selectedIndex == 0,
              onTap: () => onTabChanged(0),
              isRTL: isRTL,
            ),
          ),
          Expanded(
            child: _buildTab(
              title: S.of(context).booking_previous_tab,
              isSelected: selectedIndex == 1,
              onTap: () => onTabChanged(1),
              isRTL: isRTL,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isRTL,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 38.h,
            alignment: Alignment.center,
            child: AppText(
              text: title,
              appTextTheme: AppTextTheme.mainButtonTextStyle(),
            ),
          ),
          Container(
            width: double.infinity,
            height: 5.h,
            color: AppColor.textColor,
            child: isSelected
                ? Align(
                    alignment:
                        isRTL ? Alignment.centerRight : Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: Container(
                        height: 3.h,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
