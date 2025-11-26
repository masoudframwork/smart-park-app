import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        margin: EdgeInsets.only(top: 5.h, bottom: 16.h),
        //margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BookingWidgets.cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildBookingInfo(context)),
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

  // ---------------- UI Sections ----------------

  Widget _buildBookingInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLocationSection(),
        SizedBox(height: 8.h),
        _buildTimeRow(context),
        SizedBox(height: 8.h),
        _buildDateRow(),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Zone 013
        AppText(
          text: reservation.locationName,
          appTextTheme: AppTextTheme.titleMSTextStyle().copyWith(
            fontWeight: FontWeight.w700,
            color: AppColor.textColor,
          ),
        ),
        SizedBox(height: 4.h),
        // Khurais Road, Riyadh, Saudi Arabia
        AppText(
          text: reservation.address,
          appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
            fontSize: 12.sp,
            color: AppColor.greyColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeRow(BuildContext context) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    final String arrowText = isRtl ? '←' : '→';

    return Row(
      spacing: 17,
      children: [
        AppText(
          text: reservation.startTime,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 13.sp,
          ),
        ),
        AppText(
          text: arrowText,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            color: AppColor.textColor,
          ),
        ),
        AppText(
          text: reservation.endTime,
          appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow() {
    return AppText(
      // ممكن تكون date أو وصف السيارة حسب الموديل عندك
      //text:reservation.date,
      text: reservation.vehicleInfo ?? '',
      appTextTheme: AppTextTheme.bodyMediumTextStyle().copyWith(
        fontSize: 13.sp,
        color: AppColor.greyColor,
      ),
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
