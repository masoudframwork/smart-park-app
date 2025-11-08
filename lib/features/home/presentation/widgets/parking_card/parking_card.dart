import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/widgets/custom_button.dart';
import '../../../domain/models/parking_area_model.dart';
import 'parking_card_image.dart';
import 'parking_card_stats.dart';
import 'parking_info_card.dart';

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
      //margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowCardColor.withOpacity(0.40),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: AppColor.shadowCardColor.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(6, 4),
          ),
          BoxShadow(
            color: AppColor.shadowCardColor.withOpacity(0.20),
            blurRadius: 14,
            offset: const Offset(-6, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.all(12.w),
          color: AppColor.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ParkingCardImage(parkingArea: parkingArea),
              SizedBox(height: 5.h),
              ParkingCardInfo(parkingArea: parkingArea),
              SizedBox(height: 5.h),
              ParkingCardStats(parkingArea: parkingArea),
              SizedBox(height: 16.h),
              _buildBookingButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingButton() {
    return CustomButtonWidget(
      width: 288,
      height: 40,
      text: 'ابدأ الحجز',
      onPressed: onStartBooking ?? () {},
      type: ButtonType.elevated,
      backgroundColor: AppColor.primaryColor,
      verticalPadding: 12,
      borderRadius: 4.r,
    );
  }
}
