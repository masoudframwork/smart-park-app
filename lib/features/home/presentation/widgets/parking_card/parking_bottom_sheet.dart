
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

class ParkingBottomSheet extends ConsumerStatefulWidget {
  const ParkingBottomSheet({super.key});

  @override
  ConsumerState<ParkingBottomSheet> createState() => _ParkingBottomSheetState();
}

class _ParkingBottomSheetState extends ConsumerState<ParkingBottomSheet> {
  double _bottomOffset = 0;
  bool _isAnimating = false;

  static const double _sheetHeightBase = 429;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(bottomSheetProvider);
    final isVisible = controller.isVisible;
    final parkingAreas = controller.parkingAreas;

    final double sheetHeight = _sheetHeightBase.h;

    if (!isVisible) {
      _bottomOffset = -sheetHeight;

      return Positioned(
        left: 0,
        right: 0,
        bottom: 0.h,
        child: GestureDetector(
          onTap: () {
            ref.read(bottomSheetProvider).show();
            _animateTo(target: 0);
          },
          child: Center(
            child: Container(
              width: 172.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: AppColor.blackColor,
                borderRadius: BorderRadius.circular(40.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.22),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: _bottomOffset,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (_isAnimating) return;

          setState(() {
            final dy = details.delta.dy;
            _bottomOffset = (_bottomOffset - dy).clamp(-sheetHeight, 0);
          });
        },
        onVerticalDragEnd: (details) {
          if (_isAnimating) return;

          final velocity = details.velocity.pixelsPerSecond.dy;
          const fastSwipeVelocity = 600;
          final halfPoint = -sheetHeight / 2;

          final shouldHide =
              velocity > fastSwipeVelocity || _bottomOffset < halfPoint;

          if (shouldHide) {
            _animateTo(
              target: -sheetHeight,
              onEnd: () {
                ref.read(bottomSheetProvider).hide();
              },
            );
          } else {
            _animateTo(
              target: 0,
              onEnd: () {
                ref.read(bottomSheetProvider).show();
              },
            );
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutBack,
          height: sheetHeight,
          decoration: BoxDecoration(
            color: AppColor.lightPurpleColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.blackColor.withOpacity(0.30),
                blurRadius: 14,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 172.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: AppColor.blackColor,
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                  ),
                ),

                SizedBox(height: 14.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.location2,
                      width: 48.w,
                      height: 48.w,
                    ),
                    SizedBox(width: 8.w),
                    AppText(
                      text: 'المواقف الأقرب إليك',
                      appTextTheme: AppTextTheme.bodyLargeTextStyle().copyWith(
                        color: AppColor.blackNumberSmallColor,
                      ),
                    ),
                  ],
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
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _animateTo({
    required double target,
    VoidCallback? onEnd,
  }) {
    setState(() {
      _isAnimating = true;
      _bottomOffset = target;
    });

    Future.delayed(const Duration(milliseconds: 220), () {
      if (!mounted) return;
      setState(() {
        _isAnimating = false;
      });
      if (onEnd != null) onEnd();
    });
  }
}


