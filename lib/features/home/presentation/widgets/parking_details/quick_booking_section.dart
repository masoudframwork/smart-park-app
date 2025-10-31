import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'booking_info_row.dart';

class QuickBookingSection extends StatelessWidget {
  final VoidCallback? onBookNow;

  const QuickBookingSection({super.key, this.onBookNow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الحجز السريع',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          SizedBox(height: 16.h),
          BookingInfoRow(
            icon: Icons.directions_car,
            text: 'نيسان باثفايندر 2023 / أسود',
            color: Colors.green,
          ),
          SizedBox(height: 12.h),
          BookingInfoRow(
            icon: Icons.access_time,
            text: 'من 8:00 ص إلى 4:00 م',
            color: Colors.green,
          ),
          SizedBox(height: 12.h),
          BookingInfoRow(
            icon: Icons.credit_card,
            text: 'البطاقة المنتهية ب 000',
            color: Colors.green,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onBookNow ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'احجز الآن',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '40 ريال',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

