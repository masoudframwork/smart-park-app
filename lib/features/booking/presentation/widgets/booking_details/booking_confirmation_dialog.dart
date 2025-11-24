import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/l10n.dart';

class BookingConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final Color confirmButtonColor;
  final bool showWarningIcon;

  const BookingConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    this.cancelText = 'عودة',
    required this.onConfirm,
    this.onCancel,
    this.confirmButtonColor = const Color(0xFFD92D20),
    this.showWarningIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // No rounded corners
      ),
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          // Main dialog content
          Container(
            margin: EdgeInsets.only(right: 4.w), // Space for orange line
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(context),
                SizedBox(height: 16.h),
                _buildMessage(),
                SizedBox(height: 24.h),
                _buildActions(context),
              ],
            ),
          ),
          // Orange vertical line on the right
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 8.w,
              decoration: BoxDecoration(
                color: AppColor.darkOrange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Row(
      children: [
        // Warning ICON
        SvgPicture.asset(
          AppImages.warningSign,
          width: 32.w,
          height: 32.w,
        ),

        SizedBox(width: 12.w),

        // TITLE (Centered automatically)
        Expanded(
          child: AppText(
            text: title,
            textAlign: TextAlign.center,
            appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColor.blackColor,
            ),
          ),
        ),

        SizedBox(width: 12.w),

        // CLOSE BUTTON
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.greyContainerColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(6.w),
            child: Icon(
              Icons.close,
              size: 18.w,
              color: AppColor.blackColor,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildMessage() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w,right: 40.w),
      child: AppText(
        text: message,
        textAlign: TextAlign.start,
        appTextTheme: AppTextTheme.bodySmallTextStyle(),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildButton(
            text: confirmText,
            backgroundColor: confirmButtonColor,
            textColor: AppColor.whiteColor,
            onTap: () {
              Navigator.pop(context);
              onConfirm();
            },
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildButton(
            text: cancelText,
            backgroundColor: AppColor.whiteColor,
            textColor: AppColor.primaryColor,
            borderColor: AppColor.primaryColor,
            onTap: () {
              Navigator.pop(context);
              onCancel?.call();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4.r),
          border: borderColor != null
              ? Border.all(color: borderColor, width: 1.5)
              : null,
        ),
        child: AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  // Factory constructors for common use cases
  static Future<void> showExtendConfirmation({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    final s = S.of(context);

    return showDialog(
      context: context,
      builder: (context) => BookingConfirmationDialog(
        title: s.dialog_end_title,       // "هل تريد إنهاء الحجز؟"
        message: s.dialog_end_message,   // explanation
        confirmText: s.dialog_end_confirm, // "إنهاء الحجز" / "End Reservation"
        cancelText: s.dialog_cancel,       // "عودة" / "Back"
        onConfirm: onConfirm,
        confirmButtonColor: AppColor.secondaryContainerColor,
        showWarningIcon: true,
      ),
    );
  }

  static Future<void> showCancelConfirmation({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    final s = S.of(context);

    return showDialog(
      context: context,
      builder: (context) => BookingConfirmationDialog(
        title: s.dialog_end_title,
        message: s.dialog_end_message,
        confirmText: s.dialog_end_confirm,
        cancelText: s.dialog_cancel,
        onConfirm: onConfirm,
        confirmButtonColor: AppColor.secondaryContainerColor,
        showWarningIcon: true,
      ),
    );
  }

  static Future<void> showExtendReservationConfirmation({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    final s = S.of(context);

    return showDialog(
      context: context,
      builder: (context) => BookingConfirmationDialog(
        title: s.dialog_extend_title,        // "هل تريد تمديد الحجز؟"
        message: s.dialog_extend_message,    // explanation
        confirmText: s.dialog_extend,        // "تمديد الحجز"
        cancelText: s.dialog_cancel,
        onConfirm: onConfirm,
        confirmButtonColor: AppColor.primaryColor,
        showWarningIcon: false,
      ),
    );
  }
}
