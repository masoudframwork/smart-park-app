import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import '../../../../../core/constants/image_string.dart';
import '../../controller/bottom_sheet_controller.dart';
import 'parking_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ParkingBottomSheet extends ConsumerWidget {
  const ParkingBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(bottomSheetProvider.select((c) => c.isVisible));

    if (!isVisible) {
      return Positioned(
        bottom: 24.h,
        right: 16.w,
        child: FloatingActionButton(
          onPressed: () => ref.read(bottomSheetProvider).show(),
          backgroundColor: AppColor.primaryColor,
          child:
              Icon(Icons.info_outline, color: AppColor.whiteColor, size: 28.w),
        ),
      );
    }

    final parkingAreas = ref.read(bottomSheetProvider).parkingAreas;

    final hours = ref.watch(parkingDurationProvider);

    return Positioned.fill(
      child: GestureDetector(
        onTap: () => ref.read(bottomSheetProvider).hide(),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity != null &&
                    details.primaryVelocity! > 200) {
                  ref.read(bottomSheetProvider).hide();
                }
              },
              child: Container(
                height: 454.h,
                decoration: BoxDecoration(
                  color: AppColor.lightPurpleColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blackColor.withOpacity(0.30),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 172.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF000000),
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppImages.time,
                            width: 28.1.w,
                            height: 28.1.w,
                          ),
                          SizedBox(width: 10.w),
                          AppText(
                            text: 'مدة الوقوف',
                            appTextTheme:
                                AppTextTheme.bodyLargeTextStyle().copyWith(
                              color: AppColor.blackNumberSmallColor,
                            ),
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      _HoursSliderSynced(
                        value: hours,
                        min: 1,
                        max: 12,
                        divisions: 11,
                        unitTextBuilder: _arabicHoursUnit,
                        onChanged: (v) =>
                            ref.read(parkingDurationProvider.notifier).set(v),
                      ),
                      SizedBox(height: 20.h),
                      Expanded(
                        child: ListView.separated(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          itemCount: parkingAreas.length,
                          separatorBuilder: (_, __) => SizedBox(width: 20.w),
                          itemBuilder: (context, i) =>
                              ParkingCard(parkingArea: parkingAreas[i]),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HoursSliderSynced extends StatelessWidget {
  const _HoursSliderSynced({
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.divisions,
    this.unitTextBuilder,
  });

  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final int? divisions;
  final String Function(int hours)? unitTextBuilder;

  @override
  Widget build(BuildContext context) {
    const double thumbRadius = 12.0;
    const double thumbDiameter = thumbRadius * 2;

    final double labelWidth = 33.w;
    final double labelTop = -40.h;

    final isRTL = Directionality.of(context) == TextDirection.rtl;

    final valueInt = value.toInt();
    final bool isSix = valueInt == 6;
    final double raiseForSix = 5;
    return LayoutBuilder(
      builder: (context, constraints) {
        final trackWidth = constraints.maxWidth;

        double t = ((value - min) / (max - min)).clamp(0.0, 1.0);
        final effectiveT = isRTL ? (1.0 - t) : t;

        final available = trackWidth - thumbDiameter;
        final thumbCenterX = effectiveT * available + (thumbDiameter / 2);

        final left = (thumbCenterX - (labelWidth / 2))
            .clamp(0.0, trackWidth - labelWidth);

        return Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 50),
              curve: Curves.linear,
              left: left,
              top: isSix ? (labelTop - raiseForSix) : labelTop,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    text: value.toInt().toString(),
                    appTextTheme: AppTextTheme.numberSmallTextStyle().copyWith(
                      fontSize: 16,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppText(
                    text: (unitTextBuilder ?? _arabicHoursUnit)(value.toInt()),
                    appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                      color: AppColor.greyColor,
                      fontSize: 10,
                      fontFamily: 'IBM Plex Sans Arabic',
                    ),
                  ),
                ],
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: AppColor.primaryColor,
                inactiveTrackColor: AppColor.whiteColor,
                thumbColor: AppColor.primaryColor,
                trackHeight: 7.0,
                trackShape: RectangularSliderTrackShape(),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                tickMarkShape: SliderTickMarkShape.noTickMark,
                padding: EdgeInsets.zero,
              ),
              child: Slider(
                value: value,
                min: min,
                max: max,
                divisions: divisions,
                onChanged: (v) => onChanged(v.roundToDouble()),
              ),
            ),
          ],
        );
      },
    );
  }
}

String _arabicHoursUnit(int h) {
  if (h == 1) return 'ساعة';
  if (h == 2) return 'ساعتان';
  if (h >= 3 && h <= 10) return 'ساعات';
  return 'ساعة';
}

final parkingDurationProvider =
    StateNotifierProvider<ParkingDurationController, double>(
  (ref) => ParkingDurationController(),
);

class ParkingDurationController extends StateNotifier<double> {
  ParkingDurationController() : super(6);
  void set(double v) => state = v;
}
