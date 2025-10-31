import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';

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
    return Column(
      children: [
        _buildData(),
      ],
    );
  }

  Row _buildData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildIconButton(Icons.shower, AppColor.greenTextColor),
            SizedBox(width: 8.w),
            _buildIconButton(
                Icons.electric_meter_outlined, AppColor.greenTextColor),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColor.containerColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isAvailable ? Icons.check_circle_outline : Icons.cancel,
                color: AppColor.greenTextColor,
                size: 16.sp,
              ),
              SizedBox(width: 4.w),
              AppText(
                text: isAvailable ? 'متاح الآن' : 'غير متاح',
                appTextTheme: AppTextTheme.bodySmallTextStyle()
                    .copyWith(color: AppColor.greenTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
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
