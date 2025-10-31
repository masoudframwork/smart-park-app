import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/theme/app_color.dart';
import 'package:smart_park_app/core/theme/app_text_theme.dart';
import 'package:smart_park_app/core/widgets/app_text.dart';

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
      width: 280.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(16.w),
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
    if (parkingArea.isFull) {
      return Border.all(color: AppColor.secondaryContainerColor.withOpacity(0.3), width: 1);
    } else if (parkingArea.isAlmostFull) {
      return Border.all(color: AppColor.secondaryContainerColor.withOpacity(0.3), width: 1);
    }
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
                errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
              )
            else
              _buildPlaceholder(),
            
            // Availability Badge
            Positioned(
              top: 8.h,
              right: 8.w,
              child: _buildAvailabilityBadge(),
            ),
            
            // Price Badge
            Positioned(
              bottom: 8.h,
              left: 8.w,
              child: _buildPriceBadge(),
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
    
    if (parkingArea.isFull) {
      bgColor = AppColor.secondaryContainerColor;
      textColor = AppColor.whiteColor;
      text = 'ممتلئ';
    } else if (parkingArea.isAlmostFull) {
      bgColor = AppColor.secondaryContainerColor;
      textColor = AppColor.whiteColor;
      text = 'شبه ممتلئ';
    } else {
      bgColor = AppColor.primaryColor;
      textColor = AppColor.whiteColor;
      text = 'متاح';
    }
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: '${parkingArea.pricePerHour.toStringAsFixed(0)} ر.س',
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.whiteColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppText(
            text: '/ساعة',
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.whiteColor.withOpacity(0.8),
              fontSize: 9.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAreaInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: parkingArea.name,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            color: AppColor.greyTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8.w),
        AppText(
          text: parkingArea.code,
          appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: AppText(
            text: parkingArea.location,
            appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
              color: AppColor.greyTextColor,
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.center,
         
          ),
        ),
        SizedBox(width: 4.w),
        Icon(
          Icons.location_on_outlined,
          size: 14.w,
          color: AppColor.greyTextColor,
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatChip(
          icon: Icons.local_parking,
          value: parkingArea.formattedAvailability,
          bgColor: _getAvailabilityColor().withOpacity(0.1),
          textColor: _getAvailabilityColor(),
          isHighlighted: true,
        ),
        SizedBox(width: 12.w),
        _buildStatChip(
          icon: Icons.directions_car_outlined,
          value: '${parkingArea.waitTimeText} دقائق',
          bgColor: AppColor.greyContainerColor.withOpacity(0.5),
          textColor: AppColor.greyTextColor,
          isHighlighted: false,
        ),
      ],
    );
  }

  Color _getAvailabilityColor() {
    if (parkingArea.isFull) return AppColor.secondaryContainerColor;
    if (parkingArea.isAlmostFull) return AppColor.secondaryContainerColor;
    return AppColor.primaryColor;
  }

  Widget _buildStatChip({
    required IconData icon,
    required String value,
    required Color bgColor,
    required Color textColor,
    required bool isHighlighted,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isHighlighted) ...[
            AppText(
              text: value,
              appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(width: 6.w),
          ],
          Icon(
            icon,
            size: 16.w,
            color: textColor,
          ),
          if (!isHighlighted) ...[
            SizedBox(width: 6.w),
            AppText(
              text: value,
              appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                color: textColor,
                fontSize: 11.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBookingButton() {
    final isDisabled = parkingArea.isFull || !parkingArea.isActive;
    
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onStartBooking,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled 
              ? AppColor.greyContainerColor 
              : AppColor.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        child: AppText(
          text: isDisabled 
              ? (parkingArea.isFull ? 'ممتلئ' : 'غير متاح')
              : 'ابدأ الحجز',
          appTextTheme: AppTextTheme.mainButtonTextStyle().copyWith(
            color: isDisabled 
                ? AppColor.greyTextColor 
                : AppColor.whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}