import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/routing/navigation_service.dart';
import 'package:smart/core/routing/routes.dart';
import 'package:smart/core/widgets/custom_button.dart';
import '../../../data/models/parking_location.dart';
import 'header_section.dart';
import 'parking_info_section.dart';
import 'quick_booking_section.dart';

import 'package:smart/core/theme/app_color.dart';

class ParkingDetailsSheet extends StatelessWidget {
  final ParkingLocation parkingData;
  final VoidCallback onClose;
  final VoidCallback? onBookNow;
  final VoidCallback? onDetails;

  const ParkingDetailsSheet({
    super.key,
    required this.parkingData,
    required this.onClose,
    this.onBookNow,
    this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13).copyWith(bottom: 17),
      child: SizedBox(
        height: size.height * 0.90,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 16) {
                    onClose();
                  }
                },
                onVerticalDragEnd: (details) {
                  final vy = details.primaryVelocity ?? 0;
                  if (vy > 400) {
                    onClose();
                  }
                },
                child: _body(context, size),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, Size size) {
    return Container(
      //0.60,
      //  height: size.height * 0.60,
      //  width: size.width - 26,
      height: 569.h,
      width: 367.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 4.h),
            Container(
              width: 172.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: AppColor.blackColor,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.selectedTabTextColor.withOpacity(0.25),
                    blurRadius: 8,
                    spreadRadius: 0.8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            HeaderSection(
              imageUrl: parkingData.imageUrl ?? "",
              isAvailable: parkingData.isAvailable,
            ),
            SizedBox(height: 8.h),
            ParkingInfoSection(parkingData: parkingData),
            SizedBox(height: 8.h),
            QuickBookingSection(
              onBookNow: onBookNow,
            ),
            SizedBox(height: 18.h),
            CustomButtonWidget(
              height: 40,
              onPressed: () {
                // NavigationService.push(
                //   RoutePaths.durationScreen,
                //   context: context,
                // );

                NavigationService.push(
                  RoutePaths.bookingParkingDetailsPage,
                  context: context,
                );
              },
              text: "ابدأ الحجز",
            ),
          ],
        ),
      ),
    );
  }
}
