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
    required this.cancelText,
    required this.onConfirm,
    this.onCancel,
    this.confirmButtonColor = const Color(0xFFD92D20),
    this.showWarningIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;
    return Dialog(
      backgroundColor: AppColor.whiteColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: <Widget>[
          /// ------------------------ MAIN DIALOG CONTENT
          Padding(
            padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(context),
                SizedBox(height: 10.h),

                /// Divider under the header
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                  height: 1,
                ),

                SizedBox(height: 10.h),

                _buildMessageWithIcon(context),

                SizedBox(height: 24.h),
                _buildButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- HEADER
  Widget _buildHeader(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Row(
        children: [
          /// Title aligned left in EN, right in AR
          Expanded(
            child: Align(
              alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
              child: AppText(
                text: title,
                appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          /// Close button aligned opposite side
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, size: 22.w),
          ),
        ],
      ),
    );
  }

  /// ---------------- BUTTONS
  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              text: confirmText,
              bg: confirmButtonColor,
              textColor: Colors.white,
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
              bg: Colors.white,
              textColor: AppColor.primaryColor,
              borderColor: AppColor.primaryColor,
              onTap: () {
                Navigator.pop(context);
                onCancel?.call();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color bg,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8.r),
          border: borderColor != null
              ? Border.all(color: borderColor, width: 1.4)
              : null,
        ),
        child: AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildWarningIcon() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AppImages.endBookingIcon, // make sure this is the correct icon
        width: 50.w,
        height: 50.w,
      ),
    );
  }

  Widget _buildMessageWithIcon(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;
    final s = S.of(context);

    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Icon Position (Left in EN, Right in AR)
          if (!isRTL) _buildWarningIcon(),

          if (!isRTL) SizedBox(width: 12.w),

          /// TEXT COLUMN
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                /// MAIN TITLE
                AppText(
                  text: s.dialog_end_message,
                  textAlign: isRTL ? TextAlign.right : TextAlign.left,
                  appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 6.h),

                /// DESCRIPTION
                AppText(
                  text: s.dialog_end_description,
                  textAlign: isRTL ? TextAlign.right : TextAlign.left,
                  appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          /// Icon on RIGHT in Arabic
          if (isRTL) SizedBox(width: 12.w),

          if (isRTL) _buildWarningIcon(),
        ],
      ),
    );
  }

  /// ---------------- Factory
  static Future<void> showConfirmationEndBooking({
    required BuildContext context,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
  }) {
    final s = S.of(context);
    return showDialog(
      context: context,
      builder: (context) => BookingConfirmationDialog(
        title: s.dialog_end_title,
        message: s.dialog_end_message,
        confirmText: s.dialog_end_confirm,
        cancelText: s.dialog_end_cancel,
        confirmButtonColor: const Color(0xFFD92D20),
        showWarningIcon: true,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }
}
