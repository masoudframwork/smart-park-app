
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
  final VoidCallback? onTap;

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
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedBg     = AppColor.secondaryColor;
    final Color selectedBorder = AppColor.secondaryColor;
    final Color selectedText   = AppColor.blackColor;

    final Color effectiveBg     = isSelected ? selectedBg     : bgColor;
    final Color effectiveBorder = isSelected ? selectedBorder : borderColor;
    final Color effectiveText   = isSelected ? selectedText   : (textStyle?.color ?? AppColor.blackColor);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6.r),
        child: Container(
          width: tileWidth.w,
          height: tileHeight.h,
          decoration: BoxDecoration(
            color: effectiveBg,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: effectiveBorder,
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
                appTextTheme: (textStyle ?? AppTextTheme.bodyMediumTextStyle())
                    .copyWith(color: effectiveText),
              ),
            ],
          ),
        ),
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
