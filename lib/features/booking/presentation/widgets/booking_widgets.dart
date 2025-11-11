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
    required String icon,
    required String text,
    double iconSize = 18,
    Color? iconColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomImageWidget(
          imageUrl: icon,
          width: iconSize.w,
          height: iconSize.w,
          color: iconColor ?? AppColor.primaryColor,
          isFlag: true,
        ),
        SizedBox(width: 8.w),
        AppText(
          text: text,
          appTextTheme: AppTextTheme.bodyMediumTextStyle(),
        ),
      ],
    );
  }

  static Widget buildTimeRow({
    required String startTime,
    required String endTime,
    double fontSize = 14,
    double iconSize = 12,
  }) {
    return Row(
      children: [
        CustomImageWidget(
          imageUrl: AppImages.timeStop,
          width: 18.w,
          height: 18.w,
          color: AppColor.primaryColor,
          isFlag: true,
        ),
        SizedBox(width: 8.w),
        AppText(
          text: startTime,
          appTextTheme: AppTextTheme.font18SimiBoldBlack()
              .copyWith(fontSize: fontSize),
        ),
        SizedBox(width: 12.w),
        CustomImageWidget(
          imageUrl: AppImages.arrowIcon,
          width: iconSize.w,
          height: iconSize.w,
          color: AppColor.primaryColor,
          isFlag: true,
        ),
        SizedBox(width: 12.w),
        AppText(
          text: endTime,
          appTextTheme: AppTextTheme.font18SimiBoldBlack()
              .copyWith(fontSize: fontSize),
        ),
      ],
    );
  }

  static Widget buildPaymentRow({
    required String? paymentStatus,
    required double? price,
  }) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColor.greyContainerColor),
          ),
          child: Image.asset(
            AppImages.visaImage,
            width: 22.w,
            height: 20.h,
          ),
        ),
        SizedBox(width: 8.w),
        AppText(
          text: paymentStatus ?? '',
          appTextTheme: AppTextTheme.bodyMediumTextStyle(),
        ),
        SizedBox(width: 4.w),
        AppText(
          text: '${price?.toStringAsFixed(0)}',
          appTextTheme: AppTextTheme.font18SimiBoldBlack(),
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
          borderRadius: BorderRadius.circular(4.r),
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

  /// Card container with shadow
  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: AppColor.whiteColor,
      borderRadius: BorderRadius.circular(4.r),
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