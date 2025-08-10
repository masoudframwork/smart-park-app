import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../domain/splash_notifier.dart';


class NavigationButtons extends ConsumerWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final PageController pageController;

  const NavigationButtons({
    super.key,
    required this.onSkip,
    required this.onNext,
    required this.onPrevious,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(introWalkthroughControllerProvider);
    final isFirstPage = state.currentPage == 0;
    final isLastPage = state.currentPage == state.pages.length - 1;

    return Padding(
      padding: EdgeInsets.all(6.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: SmoothPageIndicator(
              controller: pageController,
              count: state.pages.length,
              effect:ExpandingDotsEffect(
                activeDotColor: AppColor.primaryBlue,
                     dotColor: AppColor.neutralLight,
                dotHeight: 8,
                     dotWidth: 12,
              ),
            ),
          ),

          SizedBox(height: 8.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isFirstPage)
                SizedBox(
                  width: 150.w,
                  child: OutlinedButton(
                    onPressed: onPrevious,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      side: BorderSide(color: AppColor.primaryBlue),
                    ),
                    child: Text(
                       ('Previous'),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColor.primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

              if (!isFirstPage) SizedBox(width: 4.w),

              SizedBox(
                width: 150.w,
                child: ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryBlue,
                    foregroundColor: AppColor.pureWhite,
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                  ),
                  child: Text(
                    isLastPage
                        ? ( 'Get Started')
                        : ( 'Next'),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColor.pureWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
