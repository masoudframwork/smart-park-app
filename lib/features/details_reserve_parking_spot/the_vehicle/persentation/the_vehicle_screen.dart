import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/features/details_reserve_parking_spot/the_vehicle/persentation/widgets/section_title.dart';
import 'package:smart_park_app/features/details_reserve_parking_spot/the_vehicle/persentation/widgets/vehicle_tile.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';

import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/primary_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/total_bar.dart';
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
        body: SingleChildScrollView(
          padding:  EdgeInsets.all(16),
          child: Column(
            spacing: 15.h,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //step2
              const StepsHeader(active: 2),
              const SectionTitle(
                icon: Icons.local_shipping,
                title: 'اختر المركبة',
              ),
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
              VehicleTile(
                bgColor: AppColor.greysCardColor,
                borderColor: AppColor.contanearGreyColor,
                title: 'مركبة أخرى',
                carIcon: const Icon(Icons.add),
                isAddNew: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 125.h,
              ),
              TotalBar(total: total),
              PrimaryButton(
                showDefaultIcon:true,
                text: 'التالي',
                onPressed: () {
                  NavigationService.push('/paymentScreen', context: context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
