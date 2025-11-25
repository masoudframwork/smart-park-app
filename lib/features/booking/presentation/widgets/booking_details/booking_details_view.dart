import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/features/booking/presentation/controller/timer_controller.dart';
import 'package:smart/features/booking/presentation/controller/booking_controller.dart';
import 'package:smart/features/booking/presentation/widgets/booking_details/booking_detail_action.dart';
import '../../../../../core/constants/image_string.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/models/booking_model.dart';
import 'booking_detail_header.dart';
import 'booking_detail_info.dart';
import 'booking_detail_timer.dart';

class BookingDetailView extends ConsumerWidget {
  const BookingDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(reservationController);
    final BookingModel? reservation = bookingState.selectedReservation;

    if (reservation == null) {
      return Scaffold(
        backgroundColor: AppColor.lightBackgroundColor,
        body: Center(
          child: Text(
            'لا يوجد حجز محدد',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16.sp,
            ),
          ),
        ),
      );
    }

    final timerState = ref.watch(timerControllerProvider(reservation.id));
    final timerController =
        ref.read(timerControllerProvider(reservation.id).notifier);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  const BookingDetailAppBar(),

            CloseButtonCircle(
              onTap: () {
                NavigationService.pop(context);
              },
            ),

            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Container(
                      width: 361.w,
                      height: 82.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColor.textColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        spacing: 8.w,
                        children: [
                          SvgPicture.asset(
                            AppImages.trueChek,
                            width: 47.w,
                            height: 47.w,
                          ),
                          Flexible(
                            child: AppText(
                              //تم حجز الموقف بنجاح
                              text: S
                                  .of(context)
                                  .thepositionhasbeenbookedsuccessfully,
                              appTextTheme:
                              AppTextTheme.titleMSTextStyle().copyWith(
                                  color: AppColor.whiteColor,

                              ),
                            ),
                          ),
                        ],
                      )),

                  SizedBox(height: 20.h),
                  BookingDetailHeader(
                    startTime: reservation.startTime,
                    endTime: reservation.endTime,
                    // date: reservation.date,
                    date: S.of(context).booking_detail_date_sample,
                  ),

                  SizedBox(height: 32.h),
                  BookingDetailTimer(
                    timerState: timerState,
                    timerController: timerController,
                  ),
                  SizedBox(height: 32.h),
                  BookingDetailInfo(reservation: reservation),
                  SizedBox(height: 50.h),
                  BookingDetailActions(
                    onCancel: () =>
                        _handleCancel(context, ref, reservation.id),
                    onExtend: () =>
                        _handleExtend(context, ref, reservation.id),

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleCancel(
      BuildContext context, WidgetRef ref, String reservationId) {
    ref.read(reservationController.notifier).cancelReservation(reservationId);
    Navigator.pop(context);
  }

  void _handleExtend(
      BuildContext context, WidgetRef ref, String reservationId) {
    ref.read(reservationController.notifier).extendReservation(reservationId);
    Navigator.pop(context);
  }
}

class CloseButtonCircle extends StatelessWidget {
  final VoidCallback onTap;
  const CloseButtonCircle({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 28.w,
          height: 28.w,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.close,
            size: 16.w,
          ),
        ),
      ),
    );
  }
}
