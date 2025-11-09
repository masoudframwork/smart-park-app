import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/booking_custom_time_bottom_sheet.dart';
import 'package:smart/features/details_reserve_parking_spot/duration/presentation/widgets/quick_duration_grid.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/helpers/show_change_vehicle_dialog.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/container_total_bar/total_bar.dart'
    show TotalBar;
import '../../../../core/widgets/details_reserve_parking_widget/steps_header.dart';
import '../../../../core/widgets/details_reserve_parking_widget/zone_header.dart';
import '../../../../core/widgets/details_reserve_parking_widget/zone_image_card_widget.dart';
import 'controller/duration_controller.dart';

class DurationScreen extends ConsumerWidget {
  const DurationScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(durationControllerProvider);
    //final controller = ref.read(durationControllerProvider.notifier);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          trailing: CloseButtonCircle(onTap: () {
            Navigator.pop(context);
          }),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const StepsHeader(active: 1),
                      SizedBox(height: 30.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.time,
                            width: 28.w,
                            height: 28.w,
                          ),
                          SizedBox(width: 8.w),
                          AppText(
                            text: 'حدد مدة الوقوف',
                            appTextTheme:
                                AppTextTheme.titleLargeTextStyle().copyWith(
                              color: AppColor.blackNumberSmallColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22.h),
                      const ZoneImageCard(),
                      SizedBox(height: 12.h),
                      const ZoneHeader(
                        zoneName: ' المنطقة 013',
                        capacityText: '70/13',
                        showDurationSection: true,
                      ),
                      SizedBox(height: 16.h),
                      const QuickDurationGrid(),
                      SizedBox(height: 16.h),
                      CustomButtonWidget(
                          icon: Image.asset(
                            AppImages.add,
                            width: 24.w,
                            height: 24.w,
                          ),
                          iconOnRight: false,
                          type: ButtonType.outlined,
                          iconLayout: ButtonIconLayout.center,
                          text: 'تحديد المدة',
                          textStyle:
                              AppTextTheme.mainButtonTextStyle().copyWith(
                            color: AppColor.primaryColor,
                          ),
                          onPressed: () {
                            showBlurBottomSheet(
                              context: context,
                              child: BookingCustomTimeBottomSheet(),
                            );
                          }),
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
                    icon: SvgPicture.asset(
                      AppImages.arrawButton,
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
