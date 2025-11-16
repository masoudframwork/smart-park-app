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
      // 🔥 FORCE LTR so image stays on right
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 300.w,
          height: 120.h,
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
              // ==========================
              // LEFT SIDE CONTENT (Text)
              // ==========================
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Green button + title
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: const BoxDecoration(
                              color: Color(0xFF6CBF4E),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              "${parkingArea.code} ${parkingArea.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Description (location)
                      Text(
                        parkingArea.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black54,
                        ),
                      ),

                      // Price + availability + car icon
                      Row(
                        children: [
                          Text(
                            "${parkingArea.pricePerHour} ريال/ساعة",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            parkingArea.formattedAvailability, // "5/10"
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          const Icon(
                            Icons.directions_car,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ==========================
              // RIGHT-SIDE IMAGE
              // ==========================
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
