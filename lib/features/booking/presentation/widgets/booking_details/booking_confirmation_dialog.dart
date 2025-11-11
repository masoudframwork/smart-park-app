import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

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
                color: AppColor.yellowContainerColor,
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
    return Row(
      children: [
        if (showWarningIcon) ...[
          SizedBox(width: 8.w),
          Icon(
            Icons.warning_amber_rounded,
            color: AppColor.yellowContainerColor,
            size: 20.w,
          ),
        ],
        SizedBox(width: 16.w),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              AppText(
                text: title,
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: AppColor.blackColor,
                ),
              ),
              // Warning icon on the right of title
              Spacer(),

              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  child: Icon(
                    Icons.close,
                    size: 20.w,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 28.w), // Balance the close button
      ],
    );
  }

  Widget _buildMessage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: AppText(
        text: message,
        appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
          fontSize: 13.sp,
          color: AppColor.greyTextColor,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
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
    return showDialog(
      context: context,
      builder: (context) => BookingConfirmationDialog(
        title: 'هل تريد إنهاء الحجز؟',
        message:
            'بالضغط على إلغاء الحجز سوف تقوم بإلغاء حجز المركبة وإعادة المبلغ المدفوع',
        confirmText: 'إنهاء الحجز',
        cancelText: 'عودة',
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
    return showDialog(
      context: context,
      builder: (context) => BookingConfirmationDialog(
        title: 'هل تريد إنهاء الحجز؟',
        message:
            'بالضغط على إلغاء الحجز سوف تقوم بإلغاء حجز المركبة وإعادة المبلغ المدفوع',
        confirmText: 'إنهاء الحجز',
        cancelText: 'عودة',
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
    return showDialog(
      context: context,
      builder: (context) => BookingConfirmationDialog(
        title: 'هل تريد تمديد الحجز؟',
        message:
            'بالضغط على تمديد الحجز سوف يتم تمديد حجز المركبة للمدة المختارة',
        confirmText: 'تمديد الحجز',
        cancelText: 'عودة',
        onConfirm: onConfirm,
        confirmButtonColor: AppColor.primaryColor,
        showWarningIcon: false,
      ),
    );
  }
}
