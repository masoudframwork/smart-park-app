import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../domain/models/parking_area_model.dart';

class ParkingCardImage extends StatelessWidget {
  final ParkingArea parkingArea;

  const ParkingCardImage({
    super.key,
    required this.parkingArea,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          color: AppColor.greyContainerColor.withOpacity(0.3),
        ),
        child: Stack(
          children: [
            if (parkingArea.imageUrl != null)
              Image.network(
                parkingArea.imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    _buildPlaceholder(),
              )
            else
              _buildPlaceholder(),
            Positioned(
              bottom: 8.h,
              right: 8.w,
              child: _buildAvailabilityBadge(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColor.greyContainerColor.withOpacity(0.3),
      child: Center(
        child: Icon(
          Icons.local_parking,
          color: AppColor.greyColor.withOpacity(0.5),
          size: 32.w,
        ),
      ),
    );
  }

  Widget _buildAvailabilityBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColor.secondaryButtonColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        spacing: 5.w,
        children: [
          SvgPicture.asset(
            AppImages.available,
          ),
          AppText(
            text: 'متاح الأن',
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.primaryButtonColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
