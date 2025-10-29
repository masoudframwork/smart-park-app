import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_park_app/core/constants/image_string.dart';

import 'package:smart_park_app/core/theme/app_text_theme.dart';
import 'package:smart_park_app/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smart_park_app/features/on_boarding/presentation/controller/on_boarding_controller.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_image_widget.dart';
import '../../../core/widgets/app_texticon_button.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final images = [AppImages.intro1, AppImages.intro2, AppImages.intro3];
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 393.w,
              height: 580.h,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                onPageChanged: (index) =>
                    ref.read(onboardingProvider).nextPage(index),
                itemBuilder: (_, index) => Center(
                  child: CustomImageWidget(
                    isFlag: true,
                    imageUrl: images[index],
                    width: 393.w,
                    height: 580.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            AppTextIconButton(
              text: S.of(context).skip,
              icon: Icons.arrow_back,
              onPressed: () {
                ref.read(onboardingProvider).onSkipPressed();
              },
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: ExpandingDotsEffect(
                expansionFactor: 2,
                spacing: 6.w,
                radius: 11.r,
                dotHeight: 10.h,
                dotWidth: 18.w,
                activeDotColor: AppColor.yellowContainerColor,
                dotColor: AppColor.yellowContainerColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: false,
                  onChanged: null,
                  inactiveThumbColor: AppColor.whiteColor,
                  inactiveTrackColor: AppColor.greyContainerColor,
                  trackOutlineColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                  trackOutlineWidth: WidgetStateProperty.all(0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(width: 12.w),
                AppText(
                  text: S.of(context).doNotDisplayInstructionsAgain,
                  appTextTheme: AppTextTheme.titleMediumTextStyle().copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
