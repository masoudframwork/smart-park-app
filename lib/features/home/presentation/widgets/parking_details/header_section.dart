import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

// class HeaderSection extends StatelessWidget {
//   final String? imageUrl;
//   final bool isAvailable;
//
//   const HeaderSection({
//     super.key,
//     required this.imageUrl,
//     required this.isAvailable,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _buildData(),
//       ],
//     );
//   }
//
//   Row _buildData() {
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Container(
//           //   height: 101.h,
//           //   width: 344.w,
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(8.r),
//           //     image: DecorationImage(
//           //       image: AssetImage(AppImages.parkingDemo),
//           //       fit: BoxFit.cover,
//           //     ),
//           //   ),
//           // ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//             decoration: BoxDecoration(
//               color: AppColor.containerColor,
//               borderRadius: BorderRadius.circular(14.r),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   isAvailable ? Icons.check_circle_outline : Icons.cancel,
//                   color: AppColor.greenTextColor,
//                   size: 16.sp,
//                 ),
//                 SizedBox(width: 4.w),
//                 AppText(
//                   text: isAvailable ? 'متاح الآن' : 'غير متاح',
//                   appTextTheme: AppTextTheme.bodySmallTextStyle()
//                       .copyWith(color: AppColor.greenTextColor),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               _buildIconsButton(AppImages.shower),
//               SizedBox(width: 12.w),
//               _buildIconsButton(AppImages.charging),
//             ],
//           ),
//         ],
//
//     );
//   }
//
//   Widget _buildIconButton(IconData icon, Color color) {
//     return Container(
//       padding: EdgeInsets.all(8.w),
//       decoration: BoxDecoration(
//         color: AppColor.secondaryColor,
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Icon(icon, color: color, size: 18.sp),
//     );
//   }
//
//   Widget _buildIconsButton(
//     widgets,
//   ) {
//     return Container(
//       padding: EdgeInsets.all(2.h),
//       decoration: BoxDecoration(
//         color: AppColor.secondaryColor,
//         shape: BoxShape.circle,
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.black.withOpacity(0.1),
//         //     blurRadius: 4,
//         //     offset: const Offset(0, 2),
//         //   ),
//         // ],
//       ),
//       child: SvgPicture.asset(
//         widgets,
//       ),
//     );
//   }
// }
class HeaderSection extends StatelessWidget {
  final String? imageUrl;
  final bool isAvailable;

  const HeaderSection({
    super.key,
    required this.imageUrl,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildData(),
      ],
    );
  }

  Row _buildData() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildImageWithBadge(),
        ),
      ],
    );
  }

  Widget _buildImageWithBadge() {
    final Color statusColor =
        isAvailable ? AppColor.greenTextColor : AppColor.primaryColor;
    final String statusText = isAvailable ? 'متاح الآن' : 'غير متاح';
    final IconData statusIcon =
        isAvailable ? Icons.check_circle_outline : Icons.cancel;

    return SizedBox(
      height: 101.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: imageUrl?.isNotEmpty == true
                  ? Image.network(imageUrl!, fit: BoxFit.cover)
                  : Image.asset(AppImages.parkingDemo, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 8.h,
            right: 8.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColor.containerColor,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackColor.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(statusIcon, color: statusColor, size: 16.sp),
                  SizedBox(width: 4.w),
                  AppText(
                    text: statusText,
                    appTextTheme: AppTextTheme.bodySmallTextStyle()
                        .copyWith(color: statusColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
