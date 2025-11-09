import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../the_vehicle/persentation/widgets/vehicle_tile.dart';
import '../../domain/vehicle_option.dart';

class ChangeVehicleBottomSheet extends ConsumerWidget {
  const ChangeVehicleBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehicleOptionsProvider);
    final selectedIndex = ref.watch(selectedVehicleIndexProvider);

    return AppBottomSheet(
      title: 'تغيير المركبة',
      headerStyle: SheetHeaderStyle.spacedTitleWithCloseOnRight,
      body: Column(
        spacing: 11.h,
        children: [
          for (int i = 0; i < vehicles.length; i++)
            VehicleTile(
              bgColor: i == selectedIndex
                  ? AppColor.secondaryColor
                  : AppColor.greysCardColor,
              borderColor: i == selectedIndex
                  ? AppColor.secondaryColor
                  : AppColor.contanearGreyColor,
              title: vehicles[i].title,
              carIcon: SvgPicture.asset(vehicles[i].assetSvg),
              textStyle: (i == selectedIndex
                      ? AppTextTheme.titleSmallTextStyle()
                          .copyWith(color: AppColor.blackColor)
                      : AppTextTheme.titleMediumTextStyle())
                  .copyWith(decoration: TextDecoration.none),
              isSelected: i == selectedIndex,
              onTap: () {
                ref.read(selectedVehicleIndexProvider.notifier).state = i;
              },
            ),
          VehicleTile(
            isAddNew: true,
            bgColor: AppColor.greysCardColor,
            borderColor: AppColor.contanearGreyColor,
            title: 'مركبة أخرى',
            carIcon: const SizedBox.shrink(),
            textStyle: AppTextTheme.titleMediumTextStyle().copyWith(
              decoration: TextDecoration.none,
              color: AppColor.blackNumberSmallColor,
            ),
            onTap: () {},
          ),
          const SizedBox(height: 10),
          CustomButtonWidget(
            text: 'تحديث',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
