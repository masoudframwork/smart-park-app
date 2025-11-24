import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_image_widget.dart';

class BookingDetailHeader extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String date;

  const BookingDetailHeader({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTimeHeader(context),
        SizedBox(height: 12.h),
        _buildDateHeader(),
      ],
    );
  }

  Widget _buildTimeHeader(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: startTime,
          appTextTheme: AppTextTheme.bodyLargeTextStyle().copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(width: 16.w),
        CustomImageWidget(
          imageUrl: isRTL
              ? AppImages.arrowIcon      // Arabic → arrow points left
              : AppImages.arrowIcon2,    // English → arrow points right
          width: 16.w,
          height: 16.w,
          color: AppColor.primaryColor,
          isFlag: true,
        ),
        SizedBox(width: 16.w),
        AppText(
          text: endTime,
          appTextTheme: AppTextTheme.bodyLargeTextStyle().copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildDateHeader() {
    return AppText(
      text: date,
      appTextTheme: AppTextTheme.bodySmallTextStyle(),
    );
  }
}