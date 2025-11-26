import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_image_widget.dart';

class BookingWidgets {
  BookingWidgets._();

  static Widget buildInfoRow({
    String? icon,
    required String text,
    double iconSize = 18,
    Color? iconColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 8.w),
        AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  static Widget buildTimeRow(
    BuildContext context, {
    required String startTime,
    required String endTime,
    double fontSize = 14,
    double iconSize = 12,
  }) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;
    return Row(
      children: [
        SizedBox(width: 8.w),
        AppText(
          text: startTime,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(width: 20),
        CustomImageWidget(
          imageUrl: isRTL
              ? AppImages.arrowIcon // Arabic → arrow points left
              : AppImages.arrowIcon2,
          width: iconSize.w,
          height: iconSize.w,
          color: AppColor.textColor,
          isFlag: true,
        ),
        SizedBox(width: 20),
        AppText(
          text: endTime,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  static Widget buildPaymentRow({
    required String? paymentStatus,
    required double? price,
  }) {
    final String statusText = paymentStatus ?? '';
    final String priceText = price != null ? price.toStringAsFixed(0) : '';

    return Row(
      children: [
        AppText(
          text: statusText,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(width: 4.w),
        AppText(
          text: priceText,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 4.w),
        CustomImageWidget(
          imageUrl: AppImages.realSu,
          width: 15.w,
          height: 15.h,
          isFlag: true,
        ),
      ],
    );
  }

  /// Action button with customizable style
  static Widget buildActionButton({
    required String text,
    required VoidCallback onTap,
    required Color backgroundColor,
    double height = 44,
    double fontSize = 14,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: fontSize.sp,
          ),
        ),
      ),
    );
  }

  /// Build out lined Button
  static Widget buildOutlinedButton({
    required String text,
    required VoidCallback onTap,
    Color borderColor = const Color(0xFF6CBF4E),
    double height = 44,
    double fontSize = 14,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white, // WHITE BACKGROUND
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: borderColor, // GREEN BORDER
            width: 1.5,
          ),
        ),
        child: AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            color: borderColor, // GREEN TEXT
            fontWeight: FontWeight.w600,
            fontSize: fontSize.sp,
          ),
        ),
      ),
    );
  }

  /// Card container with shadow

  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: AppColor.whiteColor,
      borderRadius: BorderRadius.circular(10.r),
      boxShadow: [
        BoxShadow(
          color: AppColor.shadowDragColor,
          blurRadius: 24,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  /// Section divider
  static Widget buildDivider() {
    return Divider(
      thickness: 2.h,
      color: AppColor.greyContainerColor,
      height: 2.h,
    );
  }
}
