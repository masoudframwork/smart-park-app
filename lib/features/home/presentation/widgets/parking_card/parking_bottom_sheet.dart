import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/theme/app_color.dart';
import 'package:smart_park_app/core/theme/app_text_theme.dart';
import 'package:smart_park_app/core/widgets/app_text.dart';
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
              AppText(
                text: 'مدة الوقوف',
                appTextTheme: AppTextTheme.titleMediumTextStyle(),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: '5',
                          appTextTheme: AppTextTheme.numberSmallTextStyle(),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 12.w,
                              height: 12.h,
                              decoration: const BoxDecoration(
                                color: AppColor.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            AppText(
                              text: 'دقيقة',
                              appTextTheme: AppTextTheme.bodySmallTextStyle()
                                  .copyWith(color: AppColor.greyColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: LinearProgressIndicator(
                        value: 0.3,
                        backgroundColor: AppColor.greyContainerColor,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColor.primaryColor),
                        minHeight: 8.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ParkingCard(
                  parkingArea:
                      ref.read(bottomSheetProvider).parkingAreas.first),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
