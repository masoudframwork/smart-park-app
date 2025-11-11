import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/booking/presentation/widgets/booking_details/booking_confirmation_dialog.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class BookingDetailActions extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onExtend;

  const BookingDetailActions({
    super.key,
    required this.onCancel,
    required this.onExtend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            text: 'إلغاء الحجز',
            backgroundColor: AppColor.secondaryContainerColor,
            onTap: () => _showCancelDialog(context),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildActionButton(
            text: 'تمديد الحجز',
            backgroundColor: AppColor.primaryColor,
            onTap: () => _showExtendDialog(context),
          ),
        ),
      ],
    );
  }

  void _showCancelDialog(BuildContext context) {
    BookingConfirmationDialog.showExtendConfirmation(
      context: context,
      onConfirm: onCancel,
    );
  }

  void _showExtendDialog(BuildContext context) {
    BookingConfirmationDialog.showExtendReservationConfirmation(
      context: context,
      onConfirm: onExtend,
    );
  }

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