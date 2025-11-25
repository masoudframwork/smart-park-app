// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smart/core/theme/app_color.dart';
// import 'package:smart/core/theme/app_text_theme.dart';
// import 'package:smart/core/widgets/app_text.dart';
// import 'package:smart/core/widgets/custom_button.dart';
//
// class AppResultDialog extends StatelessWidget {
//   final String message;
//   final String? subMessage;
//
//   /// ONE BUTTON
//   final String mainButtonText;
//   final VoidCallback onMainPressed;
//
//   /// OPTIONAL SECOND BUTTON
//   final String? secondaryButtonText;
//   final VoidCallback? onSecondaryPressed;
//
//   /// ICON
//   final IconData defaultIcon;
//   final Color defaultIconBackgroundColor;
//   final Color defaultIconColor;
//
//   const AppResultDialog({
//     super.key,
//     required this.message,
//     this.subMessage,
//     required this.mainButtonText,
//     required this.onMainPressed,
//     this.secondaryButtonText,
//     this.onSecondaryPressed,
//     this.defaultIcon = Icons.check,
//     this.defaultIconBackgroundColor = AppColor.primaryColor,
//     this.defaultIconColor = Colors.white,
//   });
//
//   bool get hasTwoButtons =>
//       secondaryButtonText != null && onSecondaryPressed != null;
//
//   @override
//   Widget build(BuildContext context) {
//     final isArabic = Directionality.of(context) == TextDirection.rtl;
//
//     return Center(
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           width: 0.78.sw,
//           padding: EdgeInsets.symmetric(
//             horizontal: 24.w,
//             vertical: 28.h,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16.r),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.15),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // ICON
//               Container(
//                 width: 64.w,
//                 height: 64.w,
//                 decoration: BoxDecoration(
//                   color: defaultIconBackgroundColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   defaultIcon,
//                   color: defaultIconColor,
//                   size: 32.sp,
//                 ),
//               ),
//
//               SizedBox(height: 24.h),
//
//               // MAIN MESSAGE
//               AppText(
//                 text: message,
//                 textAlign: TextAlign.center,
//                 appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//
//               if (subMessage != null) ...[
//                 SizedBox(height: 8.h),
//                 AppText(
//                   text: subMessage!,
//                   textAlign: TextAlign.center,
//                   appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//
//               SizedBox(height: 28.h),
//
//               // BUTTONS
//               hasTwoButtons ? _buildTwoButtons() : _buildSingleButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// ONE BUTTON
//   Widget _buildSingleButton() {
//     return CustomButtonWidget(
//       width: 140.w,
//       height: 40.h,
//       onPressed: onMainPressed,
//       text: mainButtonText,
//       type: ButtonType.elevated,
//       borderRadius: 6.r,
//     );
//   }
//
//   /// TWO BUTTONS
//   Widget _buildTwoButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: CustomButtonWidget(
//             width: 130.w,
//             height: 40.h,
//             onPressed: onSecondaryPressed!,
//             text: secondaryButtonText!,
//             type: ButtonType.outlined,
//             borderRadius: 6.r,
//           ),
//         ),
//
//         SizedBox(width: 10.h),
//
//         Expanded(
//           child: CustomButtonWidget(
//             width: 130.w,
//             height: 40.h,
//             onPressed: onMainPressed,
//             text: mainButtonText,
//             type: ButtonType.elevated,
//             borderRadius: 6.r,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/custom_button.dart';

class AppResultDialog extends StatelessWidget {
  final String? message;

  final String? subMessage;

  final String? mainButtonText;

  final VoidCallback? onMainPressed;

  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  final IconData defaultIcon;
  final Color defaultIconBackgroundColor;
  final Color defaultIconColor;

  const AppResultDialog({
    super.key,
    this.message,
    this.subMessage,
    this.mainButtonText,
    this.onMainPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.defaultIcon = Icons.check,
    this.defaultIconBackgroundColor = AppColor.primaryColor,
    this.defaultIconColor = Colors.white,
  });

  bool get hasTwoButtons =>
      secondaryButtonText != null && onSecondaryPressed != null;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 0.78.sw,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 28.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ICON
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: defaultIconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  defaultIcon,
                  color: defaultIconColor,
                  size: 32.sp,
                ),
              ),

              SizedBox(height: 24.h),

              // MAIN MESSAGE
              AppText(
                text: message ?? '',
                textAlign: TextAlign.center,
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              if (subMessage != null) ...[
                SizedBox(height: 8.h),
                AppText(
                  text: subMessage!,
                  textAlign: TextAlign.center,
                  appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
                    color: Colors.black54,
                  ),
                ),
              ],

              SizedBox(height: 28.h),

              // BUTTONS
              hasTwoButtons
                  ? _buildTwoButtons(context)
                  : _buildSingleButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// زر واحد
  Widget _buildSingleButton(BuildContext context) {
    return CustomButtonWidget(
      width: 140.w,
      height: 40.h,
      onPressed: onMainPressed ?? () => Navigator.of(context).pop(),
      text: mainButtonText ?? 'OK',
      type: ButtonType.elevated,
      borderRadius: 6.r,
    );
  }

  /// زرين
  Widget _buildTwoButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButtonWidget(
            width: 130.w,
            height: 40.h,
            onPressed: onSecondaryPressed ?? () => Navigator.of(context).pop(),
            text: secondaryButtonText ?? 'Cancel',
            type: ButtonType.outlined,
            borderRadius: 6.r,
          ),
        ),
        SizedBox(width: 10.h),
        Expanded(
          child: CustomButtonWidget(
            width: 130.w,
            height: 40.h,
            onPressed: onMainPressed ?? () => Navigator.of(context).pop(),
            text: mainButtonText ?? 'OK',
            type: ButtonType.elevated,
            borderRadius: 6.r,
          ),
        ),
      ],
    );
  }
}
