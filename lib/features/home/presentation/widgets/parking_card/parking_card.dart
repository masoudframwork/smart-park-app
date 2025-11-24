import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/image_string.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../domain/models/parking_area_model.dart';

class ParkingCard extends StatelessWidget {
  final ParkingArea parkingArea;
  final VoidCallback? onTap;

  const ParkingCard({
    super.key,
    required this.parkingArea,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Directionality.of(context) == TextDirection.rtl;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 340.w,
        height: 150.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Container(
                width: 80.w,
                height: 80.h,
                color: Colors.grey.shade200,
                child: parkingArea.imageUrl != null
                    ? Image.network(parkingArea.imageUrl!, fit: BoxFit.cover)
                    : Image.asset(AppImages.parkingDemo, fit: BoxFit.cover),
              ),
            ),

            SizedBox(width: 14.w),

            /// TEXT SECTION
            Expanded(
              child: Column(
                crossAxisAlignment:
                isArabic ? CrossAxisAlignment.start : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// TITLE
                  Text(
                    isArabic
                        ? "المنطقة ${parkingArea.code}"
                        : "Area ${parkingArea.code}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F4A3A),
                    ),
                  ),

                  SizedBox(height: 6.h),

                  /// LOCATION
                  Text(
                    parkingArea.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  /// BOTTOM ROW
                  Row(
                    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                    children: [
                      Expanded(
                        child: Row(
                          textDirection:
                          isArabic ? TextDirection.rtl : TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /// PRICE
                            Row(
                              children: [
                                Text(
                                  parkingArea.pricePerHour.toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                SvgPicture.asset(
                                  AppImages.realSu,
                                  width: 14.w,
                                  height: 14.h,
                                  color: Colors.black87,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  isArabic ? "/ ساعة" : "/ hour",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 14.w),

                            /// AVAILABILITY
                            SvgPicture.asset(
                              AppImages.carIcon,
                              width: 14.w,
                              height: 14.h,
                            ),

                            SizedBox(width: 8.w),
                            Flexible(
                              child: Text(
                                parkingArea.formattedAvailability,
                                overflow: TextOverflow.ellipsis,
                                textAlign:
                                isArabic ? TextAlign.right : TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16.w),

                      /// ARROW
                      GestureDetector(
                        onTap: () {
                          NavigationService.push(
                            '/bookingParkingDetailsPage',
                            context: context,
                          );
                        },
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6CBF4E),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
