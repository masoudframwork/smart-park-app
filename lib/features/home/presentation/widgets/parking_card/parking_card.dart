import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/theme/app_color.dart';
import 'package:smart_park_app/core/widgets/custom_button.dart';
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
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
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
          ParkingCardImage(parkingArea: parkingArea),
          SizedBox(height: 16.h),
          ParkingCardInfo(parkingArea: parkingArea),
          SizedBox(height: 16.h),
          ParkingCardStats(parkingArea: parkingArea),
          SizedBox(height: 16.h),
          _buildBookingButton(),
        ],
      ),
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
