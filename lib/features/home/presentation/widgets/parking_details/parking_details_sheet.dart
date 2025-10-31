import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'header_section.dart';
import 'parking_info_section.dart';
import 'quick_booking_section.dart';
import 'details_button.dart';

class ParkingDetailsSheet extends StatelessWidget {
  final Map<String, dynamic> parkingData;
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderSection(
            imageUrl: parkingData['imageUrl'],
            isAvailable: parkingData['isAvailable'] ?? true,
          ),
          ParkingInfoSection(parkingData: parkingData),
          QuickBookingSection(
            onBookNow: onBookNow,
          ),
          if (onDetails != null) DetailsButton(onDetails: onDetails!),
        ],
      ),
    );
  }
}

