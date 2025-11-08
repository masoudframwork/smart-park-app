import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';
import 'package:smart/features/home/domain/models/parking_area_model.dart'
    show ParkingArea;

class ParkingCardInfo extends StatelessWidget {
  final ParkingArea parkingArea;

  const ParkingCardInfo({
    super.key,
    required this.parkingArea,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAreaInfo(),
        SizedBox(height: 8.h),
        _buildLocationInfo(),
      ],
    );
  }

  Widget _buildAreaInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          text: parkingArea.name,
          appTextTheme: AppTextTheme.titleLargeTextStyle(),
        ),
        SizedBox(width: 8.w),
        AppText(
          text: parkingArea.code,
          appTextTheme: AppTextTheme.titleLargeTextStyle(),
        ),
        const Spacer(),
        _buildPriceBadge(),
      ],
    );
  }

  Widget _buildPriceBadge() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: parkingArea.pricePerHour.toStringAsFixed(0),
          appTextTheme: AppTextTheme.bodyLargeTextStyle()
              .copyWith(color: AppColor.blackNumberSmallColor),
        ),
        SizedBox(width: 6.w),
        SvgImageWidget(
          AppImages.realSu,
          width: 11.5.w,
          height: 12.5.w,
        ),
        AppText(
          text: '/ساعة',
          appTextTheme: AppTextTheme.bodySmallTextStyle()
              .copyWith(color: AppColor.blackNumberSmallColor),
        ),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return AppText(
      text: parkingArea.location,
      appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
        color: AppColor.blackNumberSmallColor,
      ),
      textAlign: TextAlign.start,
    );
  }
}
