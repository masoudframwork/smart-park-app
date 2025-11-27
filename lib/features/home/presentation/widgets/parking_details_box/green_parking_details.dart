import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/widgets/custom_button.dart';
import 'package:smart/features/home/presentation/widgets/parking_details_box/timer_progress_ring.dart';
import 'package:smart/generated/l10n.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../booking/presentation/controller/booking_controller.dart';
import '../../../domain/models/parking_area_model.dart';

class GreenParkingDetails extends ConsumerWidget {
  final ParkingArea parkingArea;
  final VoidCallback onClose;

  const GreenParkingDetails({
    super.key,
    required this.parkingArea,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.homePageActiveColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          /// --- TOP ROW: TIMER + TEXT ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// TEXT COLUMN
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: isRTL
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.start,
                    children: [
                      /// Parking Area Name
                      AppText(
                        text: S.of(context).zone013,
                        appTextTheme:
                            AppTextTheme.activeCardTextDescStyle().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  
                      SizedBox(height: 6.h),
                  
                      /// Location
                      ///
                      AppText(
                        text: S.of(context).khuraisRoadRiyadhSaudiArabia,
                        appTextTheme:
                            AppTextTheme.activeCardTextDescStyle().copyWith(
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  
                      SizedBox(height: 6.h),
                  
                      /// Time range (translated + RTL/LTR switches arrow)
                  
                      AppText(
                        text: S.of(context).green_parking_time_range(
                              S.of(context).booking_time_start_example,
                              S.of(context).booking_time_end_example,
                            ),
                        appTextTheme:
                            AppTextTheme.activeCardTextDescStyle().copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  
                      SizedBox(height: 6.h),
                  
                      /// Vehicle info
                      AppText(
                        text: S.of(context).green_parking_vehicle_info(
                              parkingArea.name,
                              parkingArea.availableSpots.toString(),
                            ),
                        appTextTheme:
                            AppTextTheme.activeCardTextDescStyle().copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 16.w),

              /// Timer ring
              _buildTimerRing(),
            ],
          ),

          SizedBox(height: 18.h),
          CustomButtonWidget(
              type: ButtonType.outlined,
              borderColor: AppColor.whiteColor,
              borderRadius: 6.r,
              text: S.of(context).active_card_booking_summary,
              onPressed: () {
                final bookingState = ref.read(reservationController);

                if (bookingState.reservations.isEmpty) {
                  Navigator.pop(context);
                  return;
                }

                final reservation = bookingState.reservations.last;

                ref
                    .read(reservationController.notifier)
                    .selectReservation(reservation.id);
                NavigationService.push('/bookingDetailView', context: context);
              }),
        ],
      ),
    );
  }

  /// Timer ring widget
  Widget _buildTimerRing() {
    return TimerProgressRing(
      progress: 0.35,
      timeText: "05:06:30",
    );
  }
}
