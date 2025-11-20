import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/features/booking/domain/models/booking_model.dart';
import 'package:smart/features/booking/presentation/booking_summary_screen.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';
import 'booking_widgets.dart';

class PreviousBookingCard extends StatelessWidget {
  final BookingModel reservation;
  final VoidCallback onTap;
  final VoidCallback onBookAgain;

  const PreviousBookingCard({
    super.key,
    required this.reservation,
    required this.onTap,
    required this.onBookAgain,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 22.h, bottom: 16.h),
        decoration: BookingWidgets.cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: _buildHeader(),
            ),
            BookingWidgets.buildDivider(),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
              child: _buildContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: reservation.locationName,
          appTextTheme: AppTextTheme.titleLargeTextStyle()
              .copyWith(fontWeight: FontWeight.w600),
        ),
        AppText(
          text: 'السبت 30/10/2023',
          appTextTheme: AppTextTheme.bodySmallTextStyle(),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookingWidgets.buildInfoRow(
          icon: AppImages.location3,
          text: reservation.address,
        ),
        SizedBox(height: 8.h),
        BookingWidgets.buildTimeRow(
          startTime: reservation.startTime,
          endTime: reservation.endTime,
        ),
        SizedBox(height: 8.h),
        BookingWidgets.buildInfoRow(
          icon: AppImages.car,
          text: reservation.date,
        ),
        SizedBox(height: 8.h),
        BookingWidgets.buildPaymentRow(
          paymentStatus: reservation.paymentStatus,
          price: reservation.price,
        ),
        SizedBox(height: 16.h),
        _buildActionButtons(context),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BookingWidgets.buildActionButton(
            text: 'احجز مرة أخرى',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingStep1Page(),
                ),
              );
            },
            backgroundColor: AppColor.primaryColor,
          ),
        ),
        SizedBox(width: 12.w),

        Expanded(
          child: BookingWidgets.buildOutlinedButton(
            text: 'ملخص الحجز',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingSummaryScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
