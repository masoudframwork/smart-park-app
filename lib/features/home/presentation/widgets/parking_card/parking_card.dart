// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/constants/image_string.dart';
import 'package:smart_park_app/core/theme/app_color.dart';
import 'package:smart_park_app/core/theme/app_text_theme.dart';
import 'package:smart_park_app/core/widgets/app_text.dart';
import 'package:smart_park_app/core/widgets/svg_image_widget.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/models/parking_area_model.dart';

class ParkingCard extends StatelessWidget {
  final ParkingArea parkingArea;
  final VoidCallback? onStartBooking;

  const ParkingCard({
    super.key,
    required this.parkingArea,
    this.onStartBooking,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: _getBorderDecoration(),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(),
          SizedBox(height: 16.h),
          _buildAreaInfo(),
          SizedBox(height: 8.h),
          _buildLocationInfo(),
          SizedBox(height: 16.h),
          _buildStatsRow(),
          SizedBox(height: 16.h),
          _buildBookingButton(),
        ],
      ),
    );
  }

  Border? _getBorderDecoration() {
   
    return null;
  }

  Widget _buildImageSection() {
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

            // Availability Badge
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
    Color bgColor;
    Color textColor;
    String text;

   
      bgColor = AppColor.secondaryButtonColor;
      textColor = AppColor.primaryButtonColor;
      text = 'متاح الأن';
    

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: AppText(
        text: text,
        appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
          color: textColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
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
        SizedBox(width: 6.w,),
            SvgImageWidget(
            AppImages.realSu,
            width: 11.5.w,
            height: 12.5.w,
          ),
        AppText(
          text: '/ساعة',
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(color: AppColor.blackNumberSmallColor),
        ),
      ],
    );
  }

  Widget _buildAreaInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
            text: parkingArea.name,
            appTextTheme: AppTextTheme.titleLargeTextStyle()),
        SizedBox(width: 8.w),
        AppText(
            text: parkingArea.code,
            appTextTheme: AppTextTheme.titleLargeTextStyle()),
                    SizedBox(width: 8.w),

        Spacer(),
        
        _buildPriceBadge(),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return AppText(
      text: parkingArea.location,
      appTextTheme: AppTextTheme.bodySmallTextStyle(),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildStatChip(
          iconPath: AppImages.twoCars,
          value: parkingArea.formattedAvailability,
          bgColor: _getAvailabilityColor().withOpacity(0.1),
          textColor: _getAvailabilityColor(),
          isHighlighted: true,
        ),
        SizedBox(width: 12.w),
        _buildStatChip(
          iconPath: AppImages.charging, // Replace with your actual SVG path
          value: '${parkingArea.waitTimeText} دقائق',
          bgColor: AppColor.greyContainerColor.withOpacity(0.5),
          textColor: AppColor.greyTextColor,
          isHighlighted: false,
        ),
      ],
    );
  }

  Color _getAvailabilityColor() {
    
    return AppColor.primaryColor;
  }

  Widget _buildStatChip({
    required String iconPath,
    String? iconPath2,
    required String value,
    required Color bgColor,
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
        ],
        if (isHighlighted) ...[
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
        ],
        if (!isHighlighted) ...[
          SvgImageWidget(
            iconPath2 ?? AppImages.shower,
            width: 30.w,
            height: 30.w,
          ),
        ],
      ],
    );
  }

  Widget _buildBookingButton() {
    return CustomButtonWidget(
      text: 'ابدأ الحجز',
      onPressed: onStartBooking ?? () {},
      type: ButtonType.elevated,
      backgroundColor: AppColor.primaryColor,
      verticalPadding: 12,
      borderRadius: 4,
    );
  }
}
