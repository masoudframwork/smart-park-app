import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/features/booking/domain/models/booking_model.dart';
import 'package:smart/features/booking/presentation/controller/timer_controller.dart';
import 'package:smart/features/booking/presentation/widgets/time_circle_widget.dart'
    show TimerCircleWidget;
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../generated/l10n.dart';
import 'booking_widgets.dart';

class CurrentBookingCard extends ConsumerWidget {
  final BookingModel reservation;
  final VoidCallback onTap;
  final VoidCallback onCancel;
  final VoidCallback onExtend;

  const CurrentBookingCard({
    super.key,
    required this.reservation,
    required this.onTap,
    required this.onCancel,
    required this.onExtend,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerControllerProvider(reservation.id));
    final timerController =
        ref.read(timerControllerProvider(reservation.id).notifier);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BookingWidgets.cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildBookingInfo()),
                SizedBox(width: 16.w),
                TimerCircleWidget(
                  timerState: timerState,
                  timerController: timerController,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLocationSection(),
        SizedBox(height: 8.h),
        _buildTimeRow(),
        SizedBox(height: 8.h),
        _buildDateRow(),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: reservation.locationName,
          appTextTheme: AppTextTheme.bodyLargeTextStyle().copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 14.w,
              color: AppColor.primaryColor,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: AppText(
                text: reservation.address,
                appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                  fontSize: 12.sp,
                  color: AppColor.greyColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeRow() {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 14.w,
          color: AppColor.primaryColor,
        ),
        SizedBox(width: 4.w),
        AppText(
          text: reservation.startTime,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(width: 8.w),
        SvgPicture.asset(
          AppImages.arrowIcon,
          color: AppColor.primaryColor,
        ),
        SizedBox(width: 8.w),
        AppText(
          text: reservation.endTime,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow() {
    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          size: 14.w,
          color: AppColor.primaryColor,
        ),
        SizedBox(width: 4.w),
        AppText(
          text: reservation.date,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontSize: 13.sp,
            color: AppColor.greyColor,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BookingWidgets.buildActionButton(
            text: S.of(context).booking_extend,
            onTap: onExtend,
            backgroundColor: AppColor.primaryColor,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: BookingWidgets.buildActionButton(
            text: S.of(context).booking_end,
            onTap: onCancel,
            backgroundColor: AppColor.secondaryContainerColor,
          ),
        ),
      ],
    );
  }
}
