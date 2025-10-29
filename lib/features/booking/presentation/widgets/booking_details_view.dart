import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this import
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/models/booking_model.dart';
import '../controller/reservation_controller.dart';

class BookingDetailView extends ConsumerWidget {
  final BookingModel reservation;

  const BookingDetailView({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          _buildTimeHeader(),
          SizedBox(height: 40.h),
          _buildTimer(),
          SizedBox(height: 40.h),
          _buildInfoCards(),
          const Spacer(),
          _buildCancelButton(ref),
        ],
      ),
    );
  }

  Widget _buildTimeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTimeBlock(reservation.endTime, 'م'),
        SizedBox(width: 16.w),
        Icon(Icons.arrow_back, color: AppColor.primaryColor),
        SizedBox(width: 16.w),
        _buildTimeBlock(reservation.startTime, 'ص'),
      ],
    );
  }

  Widget _buildTimeBlock(String time, String period) {
    return Column(
      children: [
        AppText(text: time, appTextTheme: AppTextTheme.bodyLargeTextStyle()),
        AppText(text: period, appTextTheme: AppTextTheme.bodySmallTextStyle()),
      ],
    );
  }

 Widget _buildTimer() {
  return SizedBox(
    width: 280.w,
    height: 280.w,
    child: Stack(
      children: [
        // SVG Background Circle
        SvgPicture.asset(
          'assets/images/Group 1009.svg', 
          width: 280.w,
          height: 280.w,
          colorFilter: ColorFilter.mode(
            AppColor.greyContainerColor, // Base color
            BlendMode.srcIn,
          ),
        ),
        // Progress Circle - positioned to align with SVG stroke
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(8.w), // Adjust this to align with SVG stroke
            child: CircularProgressIndicator(
              value: 0.5,
              strokeWidth: 18.5.w, // Match your SVG stroke width
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(AppColor.yellowContainerColor),
              strokeCap: StrokeCap.round, // Add rounded ends
            ),
          ),
        ),
        // Duration Text in Center
        Center(
          child: AppText(
            text: reservation.duration,
            appTextTheme: AppTextTheme.numberLargeTextStyle().copyWith(fontSize: 48.sp),
          ),
        ),
      ],
    ),
  );
}

  Widget _buildInfoCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildInfoCard(Icons.credit_card, 'البطاقة المنتهية', 'ب 000'),
        _buildInfoCard(Icons.directions_car, 'رسائل بالتفاصيل', 'أ س و / 2023'),
        _buildInfoCard(Icons.location_on, 'المنطقة 013'),
      ],
    );
  }

  Widget _buildInfoCard(IconData icon, String label, [String? subtitle]) {
    return Column(
      children: [
        Icon(icon, color: AppColor.primaryColor, size: 32.sp),
        SizedBox(height: 8.h),
        AppText(text: label, appTextTheme: AppTextTheme.bodySmallTextStyle()),
        if (subtitle != null)
          AppText(text: subtitle, appTextTheme: AppTextTheme.numberSmallTextStyle()),
      ],
    );
  }

  Widget _buildCancelButton(WidgetRef ref) {
    return CustomButtonWidget(
      text: 'إلغاء الحجز',
      onPressed: () {
        ref.read(reservationController.notifier).cancelReservation(reservation.id);
      },
      backgroundColor: AppColor.secondaryContainerColor,
      verticalPadding: 18,
      borderRadius: 12,
    );
  }
}