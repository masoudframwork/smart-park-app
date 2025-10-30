import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/constants/image_string.dart';
import 'package:smart_park_app/features/booking/domain/models/booking_model.dart';
import 'package:smart_park_app/features/booking/presentation/controller/timer_controller.dart' show timerControllerProvider, TimerController;
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../domain/models/timer_state.dart';


class BookingCard extends ConsumerWidget {
  final BookingModel reservation;
  final VoidCallback onTap;

  const BookingCard({
    super.key,
    required this.reservation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerControllerProvider(reservation.id));
    final timerController = ref.read(timerControllerProvider(reservation.id).notifier);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 24,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildTimerCircle(timerState, timerController),
            SizedBox(width: 30.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimeRow(),
                SizedBox(height: 8.h),
                _buildDateRow(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerCircle(TimerState timerState, TimerController timerController) {
    return SizedBox(
      width: 76.w,
      height: 76.w,
      child: Stack(
        children: [
          SizedBox(
            width: 76.w,
            height: 76.w,
            child: CircularProgressIndicator(
              value: timerState.progress,
              strokeWidth: 6.w,
              backgroundColor: AppColor.greyContainerColor,
              valueColor: AlwaysStoppedAnimation(AppColor.yellowContainerColor),
            ),
          ),
          Center(
            child: AppText(
              text: timerController.getFormattedTime(),
              appTextTheme: AppTextTheme.numberSmallTextStyle().copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTimeBlock(reservation.startTime),
        SizedBox(width: 8.w),
        Image.asset(
          AppImages.arrowIcon,
          color: AppColor.primaryColor,
          width: 12.w,
          height: 12.h,
        ),
        SizedBox(width: 8.w), 
        _buildTimeBlock(reservation.endTime),
      ],
    );
  }

  Widget _buildTimeBlock(String time) {
    return AppText(
        text: time,
        appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
          fontWeight: FontWeight.w600,
        ));
  }

  Widget _buildDateRow() {
    return AppText(
        text: reservation.date,
        appTextTheme:
            AppTextTheme.titleMediumTextStyle().copyWith(fontSize: 14));
  }
}