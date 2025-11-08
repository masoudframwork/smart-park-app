import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMarkerWidget extends StatelessWidget {
  final String type;
  final String title;
  final bool isSelected;

  const CustomMarkerWidget({
    super.key,
    required this.type,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: _getMarkerColor(type),
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 3.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        _getMarkerIcon(type),
        color: Colors.white,
        size: 20.sp,
      ),
    );
  }

  IconData _getMarkerIcon(String type) {
    switch (type) {
      case 'parking':
        return Icons.local_parking;
      case 'charging':
        return Icons.electric_car;
      case 'service':
        return Icons.build;
      default:
        return Icons.place;
    }
  }

  Color _getMarkerColor(String type) {
    switch (type) {
      case 'parking':
        return Colors.blue;
      case 'charging':
        return Colors.green;
      case 'service':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
}
