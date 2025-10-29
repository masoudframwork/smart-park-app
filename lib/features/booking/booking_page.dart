import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/features/booking/presentation/widgets/booking_details_view.dart'
    show BookingDetailView;
import 'package:smart_park_app/features/booking/presentation/widgets/booking_list_view.dart'
    show BookingListView;
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import 'presentation/controller/reservation_controller.dart';

class BookingPage extends ConsumerWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationState = ref.watch(reservationController);
    final selectedReservation = reservationState.selectedReservationId != null
        ? reservationState.reservations.firstWhere(
            (r) => r.id == reservationState.selectedReservationId,
            orElse: () => reservationState.reservations.first,
          )
        : null;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColor.lightBackgroundColor,
        body: Column(
          children: [
            _buildCustomAppBar(
                context, reservationState.selectedReservationId != null, ref),
            Expanded(
              child: reservationState.selectedReservationId != null &&
                      selectedReservation != null
                  ? BookingDetailView(reservation: selectedReservation)
                  : BookingListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(
      BuildContext context, bool showBackButton, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.h,
        left: 16.w,
        right: 16.w,
        bottom: 16.h,
      ),
      color: AppColor.lightBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Add this

        children: [
          // Top row with menu and arrow buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Menu Button
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.greyContainerColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColor.whiteColor,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: AppColor.blackColor,
                    size: 20.sp,
                  ),
                  onPressed: () {},
                ),
              ),

              // Arrow Button
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.greyContainerColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColor.whiteColor,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: AppColor.blackColor,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    if (showBackButton) {
                      ref.read(reservationController.notifier).clearSelection();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),

          // Title below (only show when not in detail view)
          if (!showBackButton) ...[
            SizedBox(height: 22.h),
            AppText(
              text: 'الحجوزات',
              appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackNumberSmallColor),
            ),
          ],
        ],
      ),
    );
  }
}
