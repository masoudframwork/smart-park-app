import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkerInfoCard extends StatelessWidget {
  final Map<String, dynamic> marker;
  final VoidCallback onClose;
  final VoidCallback onNavigate;
  final VoidCallback onDetails;

  const MarkerInfoCard({
    super.key,
    required this.marker,
    required this.onClose,
    required this.onNavigate,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 12.h),
            _buildInfo(),
            SizedBox(height: 16.h),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: _getMarkerColor(marker['type']).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            _getMarkerIcon(marker['type']),
            color: _getMarkerColor(marker['type']),
            size: 24.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                marker['title'],
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (marker['distance'] != null)
                Text(
                  '${marker['distance'].toStringAsFixed(1)} km away',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
            ],
          ),
        ),
        IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          marker['description'],
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8.h),
        _buildStatusInfo(),
        if (marker['price'] != null) ...[
          SizedBox(height: 8.h),
          _buildPriceInfo(),
        ],
        if (marker['rating'] != null) ...[
          SizedBox(height: 8.h),
          _buildRatingInfo(),
        ],
      ],
    );
  }

  Widget _buildStatusInfo() {
    final isAvailable = marker['isAvailable'] ?? true;
    return Row(
      children: [
        Icon(
          isAvailable ? Icons.check_circle : Icons.cancel,
          color: isAvailable ? Colors.green : Colors.red,
          size: 16.sp,
        ),
        SizedBox(width: 4.w),
        Text(
          isAvailable ? 'Available' : 'Unavailable',
          style: TextStyle(
            fontSize: 12.sp,
            color: isAvailable ? Colors.green : Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceInfo() {
    return Row(
      children: [
        Icon(
          Icons.attach_money,
          color: Colors.green,
          size: 16.sp,
        ),
        SizedBox(width: 4.w),
        Text(
          '\$${marker['price']}',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (marker['type'] == 'parking')
          Text(
            '/hour',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
      ],
    );
  }

  Widget _buildRatingInfo() {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 16.sp,
        ),
        SizedBox(width: 4.w),
        Text(
          marker['rating'].toString(),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          ' (4.5)',
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onNavigate,
            icon: const Icon(Icons.directions),
            label: const Text('Navigate'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _getMarkerColor(marker['type']),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onDetails,
            icon: const Icon(Icons.info),
            label: const Text('Details'),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
          ),
        ),
      ],
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
