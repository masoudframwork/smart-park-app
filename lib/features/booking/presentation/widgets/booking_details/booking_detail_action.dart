// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smart/features/booking/provider/widgets/booking_details/booking_confirmation_dialog.dart';
// import '../../../../../core/theme/app_color.dart';
// import '../../../../../core/theme/app_text_theme.dart';
// import '../../../../../core/widgets/app_text.dart';
// import '../../../../../generated/l10n.dart';
//
// class BookingDetailActions extends StatelessWidget {
//   final VoidCallback onCancel;
//   final VoidCallback ?onExtend;
//
//   const BookingDetailActions({
//     super.key,
//     required this.onCancel,
//      this.onExtend,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     bool isRTL = Directionality.of(context) == TextDirection.rtl;
//
//     return Row(
//       children: isRTL
//           ? _buildArabicOrder(context)
//           : _buildEnglishOrder(context),
//     );
//   }
//
//   /// ---------------------------
//   /// ARABIC ORDER  ( RTL )
//   /// ---------------------------
//   List<Widget> _buildArabicOrder(BuildContext context) {
//     return [
//       Expanded(
//         child: _buildActionButton(
//           text: S.of(context).booking_end_reservation,
//           backgroundColor: AppColor.secondaryContainerColor,
//           onTap: () => _showCancelDialog(context),
//         ),
//       ),
//       SizedBox(width: 12.w),
//       Expanded(
//         child: _buildActionButton(
//           text: S.of(context).booking_extend_reservation,
//           backgroundColor: AppColor.primaryColor,
//           onTap: () => _showExtendDialog(context),
//         ),
//       ),
//     ];
//   }
//
//   /// ---------------------------
//   /// ENGLISH ORDER  ( LTR )
//   /// ---------------------------
//   List<Widget> _buildEnglishOrder(BuildContext context) {
//     return [
//       Expanded(
//         child: _buildActionButton(
//           text: S.of(context).booking_extend_reservation,
//           backgroundColor: AppColor.primaryColor,
//           onTap: () => _showExtendDialog(context),
//         ),
//       ),
//       SizedBox(width: 12.w),
//       Expanded(
//         child: _buildActionButton(
//           text: S.of(context).booking_end_reservation,
//           backgroundColor: AppColor.secondaryContainerColor,
//           onTap: () => _showCancelDialog(context),
//         ),
//       ),
//     ];
//   }
//
//   /// SHOW CANCEL DIALOG
//   void _showCancelDialog(BuildContext context) {
//     BookingConfirmationDialog.showExtendConfirmation(
//       context: context,
//       onConfirm: onCancel,
//     );
//   }
//
//   /// SHOW EXTEND DIALOG
//   void _showExtendDialog(BuildContext context) {
//     BookingConfirmationDialog.showExtendReservationConfirmation(
//       context: context,
//       onConfirm: onExtend!,
//     );
//   }
//
//   /// BUTTON WIDGET
//   Widget _buildActionButton({
//     required String text,
//     required Color backgroundColor,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 48.h,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(4.r),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: AppText(
//           text: text,
//           appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
//             color: AppColor.whiteColor,
//             fontWeight: FontWeight.w600,
//             fontSize: 14.sp,
//           ),
//         ),
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
import 'booking_confirmation_dialog.dart';
import 'bottom_sheet/bottom_sheet_extend_booking.dart';

class BookingDetailActions extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback? onExtend;

  const BookingDetailActions({
    super.key,
    required this.onCancel,
    this.onExtend,
  });

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Row(
      children:
          isRTL ? _buildArabicOrder(context) : _buildEnglishOrder(context),
    );
  }

  /// ---------------------------
  /// ترتيب الأزرار بالعربي (RTL)
  /// ---------------------------
  List<Widget> _buildArabicOrder(BuildContext context) {
    return [
      Expanded(
        child: _buildActionButton(
          text: S.of(context).booking_end_reservation,
          backgroundColor: AppColor.secondaryContainerColor,
          onTap: () => _showCancelDialog(context),
        ),
      ),
      SizedBox(width: 12.w),
      Expanded(
        child: _buildActionButton(
          text: S.of(context).booking_extend_reservation,
          backgroundColor: AppColor.primaryColor,
          onTap: () => _showExtendBottomSheet(context),
        ),
      ),
    ];
  }

  /// ---------------------------
  /// ترتيب الأزرار بالإنجليزي (LTR)
  /// ---------------------------
  List<Widget> _buildEnglishOrder(BuildContext context) {
    return [
      Expanded(
        child: _buildActionButton(
          text: S.of(context).booking_extend_reservation,
          backgroundColor: AppColor.primaryColor,
          onTap: () => _showExtendBottomSheet(context),
        ),
      ),
      SizedBox(width: 12.w),
      Expanded(
        child: _buildActionButton(
          text: S.of(context).booking_end_reservation,
          backgroundColor: AppColor.secondaryContainerColor,
          onTap: () => _showCancelDialog(context),
        ),
      ),
    ];
  }

  /// دIALOG إلغاء الحجز (يبقى كما هو)
  void _showCancelDialog(BuildContext context) {
    BookingConfirmationDialog.showConfirmationEndBooking(
      context: context,
      onConfirm: onCancel,
    );
  }

  /// ✅ فتح BottomSheet لتمديد الحجز
  void _showExtendBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return ExtendReservationBottomSheet(
          onConfirm: onExtend,
        );
      },
    );
  }

  /// زر الأكشن العادي
  Widget _buildActionButton({
    required String text,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
