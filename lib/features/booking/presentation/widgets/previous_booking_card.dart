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
import 'package:smart/generated/l10n.dart';

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
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 16.h),
        decoration: BookingWidgets.cardDecoration(),
        child: Column(
          crossAxisAlignment:
              isRTL ? CrossAxisAlignment.start : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: _buildHeader(context, isRTL),
            ),
            BookingWidgets.buildDivider(),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
              child: _buildContent(context, isRTL),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isRTL) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: reservation.locationName,
          appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
            color: AppColor.textColor,
          ),
        ),

        /// تاريخ الحجز ثابت في التصميم — يفضل استبداله لاحقاً بالقيمة الصحيحة
        AppText(
          text: isRTL ? 'السبت 30/10/2023' : 'Sat 30/10/2023',
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isRTL) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookingWidgets.buildInfoRow(
          icon: AppImages.location3,
          text: reservation.address,
        ),
        SizedBox(height: 8.h),
        BookingWidgets.buildTimeRow(
          context,
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
        _buildActionButtons(context, isRTL),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isRTL) {
    return Row(
      children: [
        /// "احجز مرة أخرى" / "Book Again"
        Expanded(
          child: BookingWidgets.buildActionButton(
            text: S.of(context).booking_again,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BookingStep1Page()),
              );
            },
            backgroundColor: AppColor.primaryColor,
          ),
        ),

        SizedBox(width: 12.w),

        /// "ملخص الحجز" / "Booking Summary"
        Expanded(
          child: BookingWidgets.buildOutlinedButton(
            text: S.of(context).booking_summary,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BookingSummaryScreen()),
              );
            },
          ),
        ),
      ],
    );
  }
}
