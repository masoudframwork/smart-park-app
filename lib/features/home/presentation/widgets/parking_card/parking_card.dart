import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/image_string.dart';
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 332.w,
          height: 105.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${parkingArea.code} ${parkingArea.name}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          parkingArea.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black54,
                          ),
                        ),
                        const Spacer(),

                        Row(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Arrow bottom-left
                            Container(
                              padding: EdgeInsets.all(6.r),
                              decoration: const BoxDecoration(
                                color: Color(0xFF6CBF4E),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(width: 10.w),

                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Shrinkable price text
                                    Flexible(
                                      child: Text(
                                        "${parkingArea.pricePerHour} ريال/ساعة",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 12.w),

                                    Text(
                                      parkingArea.formattedAvailability,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),

                                    SizedBox(width: 6.w),

                                    Icon(
                                      Icons.directions_car,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Container(
                    width: 110.w,
                    height: double.infinity,
                    color: Colors.grey.shade200,
                    child: parkingArea.imageUrl != null
                        ? Image.network(
                            parkingArea.imageUrl!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            AppImages.parkingDemo,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
