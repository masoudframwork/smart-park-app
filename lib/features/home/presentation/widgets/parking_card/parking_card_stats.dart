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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      children: [
        if (isHighlighted) ...[
          SvgImageWidget(
            iconPath,
          ),
          SizedBox(width: 5.w),
          AppText(
            text: value,
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.blackNumberSmallColor,
            ),
          ),
        ],
        Row(
          children: [
            if (!isHighlighted) ...[
              SvgImageWidget(
                iconPath,
              ),
              SizedBox(
                width: 10,
              ),
              SvgImageWidget(
                iconPath2 ?? AppImages.shower,
              ),
            ],
          ],
        )
      ],
    );
  }
}
