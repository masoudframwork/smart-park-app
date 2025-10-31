import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';

import '../../../domain/models/parking_area_model.dart';

class ParkingCardStats extends StatelessWidget {
  final ParkingArea parkingArea;

  const ParkingCardStats({
    super.key,
    required this.parkingArea,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildStatChip(
          iconPath: AppImages.twoCars,
          value: parkingArea.formattedAvailability,
          textColor: AppColor.primaryColor,
          isHighlighted: true,
        ),
        SizedBox(width: 12.w),
        _buildStatChip(
          iconPath: AppImages.charging,
          value: '${parkingArea.waitTimeText} دقائق',
          textColor: AppColor.greyTextColor,
          isHighlighted: false,
        ),
      ],
    );
  }

  Widget _buildStatChip({
    required String iconPath,
    String? iconPath2,
    required String value,
    required Color textColor,
    required bool isHighlighted,
  }) {
    return Row(
      spacing: 10.w,
      children: [
        if (isHighlighted) ...[
          SvgImageWidget(
            iconPath,
            width: 21.5.w,
            height: 21.5.w,
          ),
          AppText(
            text: value,
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ],
        SizedBox(width: 50.w),
        if (!isHighlighted) ...[
          SvgImageWidget(
            iconPath,
            width: 30.w,
            height: 30.w,
          ),
          SvgImageWidget(
            iconPath2 ?? AppImages.shower,
            width: 30.w,
            height: 30.w,
          ),
        ],
      ],
    );
  }
}
