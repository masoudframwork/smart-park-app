import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/details_reserve_parking_spot/duration/presentation/widgets/duration_slider.dart';

import '../../../../core/routing/navigation_service.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/container_total_bar/total_bar.dart'
    show TotalBar;
import '../../../../core/widgets/details_reserve_parking_widget/steps_header.dart';
import '../../../../core/widgets/details_reserve_parking_widget/time_range_row.dart';
import '../../../../core/widgets/details_reserve_parking_widget/zone_header.dart';
import '../../../../core/widgets/details_reserve_parking_widget/zone_image_card_widget.dart';
import 'controller/duration_controller.dart';

class DurationScreen extends ConsumerWidget {
  const DurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(durationControllerProvider);
    final controller = ref.read(durationControllerProvider.notifier);

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
                      // الخطوات Stepper
                      const StepsHeader(active: 1),
                      SizedBox(height: 24.h),

                      const ZoneImageCard(),
                      SizedBox(height: 12.h),

                      const ZoneHeader(
                        zoneName: ' المنطقة 013',
                        capacityText: '70/13',
                        showDurationSection: true,
                      ),
                      SizedBox(height: 16.h),

                      DurationRow(
                        hours: state.hours,
                        onMinus: () => controller.setHours(state.hours - 1),
                        onPlus: () => controller.setHours(state.hours + 1),
                        onChanged: (v) => controller.setHours(v.round()),
                      ),
                      SizedBox(height: 16.h),
                      TimeRangeRow(
                        start: state.start,
                        end: state.end,
                        onStartMinus: () => controller.decrementStart(15),
                        onStartPlus: () => controller.incrementStart(15),
                        onEndMinus: () => controller.decrementEnd(15),
                        onEndPlus: () => controller.incrementEnd(15),
                      ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TotalBar(
                    total: state.total,
                    label: 'الإجمالي',
                  ),
                  SizedBox(height: 12.h),
                  CustomButtonWidget(
                    text: 'التالي',
                    onPressed: () {
                      NavigationService.push(
                        '/theVehicleScreen',
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
