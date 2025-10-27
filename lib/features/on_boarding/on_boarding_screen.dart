import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smart_park_app/features/on_boarding/presentation/controller/on_boarding_controller.dart';
import '../../../core/image_string.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/app_splash_background.dart';
import '../../../core/widgets/custom_image_widget.dart';
import '../../../core/widgets/app_texticon_button.dart';
import '../../generated/l10n.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController();
    final images = [AImages.intro1, AImages.intro2, AImages.intro3];
    return Scaffold(
      body: AppSplashBackground(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 330.h,
                child: PageView.builder(
                  controller: controller,
                  itemCount: images.length,
                  onPageChanged: (index) =>
                      ref.read(onboardingProvider).nextPage(index),
                  itemBuilder: (_, index) => Center(
                    child: CustomImageWidget(
                      isFlag: true,
                      imageUrl: images[index],
                      width: 280.w,
                      height: 220.h,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              AppTextIconButton(
                text: S.of(context).skip,
                icon: Icons.arrow_back,
                onPressed: () {},
              ),

              SizedBox(height: 16.h),

              SmoothPageIndicator(
                controller: controller,
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
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
