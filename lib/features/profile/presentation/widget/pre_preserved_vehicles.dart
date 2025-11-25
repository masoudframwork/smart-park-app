import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/helpers/show_change_vehicle_dialog.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/arrow_widget_custom_bar.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../details_reserve_parking_spot/booking_step1/presentation/widget/bottom_sheet/another_vehicle_bottom_sheet.dart';
class PrePreservedVehicles extends StatelessWidget {
  const PrePreservedVehicles({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        appBar: CustomAppBar(
          backgroundColor: AppColor.backgroundAppBarColor,
          leading: CircleImageButton(
            imageUrl: AppImages.appLogo,
            size: 37,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            spacing: 18.h,
            children: [
              ArrowWidgetCustomBar(
                onTap: () {
                  Navigator.of(context).pop();
                },
                title: S.of(context).pre_preserved_vehicles,
              ),

              SizedBox(height: 16.h),
              _VehiclesStepContent(),

            ],
          ),
        ),
      ),
    );
  }
}

class _VehiclesStepContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        TheVehicleTiles(
          title:  S.of(context).nissan_car,
          bgColor: AppColor.whiteColor,
          borderColor: AppColor.lightPurpleColor,
          carIcon: SvgPicture.asset(
            AppImages.iconsCars,
          ),
          trailingIcon: SvgPicture.asset(
            AppImages.delete,
          ),
        ),
        SizedBox(height: 8.h),
        TheVehicleTiles(
          title:  S.of(context).toyota_car,
          bgColor: AppColor.whiteColor,
          borderColor: AppColor.lightPurpleColor,
          carIcon: SvgPicture.asset(
            AppImages.iconsCars,
          ),
          trailingIcon: SvgPicture.asset(
            AppImages.delete,
          ),
        ),
        SizedBox(height: 8.h),
        TheVehicleTiles(
          title: S.of(context).another_car,
          bgColor: AppColor.whiteColor,
          borderColor: AppColor.whiteColor,

          carIcon: const SizedBox.shrink(),
          isAddNew: true,
          onTap: () {
            showBlurBottomSheet(
              context: context,
              child: const AnotherVehicleBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}

class TheVehicleTiles extends StatelessWidget {
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

  final Widget? trailingIcon;

  const TheVehicleTiles({
    super.key,
    required this.bgColor,
    required this.borderColor,
    required this.title,
    required this.carIcon,
    this.textStyle,
    this.isSelected = false,
    this.isAddNew = false,
    this.tileWidth = 357,
    this.tileHeight = 66,
    this.onTap,
    this.trailingIcon,
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

    return InkWell(
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
            if (trailingIcon != null) ...[
              Spacer(),
              trailingIcon!,
            ],
          ],
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
