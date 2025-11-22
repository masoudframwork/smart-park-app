import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/image_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_image_widget.dart';

class TheVehicleTile extends StatelessWidget {
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

  const TheVehicleTile({
    super.key,
    required this.bgColor,
    required this.borderColor,
    required this.title,
    required this.carIcon,
    this.textStyle,
    this.isSelected = false,
    this.isAddNew = false,
    this.tileWidth = 318,
    this.tileHeight = 66,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedBg = AppColor.secondaryColor;
    final Color selectedBorder = AppColor.secondaryColor;
    final Color selectedTextColor = AppColor.whiteColor;

    final Color effectiveBg = isSelected ? selectedBg : bgColor;
    final Color effectiveBorder = isSelected ? selectedBorder : borderColor;
    final Color effectiveText = isSelected
        ? selectedTextColor
        : (textStyle?.color ?? AppColor.blackColor);

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
                appTextTheme:
                    (textStyle ?? AppTextTheme.bodyMediumTextStyle()).copyWith(
                  color: effectiveText,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeadingBox() {
    if (isAddNew) {
      return CustomImageWidget(
        imageUrl: AppImages.add,
        width: 24.w,
        height: 24.w,
        isFlag: true,
        color: AppColor.primaryColor,
      );
    }

    return Container(
      width: 55.w,
      height: 47.h,
      decoration: BoxDecoration(
        color: AppColor.textColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: carIcon,
    );
  }
}
