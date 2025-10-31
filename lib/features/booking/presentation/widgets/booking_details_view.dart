import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/features/booking/presentation/controller/timer_controller.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/models/booking_model.dart';
import '../../domain/models/timer_state.dart';

class BookingDetailView extends ConsumerWidget {
  final BookingModel reservation;

  const BookingDetailView({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerControllerProvider(reservation.id));
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          _buildTimeHeader(),
          SizedBox(height: 40.h),
          _buildTimer(ref, timerState),
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
        _buildTimeBlock(reservation.startTime),
        SizedBox(width: 16.w),
        Image.asset(
          AppImages.arrowIcon,
          width: 20.w,
          height: 18.w,
          color: AppColor.primaryColor,
        ),
        SizedBox(width: 16.w),
        _buildTimeBlock(reservation.endTime),
      ],
    );
  }

  Widget _buildTimeBlock(String time) {
    return AppText(text: time, appTextTheme: AppTextTheme.bodyLargeTextStyle());
  }

  Widget _buildTimer(WidgetRef ref, TimerState timerState) {
    final timerController =
        ref.read(timerControllerProvider(reservation.id).notifier);

    return SizedBox(
      width: 280.w,
      height: 280.w,
      child: Stack(
        children: [
          SvgPicture.asset(
            AppImages.timerClock,
            width: 280.w,
            height: 280.w,
            colorFilter: ColorFilter.mode(
              AppColor.greyContainerColor,
              BlendMode.srcIn,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(9.w),
              child: CircularProgressIndicator(
                value: timerState.progress,
                strokeWidth: 18.5.w,
                backgroundColor: Colors.transparent,
                valueColor:
                    AlwaysStoppedAnimation(AppColor.yellowContainerColor),
                strokeCap: StrokeCap.square,
              ),
            ),
          ),
          Center(
            child: AppText(
              text: timerController.getFormattedTime(),
              appTextTheme:
                  AppTextTheme.numberLargeTextStyle().copyWith(fontSize: 32.sp),
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
        _buildInfoCard(
          Icons.location_on,
          'المنطقة 013',
          '',
          AppImages.location,
        ),
        _buildInfoCard(Icons.directions_car, 'رسائل بالتفاصيل', 'أ س و / 2023'),
        _buildInfoCard(
          Icons.credit_card,
          'البطاقة المنتهية',
          'ب 000',
        ),
      ],
    );
  }

  Widget _buildInfoCard(IconData icon, String label,
      [String? subtitle, String? img]) {
    return Column(
      children: [
        img == null
            ? Icon(icon, color: AppColor.primaryColor, size: 32.sp)
            : SvgPicture.asset(
                img,
                width: 18.w,
                height: 21.w,
                fit: BoxFit.cover,
              ),
        SizedBox(height: 8.h),
        AppText(
            text: label,
            appTextTheme: AppTextTheme.bodySmallTextStyle()
                .copyWith(color: AppColor.blackColor)),
        if (subtitle != null)
          AppText(
              text: subtitle,
              appTextTheme: AppTextTheme.numberSmallTextStyle()),
      ],
    );
  }

  Widget _buildCancelButton(WidgetRef ref) {
    return CustomButtonWidget(
      text: 'إلغاء الحجز',
      onPressed: () {
        // ref.read(reservationController.notifier).cancelReservation(reservation.id);
      },
      backgroundColor: AppColor.secondaryContainerColor,
      verticalPadding: 18,
      shadowColor: AppColor.blackColor.withOpacity(0.2),
      offset: Offset(0, 4),
      borderRadius: 4,
    );
  }
}
