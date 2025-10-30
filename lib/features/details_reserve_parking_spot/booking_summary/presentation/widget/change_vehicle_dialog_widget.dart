import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/primary_button.dart';
import '../../../the_vehicle/persentation/widgets/vehicle_tile.dart';

class ChangeVehicleBottomSheet extends StatelessWidget {
  const ChangeVehicleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
        bottom: 24.h + 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      constraints: BoxConstraints(
        maxHeight: 0.55.sh,
      ),
      child: Stack(
        children: [
          Column(
            spacing: 20.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'تغيير المركبة',
                    appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        border: Border.all(
                          color: AppColor.contanearGreyColor,
                          width: 0.8,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.close,
                        size: 18.w,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 11.h,
                    children: [
                      VehicleTile(
                        bgColor: AppColor.secondaryColor,
                        borderColor: AppColor.secondaryColor,
                        title: 'نيسان باتفايندر 2023 / أسود',
                        carIcon: Icon(
                          Icons.directions_car,
                          color: AppColor.blackColor,
                          size: 24,
                        ),
                        textStyle: AppTextTheme.titleSmallTextStyle().copyWith(
                          color: AppColor.blackColor,
                        ),
                        isSelected: true,
                      ),
                      VehicleTile(
                        bgColor: AppColor.greysCardColor,
                        borderColor: AppColor.contanearGreyColor,
                        title: 'تويوتا كورولا 2024 / أحمر',
                        carIcon: const Icon(
                          Icons.directions_car,
                          color: AppColor.secondaryContainerColor,
                          size: 24,
                        ),
                        textStyle: AppTextTheme.titleMediumTextStyle(),
                        isSelected: false,
                      ),
                      _AddNewVehicleTile(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: double.infinity,
              height: 52.h,
              child: PrimaryButton(
                text: 'تحديث',
                showDefaultIcon: false,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddNewVehicleTile extends StatelessWidget {
  const _AddNewVehicleTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
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
