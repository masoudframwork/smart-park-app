import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/features/details_reserve_parking_spot/the_vehicle/persentation/widgets/section_title.dart';
import 'package:smart/features/details_reserve_parking_spot/the_vehicle/persentation/widgets/vehicle_tile.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/container_total_bar/total_bar.dart';
import '../../../../core/widgets/details_reserve_parking_widget/steps_header.dart';
import '../domain/the_vehicle_model.dart';
import 'controller/the_vehicle_controller.dart';


class TheVehicleScreen extends ConsumerWidget {
  const TheVehicleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vehicleScreenProvider);
    final controller = ref.read(vehicleScreenProvider.notifier);

    const Color normalBg     = AppColor.greysCardColor;
    const Color normalBorder = AppColor.contanearGreyColor;

    Widget buildIconFor(VehicleItem v) {
      switch (v.id) {
        case '1':
          return SvgPicture.asset(AppImages.carVehicleCar2);
        case '2':
          return SvgPicture.asset(AppImages.carVehicleCar1);
        default:
          return Icon(Icons.directions_car, size: 24.w, color: AppColor.blackColor);
      }
    }

    void onVehicleTap(VehicleItem v) {
      if (v.isAddNew) {
        NavigationService.push('/addVehicle', context: context);
        return;
      }
      controller.selectVehicle(v.id);
      NavigationService.push('/paymentScreen', context: context);
    }


    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          leading: SquareButton(
            onTap: () => Navigator.pop(context),
            icon: Image.asset(
              AppImages.arrowRightIcon,
              width: 20.w,
              height: 20.w,
              color: AppColor.primaryColor,
            ),
          ),
          trailing: CloseButtonCircle(onTap: () => Navigator.pop(context)),
        ),
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
                      SizedBox(height: 20.h),
                      SectionTitle(
                        leading: SvgPicture.asset(AppImages.car),
                        title: 'اختر المركبة',
                      ),
                      SizedBox(height: 12.h),

                      ...state.vehicles.map((v) {
                        final bool selected = state.selectedId == v.id;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: VehicleTile(
                            bgColor: normalBg,
                            borderColor: normalBorder,
                            title: v.title,
                            carIcon: v.isAddNew
                                ? Icon(Icons.add, size: 24.w, color: AppColor.blackColor)
                                : buildIconFor(v),
                            textStyle: AppTextTheme.titleSmallTextStyle().copyWith(
                              color: AppColor.blackColor,
                            ),
                            isSelected: selected && !v.isAddNew,
                            isAddNew: v.isAddNew,
                            onTap: () => onVehicleTap(v), // <<<<< تمّ التفعيل
                          ),
                        );
                      }).toList(),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TotalBar(total: state.total),
                  SizedBox(height: 12.h),
                  CustomButtonWidget(
                    text: 'التالي',
                    onPressed: () {
                      if (state.selectedId != null && state.selectedId != 'add_new') {
                        NavigationService.push('/paymentScreen', context: context);
                      }
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined,
                        size: 16.w, color: AppColor.whiteColor),
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
