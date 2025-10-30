import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/features/details_reserve_parking_spot/booking_summary/presentation/widget/car_small_preview.dart';
import 'package:smart_park_app/features/details_reserve_parking_spot/booking_summary/presentation/widget/selection_tile.dart';
import 'package:smart_park_app/features/details_reserve_parking_spot/booking_summary/presentation/widget/visa_small_logo.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import '../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/primary_button.dart';
import '../../../../core/widgets/details_reserve_parking_widget/button_primary_total_bar_widhet/total_bar.dart';
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'ملخص الحجز',
                appTextTheme: AppTextTheme.titleLargeTextStyle(),
              ),
              SizedBox(height: 20.h),

              ZoneImageCard(),
              SizedBox(height: 12.h),

              ZoneHeader(
                zoneName: ' المنطقة 013',
                capacityText: '70/13',
                showDurationSection: false,
              ),
              SizedBox(height: 20.h),

              TimeRangeRow(
                start: state.start,
                end: state.end,
                onMinus: () => controller.decrementStart(15),
                onPlus: () => controller.incrementStart(15),
              ),

              SizedBox(height: 12.h),

              const SelectionTile(
                leadingIcon: Icons.chevron_right_outlined,
                title: 'نيسان باتفايندر / 2023 / أسود',
                trailingImage: CarSmallPreview(),
              ),
              SizedBox(height: 12.h),

              const SelectionTile(
                leadingIcon: Icons.chevron_right_outlined,
                title: 'البطاقة المنتهية بـ 0000',
                trailingImage: VisaSmallLogo(),
              ),

              SizedBox(height: 50.h),

              TotalBar(
                total: state.total,
                label: 'الإجمالي',
              ),

              SizedBox(height: 12.h),

              PrimaryButton(
                text: 'تأكيد الحجز',
                onPressed: () {},
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
