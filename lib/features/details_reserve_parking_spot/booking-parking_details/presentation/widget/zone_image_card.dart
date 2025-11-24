import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/image_string.dart';
import '../../../../../core/routing/navigation_service.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../generated/l10n.dart';
import '../controler/zone_image_controller.dart';

class ZoneImageCard extends ConsumerWidget {
  const ZoneImageCard({
    super.key,
    this.isAvailable = true,
  });

  final bool isAvailable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(zonePageControllerProvider);
    final images = ref.watch(zoneImagesProvider);
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return AspectRatio(
      aspectRatio: 22 / 9,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return _ImageWithStatusBadge(
                imageUrl: images[index],
                isAvailable: isAvailable,
              );
            },
          ),
          Align(
            alignment: isRtl ? Alignment.topLeft : Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(17.h),
              child: _NextArrowButton(
                onTap: () {
                  NavigationService.pop();
                },
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: ExpandingDotsEffect(
                expansionFactor: 2,
                spacing: 4.w,
                radius: 9.r,
                dotHeight: 6.h,
                dotWidth: 10.w,
                activeDotColor: AppColor.whiteColor,
                dotColor: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageWithStatusBadge extends StatelessWidget {
  const _ImageWithStatusBadge({
    required this.imageUrl,
    required this.isAvailable,
  });

  final String imageUrl;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    final Color statusColor =
        isAvailable ? AppColor.greenTextColor : AppColor.primaryColor;
    final String statusText =
        isAvailable ? S.of(context).availablenow : S.of(context).notavailable;
    final IconData statusIcon =
        isAvailable ? Icons.check_circle_outline : Icons.cancel;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.h,
          right: isRtl ? 8.w : null,
          left: isRtl ? null : 8.w,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: AppColor.containerColor,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                BoxShadow(
                  color: AppColor.blackColor.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  statusIcon,
                  color: statusColor,
                  size: 16.sp,
                ),
                SizedBox(width: 4.w),
                AppText(
                  text: statusText,
                  appTextTheme: AppTextTheme.bodySmallTextStyle()
                      .copyWith(color: statusColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _NextArrowButton extends StatelessWidget {
  const _NextArrowButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Align(
      alignment: isRtl ? Alignment.topRight : Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          NavigationService.pop();
        },
        child: Container(
          width: 34.w,
          height: 34.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppColor.contanearGreyColor,
              width: 1,
            ),
          ),
          child: SvgPicture.asset(
            isRtl ? AppImages.arrowIcon2 : AppImages.arrowIcon,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
