import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../the_vehicle/persentation/widgets/vehicle_tile.dart';

class ChangeVehicleBottomSheet extends StatelessWidget {
  const ChangeVehicleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: 'تغيير المركبة',
      headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
      body: Column(
        spacing: 11.h,
        children: [
          VehicleTile(
            bgColor: AppColor.secondaryColor,
            borderColor: AppColor.secondaryColor,
            title: 'نيسان باتفايندر 2023 / أسود',
            tileWidth: 318,
            tileHeight: 66,
            carIcon: Icon(
              Icons.directions_car,
              color: AppColor.blackColor,
              size: 24,
            ),
            textStyle: AppTextTheme.titleSmallTextStyle().copyWith(
              color: AppColor.blackColor,
              decoration: TextDecoration.none,
            ),
            isSelected: true,
          ),
          VehicleTile(
            bgColor: AppColor.greysCardColor,
            borderColor: AppColor.contanearGreyColor,
            title: 'تويوتا كورولا 2024 / أحمر',
            tileWidth: 318,
            tileHeight: 66,
            carIcon: const Icon(
              Icons.directions_car,
              color: AppColor.secondaryContainerColor,
              size: 24,
            ),
            textStyle: AppTextTheme.titleMediumTextStyle().copyWith(
              decoration: TextDecoration.none,
            ),
            isSelected: false,
          ),
          const _AddNewVehicleTile(),
        ],
      ),
      bottomAction: CustomButtonWidget(
        text: 'تحديث',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _AddNewVehicleTile extends StatelessWidget {
  const _AddNewVehicleTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318.w,
      height: 66.h,
      decoration: BoxDecoration(
        color: AppColor.greysCardColor,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: AppColor.contanearGreyColor,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: 'مركبة أخرى',
            appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
              decoration: TextDecoration.none,
              color: AppColor.blackNumberSmallColor,
            ),
          ),
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
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
          ),
        ],
      ),
    );
  }
}
