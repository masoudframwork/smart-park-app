//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../core/theme/app_color.dart' show AppColor;
// import '../../../../../core/theme/app_text_theme.dart';
// import '../../../../../core/widgets/app_text.dart';
//
// class PaymentMethodCard extends StatelessWidget {
//   final bool isSelected;
//   final bool isAddNew;
//   final bool isBalance;
//   final String? assetImage;
//   final IconData? icon;
//   final String line1;
//   final String? line2;
//
//   final double cardWidth;
//   final double cardHeight;
//
//   const PaymentMethodCard({
//     super.key,
//     required this.line1,
//     this.line2,
//     this.assetImage,
//     this.icon,
//     this.isSelected = false,
//     this.isAddNew = false,
//     this.isBalance = false,
//     this.cardWidth = 172,
//     this.cardHeight = 110,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final Color effectiveBg =
//     isSelected ? AppColor.secondaryColor : AppColor.greysCardColor;
//
//     return Container(
//       width: cardWidth.w,
//       height: cardHeight.h,
//       decoration: BoxDecoration(
//         color: effectiveBg,
//         borderRadius: BorderRadius.circular(6.r),
//         border: Border.all(
//           color: AppColor.contanearGreyColor,
//           width: 1,
//         ),
//       ),
//       padding: EdgeInsets.all(12.w),
//       child: _buildContentFixedHeight(),
//     );
//   }
//
//   Widget _buildContentFixedHeight() {
//     if (isAddNew) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 28.w,
//             height: 28.w,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: AppColor.primaryColor,
//                 width: 2,
//               ),
//            //   color: AppColor.whiteColor,
//             ),
//             alignment: Alignment.center,
//             child: Icon(
//               Icons.add,
//               size: 19.w,
//               color: AppColor.primaryColor,
//             ),
//           ),
//           SizedBox(height: 12.h),
//           AppText(
//             text: 'بطاقة جديدة',
//             appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
//               color: AppColor.blackColor,
//               decoration: TextDecoration.none,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       );
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           width: 70.w,
//           height: 49.h,
//           decoration: BoxDecoration(
//             color: AppColor.whiteColor,
//             borderRadius: BorderRadius.circular(4.r),
//           ),
//           alignment: Alignment.center,
//           child: _buildLogoBoxContent(),
//         ),
//
//
//         const Spacer(),
//
//         AppText(
//           text: line1,
//           appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
//             color: AppColor.blackColor,
//             decoration: TextDecoration.none,
//           ),
//           textAlign: TextAlign.center,
//         ),
//
//         if (line2 != null && line2!.isNotEmpty) ...[
//           SizedBox(height: 4.h),
//           AppText(
//             text: line2!,
//             appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
//               color: AppColor.blackNumberSmallColor,
//               decoration: TextDecoration.none,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ],
//     );
//   }
//
//   Widget _buildLogoBoxContent() {
//     if (assetImage != null) {
//       return Image.asset(
//         assetImage!,
//         width: 70.w,
//         height: 48.h,
//         fit: BoxFit.cover,
//       );
//     }
//
//     if (isBalance && icon != null) {
//       return Icon(
//         icon,
//         size: 24.w,
//         color: AppColor.primaryColor,
//       );
//     }
//
//     return Icon(
//       icon ?? Icons.payment,
//       size: 24.w,
//       color: AppColor.primaryColor,
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class PaymentMethodCard extends StatelessWidget {
  final bool isSelected;
  final bool isAddNew;
  final bool isBalance;
  final String? assetImage;
  final IconData? icon;
  final String line1;
  final String? line2;

  final double cardWidth;
  final double cardHeight;

  const PaymentMethodCard({
    super.key,
    required this.line1,
    this.line2,
    this.assetImage,
    this.icon,
    this.isSelected = false,
    this.isAddNew = false,
    this.isBalance = false,
    this.cardWidth = 172,
    this.cardHeight = 110,
  });

  // --------- Helpers لتمييز الفيزا ---------
  bool get _isVisaLogo {
    final p = (assetImage ?? '').toLowerCase();
    return p.contains('visa');
  }

  bool get _needsLogoBorder =>
      assetImage != null && assetImage!.isNotEmpty && _isVisaLogo;

  @override
  Widget build(BuildContext context) {
    final Color effectiveBg =
        isSelected ? AppColor.secondaryColor : AppColor.greysCardColor;

    return Container(
      width: cardWidth.w,
      height: cardHeight.h,
      decoration: BoxDecoration(
        color: effectiveBg,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: isSelected
              ? AppColor.secondaryColor
              : AppColor.contanearGreyColor,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(12.w),
      child: _buildContentFixedHeight(),
    );
  }

  Widget _buildContentFixedHeight() {
    if (isAddNew) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.primaryColor,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              size: 19.w,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(height: 12.h),
          AppText(
            text: 'بطاقة جديدة',
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.blackColor,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70.w,
          height: 49.h,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(4.r),
            border: _needsLogoBorder
                ? Border.all(
                    color: AppColor.contanearGreyColor,
                    width: 1,
                  )
                : null,
          ),
          padding: _needsLogoBorder ? EdgeInsets.all(4.w) : EdgeInsets.zero,
          alignment: Alignment.center,
          child: _buildLogoBoxContent(),
        ),
        const Spacer(),
        AppText(
          text: line1,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            color: AppColor.blackColor,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        ),
        if (line2 != null && line2!.isNotEmpty) ...[
          SizedBox(height: 4.h),
          AppText(
            text: line2!,
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.blackNumberSmallColor,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Widget _buildLogoBoxContent() {
    if (assetImage != null && assetImage!.isNotEmpty) {
      final isSvg = assetImage!.toLowerCase().endsWith('.svg');
      if (isSvg) {
        return SvgPicture.asset(
          assetImage!,
          width: 70.w,
          height: 48.h,
          fit: BoxFit.contain,
        );
      } else {
        return Image.asset(
          assetImage!,
          width: 70.w,
          height: 48.h,
          fit: BoxFit.cover,
        );
      }
    }

    if (isBalance && icon != null) {
      return Icon(
        icon,
        size: 24.w,
        color: AppColor.primaryColor,
      );
    }

    return Icon(
      icon ?? Icons.payment,
      size: 24.w,
      color: AppColor.primaryColor,
    );
  }
}

// class PaymentMethodCard extends StatelessWidget {
//   final bool isSelected;
//   final bool isAddNew;
//   final bool isBalance;
//   final String? assetImage;
//   final IconData? icon;
//   final String line1;
//   final String? line2;
//
//   final double cardWidth;
//   final double cardHeight;
//
//   const PaymentMethodCard({
//     super.key,
//     required this.line1,
//     this.line2,
//     this.assetImage,
//     this.icon,
//     this.isSelected = false,
//     this.isAddNew = false,
//     this.isBalance = false,
//     this.cardWidth = 172,
//     this.cardHeight = 110,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final Color effectiveBg =
//     isSelected ? AppColor.secondaryColor : AppColor.greysCardColor;
//
//     return Container(
//       width: cardWidth.w,
//       height: cardHeight.h,
//       decoration: BoxDecoration(
//         color: effectiveBg,
//         borderRadius: BorderRadius.circular(6.r),
//         border: Border.all(
//           color: isSelected
//               ? AppColor.secondaryColor
//               : AppColor.contanearGreyColor,
//           width: 1,
//         ),
//       ),
//       padding: EdgeInsets.all(12.w),
//       child: _buildContentFixedHeight(),
//     );
//   }
//
//   Widget _buildContentFixedHeight() {
//     if (isAddNew) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 28.w,
//             height: 28.w,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: AppColor.primaryColor,
//                 width: 2,
//               ),
//             ),
//             alignment: Alignment.center,
//             child: Icon(
//               Icons.add,
//               size: 19.w,
//               color: AppColor.primaryColor,
//             ),
//           ),
//           SizedBox(height: 12.h),
//           AppText(
//             text: 'بطاقة جديدة',
//             appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
//               color: AppColor.blackColor,
//               decoration: TextDecoration.none,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       );
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           width: 70.w,
//           height: 49.h,
//           decoration: BoxDecoration(
//             color: AppColor.whiteColor,
//             borderRadius: BorderRadius.circular(4.r),
//           ),
//           alignment: Alignment.center,
//           child: _buildLogoBoxContent(),
//         ),
//         const Spacer(),
//         AppText(
//           text: line1,
//           appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
//             color: AppColor.blackColor,
//             decoration: TextDecoration.none,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         if (line2 != null && line2!.isNotEmpty) ...[
//           SizedBox(height: 4.h),
//           AppText(
//             text: line2!,
//             appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
//               color: AppColor.blackNumberSmallColor,
//               decoration: TextDecoration.none,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ],
//     );
//   }
//
//   // Widget _buildLogoBoxContent() {
//   //   if (assetImage != null) {
//   //     return Image.asset(
//   //       assetImage!,
//   //       width: 70.w,
//   //       height: 48.h,
//   //       fit: BoxFit.cover,
//   //     );
//   //   }
//   //
//   //   if (isBalance && icon != null) {
//   //     return Icon(
//   //       icon,
//   //       size: 24.w,
//   //       color: AppColor.primaryColor,
//   //     );
//   //   }
//   //
//   //   return Icon(
//   //     icon ?? Icons.payment,
//   //     size: 24.w,
//   //     color: AppColor.primaryColor,
//   //   );
//   // }
//
//   Widget _buildLogoBoxContent() {
//     if (assetImage != null && assetImage!.isNotEmpty) {
//       final isSvg = assetImage!.toLowerCase().endsWith('.svg');
//       if (isSvg) {
//         return SvgPicture.asset(
//           assetImage!,
//           width: 70.w,
//           height: 48.h,
//           fit: BoxFit.contain,
//         );
//       } else {
//         return Image.asset(
//           assetImage!,
//           width: 70.w,
//           height: 48.h,
//           fit: BoxFit.contain,
//         );
//       }
//     }
//
//     if (isBalance && icon != null) {
//       return Icon(
//         icon,
//         size: 24.w,
//         color: AppColor.primaryColor,
//       );
//     }
//
//     return Icon(
//       icon ?? Icons.payment,
//       size: 24.w,
//       color: AppColor.primaryColor,
//     );
//   }
//
// }
