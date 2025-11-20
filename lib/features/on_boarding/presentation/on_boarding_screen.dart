import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/image_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../core/widgets/custom_image_widget.dart';
import 'controller/on_boarding_controller.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/features/on_boarding/presentation/widget/title_subtitle_widget.dart';
class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    final notifier = ref.read(onboardingControllerProvider.notifier);

    Color shadow(double o) => AppColor.blackColor.withOpacity(o);

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: notifier.pageController,
              itemCount: state.items.length,
              onPageChanged: notifier.onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final item = state.items[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(item.bgImage, fit: BoxFit.cover),
                    _EdgeFade(edge: Edge.top, size: 180.h, start: shadow(0.65)),
                    _EdgeFade(
                        edge: Edge.bottom, size: 220.h, start: shadow(0.70)),
                    _EdgeFade(edge: Edge.left, size: 90, start: shadow(0.55)),
                    _EdgeFade(edge: Edge.right, size: 90, start: shadow(0.55)),
                    TitleSubtitleWidget(
                      iconPath: item.icon,
                      isIconSvg: true,
                      title: item.title,
                      subtitle: item.subtitle,
                    ),
                  ],
                );
              },
            ),
            Positioned(
              top: 38,
              left: 28,
              child: GestureDetector(
                onTap: notifier.onSkip,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      text: 'تخطي',
                      appTextTheme:
                          AppTextTheme.titleMediumTextStyle().copyWith(
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    const CustomImageWidget(
                      isFlag: true,
                      imageUrl: AppImages.arrowIcon,
                      width: 20,
                      height: 20,
                      color: AppColor.whiteColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: state.currentIndex,
                  count: state.items.length,
                  effect: dotsEffect,
                ),
              ),
            ),
            _ArrowButton(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 24, bottom: 32),
              asset: AppImages.iconArrawIntro1,
              onTap: notifier.next,
            ),
            if (state.currentIndex > 0)
              _ArrowButton(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(right: 24, bottom: 32),
                asset: AppImages.iconArrawBackIntro1,
                onTap: notifier.prev,
              ),
          ],
        ),
      ),
    );
  }

  static const dotsEffect = ExpandingDotsEffect(
    expansionFactor: 2.2,
    spacing: 4,
    radius: 4,
    dotHeight: 8,
    dotWidth: 13,
    dotColor: AppColor.whiteColor,
    activeDotColor: AppColor.whiteColor,
  );
}
enum Edge { top, bottom, left, right }

class _EdgeFade extends StatelessWidget {
  const _EdgeFade({
    required this.edge,
    required this.size,
    required this.start,
  });

  final Edge edge;
  final double size;
  final Color start;

  @override
  Widget build(BuildContext context) {
    switch (edge) {
      case Edge.top:
        return Positioned.fill(
          child: IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [start, start.withOpacity(0)],
                  ),
                ),
              ),
            ),
          ),
        );
      case Edge.bottom:
        return Positioned.fill(
          child: IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [start, start.withOpacity(0)],
                  ),
                ),
              ),
            ),
          ),
        );
      case Edge.left:
        return Positioned.fill(
          child: IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [start, start.withOpacity(0)],
                  ),
                ),
              ),
            ),
          ),
        );
      case Edge.right:
        return Positioned.fill(
          child: IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: size,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [start, start.withOpacity(0)],
                  ),
                ),
              ),
            ),
          ),
        );
    }
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({
    required this.alignment,
    required this.margin,
    required this.asset,
    required this.onTap,
  });

  final Alignment alignment;
  final EdgeInsets margin;
  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: margin,
          child: GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(asset),
          ),
        ),
      ),
    );
  }
}
