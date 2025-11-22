import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/home/presentation/widgets/parking_details_box/timer_progress_ring.dart';
import '../../../domain/models/parking_area_model.dart';

class GreenParkingDetails extends StatelessWidget {
  final ParkingArea parkingArea;
  final VoidCallback onClose;

  const GreenParkingDetails({
    super.key,
    required this.parkingArea,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF1B8354),
          borderRadius: BorderRadius.circular(30.r),   // FIXED: matches XD
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),    // softer shadow like design
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [

            /// CLOSE BUTTON (top-left)
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: GestureDetector(
            //     onTap: onClose,
            //     child: Icon(Icons.close, color: Colors.white, size: 22.sp),
            //   ),
            // ),

            SizedBox(height: 8.h),

            /// TOP ROW (Timer + Text)
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TIMER RING — accurate to XD
                  _buildTimerRing(),

                  SizedBox(width: 16.w),

                  /// TEXT COLUMN
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [

                        /// Parking name
                        Text(
                          "المنطقة ${parkingArea.code}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        /// Location text
                        Text(
                          parkingArea.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        /// Time Range
                        Text(
                          "٠٨:٠٠ ص ← ٠٤:٠٠ م",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        /// Vehicle info
                        Text(
                          "${parkingArea.name} | ${parkingArea.availableSpots}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 18.h),

            /// BOOKING DETAILS BUTTON — identical to XD
            Container(
              height: 46.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: Center(
                child: Text(
                  "تفاصيل الحجز",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// PERFECT CIRCULAR PROGRESS RING (stub visual identical to XD)
  Widget _buildTimerRing() {
    return TimerProgressRing(
      progress: 0.35,        // 65% complete — replace with real value
      timeText: "05:06:30",  // dynamic timer text
    );
  }

}
