import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/theme/app_color.dart';
import 'package:smart_park_app/core/theme/app_text_theme.dart';
import 'package:smart_park_app/core/widgets/app_text.dart';
import '../../../../../core/constants/image_string.dart';
import '../../../../../core/widgets/svg_image_widget.dart';
import '../../controller/bottom_sheet_controller.dart';
import 'parking_card.dart';

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

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 10) {
            ref.read(bottomSheetProvider).hide();
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          decoration: BoxDecoration(
            color: AppColor.lightPurpleColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 12.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColor.greyContainerColor,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                spacing: 13.w,
                children: [
                  SvgImageWidget(
                    AppImages.timeStop,
                    width: 28.1.w,
                    height: 28.1.w,
                  ),
                  AppText(
                    text: 'مدة الوقوف',
                    appTextTheme: AppTextTheme.bodyLargeTextStyle()
                        .copyWith(color: AppColor.blackNumberSmallColor),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double sliderValue = 40;
                  

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 35.h), // Space for text above
                            SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 5.h,
                                activeTrackColor: AppColor.primaryColor,
                                inactiveTrackColor: AppColor.greyContainerColor,
                                thumbColor: AppColor.primaryColor,
                                thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.r,
                                ),
                                overlayShape: RoundSliderOverlayShape(
                                  overlayRadius: 20.r,
                                ),
                                trackShape: RoundedRectSliderTrackShape(),
                              ),
                              child: Slider(
                                value: sliderValue,
                                min: 0,
                                max: 60,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: sliderValue + 58.w,
                          top: 0,
                          child: Column(
                            children: [
                              AppText(
                                text: sliderValue.toInt().toString(),
                                appTextTheme:
                                    AppTextTheme.numberSmallTextStyle()
                                        .copyWith(
                                            fontSize: 16,
                                            color: AppColor.blackColor,
                                            fontWeight: FontWeight.w600),
                              ),
                              AppText(
                                text: 'دقائق',
                                appTextTheme:
                                    AppTextTheme.bodySmallTextStyle().copyWith(
                                  color: AppColor.greyColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'IBM Plex Sans Arabic',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 330.h, 
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  itemCount: parkingAreas.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    return ParkingCard(parkingArea: parkingAreas[index]);
                  },
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}