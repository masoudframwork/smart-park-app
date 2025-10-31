import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  final String? imageUrl;
  final bool isAvailable;

  const HeaderSection({
    super.key,
    required this.imageUrl,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: imageUrl != null
              ? ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.r)),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildPlaceholder(),
                  ),
                )
              : _buildPlaceholder(),
        ),
        Positioned(
          top: 80.h,
          left: 16.w,
          right: 16.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildIconButton(Icons.location_on, Colors.green),
                  SizedBox(width: 8.w),
                  _buildIconButton(Icons.arrow_upward, Colors.green),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isAvailable ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isAvailable ? Icons.check_circle : Icons.cancel,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      isAvailable ? 'متاح الآن' : 'غير متاح',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Icon(
          Icons.local_parking,
          size: 40.sp,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 18.sp),
    );
  }
}

