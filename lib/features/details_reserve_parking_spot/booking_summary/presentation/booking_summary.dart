import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/car_small_preview.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/change_payment_method_bottom_sheet.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/change_vehicle_dialog_widget.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/selection_tile.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/widget/visa_small_logo.dart';
import '../../../../core/helpers/show_change_vehicle_dialog.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/container_total_bar/total_bar.dart';
import '../../../../core/widgets/details_reserve_parking_widget/time_range_row.dart';
import '../../../../core/widgets/details_reserve_parking_widget/zone_header.dart';
import '../../../../core/widgets/details_reserve_parking_widget/zone_image_card_widget.dart';
import 'controller/booking_summary.dart';

class BookingSummary extends ConsumerWidget {
  const BookingSummary({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingSummaryControllerProvider);
    final controller = ref.read(bookingSummaryControllerProvider.notifier);

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
                    spacing: 15.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'ملخص الحجز',
                        appTextTheme: AppTextTheme.titleLargeTextStyle()
                            .copyWith(color: AppColor.blackNumberSmallColor),
                      ),
                      ZoneImageCard(),
                      ZoneHeader(
                        zoneName: ' المنطقة 013',
                        capacityText: '70/13',
                        showDurationSection: false,
                      ),
                      TimeRangeRow(
                        start: state.start,
                        end: state.end,
                        onStartMinus: () => controller.decrementStart(15),
                        onStartPlus: () => controller.incrementStart(15),
                        onEndMinus: () => controller.decrementEnd(15),
                        onEndPlus: () => controller.incrementEnd(15),
                      ),
                      GestureDetector(
                        onTap: () {
                          showBlurBottomSheet(
                            context: context,
                            child: ChangeVehicleBottomSheet(),
                          );
                        },
                        child: SelectionTile(
                          leadingIcon: Icons.chevron_right_outlined,
                          title: 'نيسان باتفايندر / 2023 / أسود',
                          trailingImage: CarSmallPreview(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showBlurBottomSheet(
                            context: context,
                            child: ChangePaymentMethodBottomSheet(),
                          );
                        },
                        child: const SelectionTile(
                          leadingIcon: Icons.chevron_right_outlined,
                          title: 'البطاقة المنتهية بـ 0000',
                          trailingImage: VisaSmallLogo(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TotalBar(
                total: state.total,
                label: 'الإجمالي',
              ),
              SizedBox(height: 12.h),
              CustomButtonWidget(
                text: 'تأكيد الحجز',
                onPressed: () {},
                icon: Image.asset(
                  AppImages.arrowIcon,
                  width: 21.w,
                  height: 21.w,
                  color: AppColor.whiteColor,
                ),
                iconLayout: ButtonIconLayout.inline,
                iconOnRight: true,
                verticalPadding: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
