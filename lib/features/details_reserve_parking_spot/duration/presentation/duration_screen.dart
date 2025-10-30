import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/theme/app_color.dart';
import 'package:smart_park_app/features/details_reserve_parking_spot/duration/presentation/widgets/duration_slider.dart';

import '../../../../core/routing/navigation_service.dart';

import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/primary_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/total_bar.dart';
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //steps 1
              StepsHeader(
                active: 1,
              ),
              SizedBox(height: 24.h),
              ZoneImageCard(),
              SizedBox(height: 12.h),
              ZoneHeader(
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
                onMinus: () => controller.decrementStart(15),
                onPlus: () => controller.incrementStart(15),
              ),
              SizedBox(height: 111.h),
              //TotalBar(total: state.total),

              TotalBar(
                total: state.total,
                label: 'الإجمالي',
              ),

              SizedBox(height: 12.h),

              PrimaryButton(
                text: 'التالي',
                onPressed: () {
                  NavigationService.push('/theVehicleScreen', context: context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

