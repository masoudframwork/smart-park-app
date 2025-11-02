import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/details_reserve_parking_spot/the_vehicle/persentation/widgets/section_title.dart';
import 'package:smart/features/details_reserve_parking_spot/the_vehicle/persentation/widgets/vehicle_tile.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/container_total_bar/total_bar.dart';
import '../../../../core/widgets/details_reserve_parking_widget/steps_header.dart';

class TheVehicleScreen extends StatelessWidget {
  const TheVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double total = 30;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: const CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const StepsHeader(active: 2),
                      SizedBox(height: 16.h),
                      const SectionTitle(
                        icon: Icons.local_shipping,
                        title: 'اختر المركبة',
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          NavigationService.push(
                            '/paymentScreen',
                            context: context,
                          );
                        },
                        child: VehicleTile(
                          bgColor: AppColor.secondaryColor,
                          borderColor: AppColor.secondaryColor,
                          title: 'نيسان باتفايندر 2023 / أسود',
                          carIcon: Icon(
                            Icons.directions_car,
                            color: AppColor.blackColor,
                            size: 24.w,
                          ),
                          textStyle:
                              AppTextTheme.titleSmallTextStyle().copyWith(
                            color: AppColor.blackColor,
                          ),
                          isSelected: true,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      VehicleTile(
                        bgColor: AppColor.greysCardColor,
                        borderColor: AppColor.contanearGreyColor,
                        title: 'تويوتا كورولا 2024 / أحمر',
                        carIcon: Icon(
                          Icons.directions_car,
                          color: AppColor.secondaryContainerColor,
                          size: 24.w,
                        ),
                        textStyle: AppTextTheme.titleMediumTextStyle(),
                        isSelected: false,
                      ),
                      SizedBox(height: 10.h),
                      VehicleTile(
                        bgColor: AppColor.greysCardColor,
                        borderColor: AppColor.contanearGreyColor,
                        title: 'مركبة أخرى',
                        carIcon: Icon(
                          Icons.add,
                          size: 24.w,
                          color: AppColor.blackColor,
                        ),
                        isAddNew: true,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TotalBar(total: total),
                  SizedBox(height: 12.h),
                  CustomButtonWidget(
                    text: 'التالي',
                    onPressed: () {
                      NavigationService.push(
                        '/paymentScreen',
                        context: context,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16.w,
                      color: AppColor.whiteColor,
                    ),
                    iconOnRight: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
