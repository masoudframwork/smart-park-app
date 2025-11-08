import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';

class VehicleTile extends StatelessWidget {
  final bool isSelected;
  final bool isAddNew;

  final Color bgColor;
  final Color borderColor;

  final Widget carIcon;
  final String title;
  final TextStyle? textStyle;

  final double tileWidth;
  final double tileHeight;

  const VehicleTile({
    super.key,
    required this.bgColor,
    required this.borderColor,
    required this.title,
    required this.carIcon,
    this.textStyle,
    this.isSelected = false,
    this.isAddNew = false,
    this.tileWidth = 360,
    this.tileHeight = 66,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileWidth.w,
      height: tileHeight.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          _buildLeadingBox(),
          SizedBox(width: 12.w),
          AppText(
            text: title,
            appTextTheme: (textStyle ?? AppTextTheme.bodyMediumTextStyle()),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingBox() {
    if (isAddNew) {
      return Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.add,
          size: 18.w,
          color: AppColor.primaryColor,
        ),
      );
    }

    return Container(
      width: 77.w,
      height: 47.h,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      alignment: Alignment.center,
      child: carIcon,
    );
  }
}
