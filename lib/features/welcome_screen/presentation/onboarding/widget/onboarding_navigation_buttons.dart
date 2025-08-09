import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../provider/onboarding_prvovider.dart';

class OnboardingNavigationButtons extends ConsumerWidget {
  final bool isArabic;
  final int currentIndex;
  final int totalPages;
  final VoidCallback onSkip;

  const OnboardingNavigationButtons({
    super.key,
    required this.isArabic,
    required this.currentIndex,
    required this.totalPages,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(onboardingControllerProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentIndex > 0)
          SizedBox(
            width: 140.w,
            child: OutlinedButton(
              onPressed: controller.previousPage,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                side: BorderSide(color: AppColor.primaryBlue),
              ),
              child: Text(
                isArabic ? 'السابق' : 'Previous',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColor.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        if (currentIndex > 0) SizedBox(width: 10.w),
        SizedBox(
          width: 140.w,
          child: ElevatedButton(
            onPressed: () {
              if (currentIndex == totalPages - 1) {
                onSkip();
              } else {
                controller.nextPage();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryBlue,
              foregroundColor: AppColor.pureWhite,
              padding: EdgeInsets.symmetric(vertical: 2.h),
            ),
            child: Text(
              currentIndex == totalPages - 1
                  ? (isArabic ? 'ابدأ الآن' : 'Get Started')
                  : (isArabic ? 'التالي' : 'Next'),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.pureWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
