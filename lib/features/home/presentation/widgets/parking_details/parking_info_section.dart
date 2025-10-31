import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'info_row.dart';

class ParkingInfoSection extends StatelessWidget {
  final Map<String, dynamic> parkingData;

  const ParkingInfoSection({super.key, required this.parkingData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            parkingData['title'] ?? 'Parking Area',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${parkingData['price'] ?? '5'} ريال/ساعة',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[700],
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          InfoRow(
            icon: Icons.location_on,
            text: 'طريق خريص، الرياض، المملكة العربية السعودية',
            color: Colors.green,
          ),
          SizedBox(height: 12.h),
          InfoRow(
            icon: Icons.local_parking,
            text:
                'المواقف المتاحة ${parkingData['availableSpots'] ?? 13}/${parkingData['totalSpots'] ?? 70}',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
