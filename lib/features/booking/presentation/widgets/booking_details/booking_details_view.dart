import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/booking/presentation/controller/timer_controller.dart';
import 'package:smart/features/booking/presentation/controller/booking_controller.dart';
import 'package:smart/features/booking/presentation/widgets/booking_details/booking_detail_action.dart';
import 'package:smart/features/booking/presentation/widgets/booking_details/booking_detail_appbar.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../domain/models/booking_model.dart';
import 'booking_detail_header.dart';
import 'booking_detail_info.dart';
import 'booking_detail_timer.dart';

class BookingDetailView extends ConsumerWidget {
  final BookingModel reservation;

  const BookingDetailView({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerControllerProvider(reservation.id));
    final timerController =
        ref.read(timerControllerProvider(reservation.id).notifier);

    return Scaffold(
      backgroundColor: AppColor.lightBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const BookingDetailAppBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  BookingDetailHeader(
                    startTime: reservation.startTime,
                    endTime: reservation.endTime,
                    date: 'السبت 30/10/2023',
                  ),
                  SizedBox(height: 32.h),
                  BookingDetailTimer(
                    timerState: timerState,
                    timerController: timerController,
                  ),
                  SizedBox(height: 32.h),
                  BookingDetailInfo(reservation: reservation),
                  SizedBox(height: 32.h),
                  BookingDetailActions(
                    onCancel: () => _handleCancel(context, ref),
                    onExtend: () => _handleExtend(context, ref),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCancel(BuildContext context, WidgetRef ref) {
    // Controller handles the business logic
    ref.read(reservationController.notifier).cancelReservation(reservation.id);
    Navigator.pop(context);
  }

  void _handleExtend(BuildContext context, WidgetRef ref) {
    // Controller handles the business logic
    ref.read(reservationController.notifier).extendReservation(reservation.id);
    Navigator.pop(context);
  }
}