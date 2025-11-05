import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/on_boarding/presentation/widget/hide_tips_switch.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../core/constants/image_string.dart';
import '../../../core/widgets/app_texticon_button.dart';
import 'controller/on_boarding_controller.dart';

// class OnBoardingScreen extends ConsumerWidget {
//   const OnBoardingScreen({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(onboardingControllerProvider);
//     final notifier = ref.read(onboardingControllerProvider.notifier);
//     final images = [
//       AppImages.intro1,
//       AppImages.intro2,
//       AppImages.intro3,
//     ];
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: AppColor.whiteColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height:40.h,
//               ),
//
//               SizedBox(
//                 width: screenWidth,
//                 height: 580.h,
//                 child: PageView.builder(
//                   controller: notifier.pageController,
//                   itemCount: images.length,
//                   onPageChanged: notifier.onPageChanged,
//                   physics: const ClampingScrollPhysics(),
//                   itemBuilder: (_, index) {
//                     return CustomImageWidget(
//                       isFlag: true,
//                       imageUrl: images[index],
//                       width: screenWidth,
//                       height: 580.h,
//                       fit: BoxFit.cover,
//                     );
//                   },
//                 ),
//               ),
//
//               AppTextIconButton(
//                 text: state.currentIndex == images.length - 1
//                     ? S.of(context).skip
//                     : S.of(context).skip,
//                 icon: Icons.arrow_back,
//                 onPressed: notifier.onSkipPressed,
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//               SmoothPageIndicator(
//                 controller: notifier.pageController,
//                 count: images.length,
//                 effect: ExpandingDotsEffect(
//                   expansionFactor: 2,
//                   spacing: 6.w,
//                   radius: 11.r,
//                   dotHeight: 10.h,
//                   dotWidth: 18.w,
//                   activeDotColor: AppColor.yellowContainerColor,
//                   dotColor: AppColor.yellowContainerColor,
//                 ),
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//               HideTipsSwitch(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    final notifier = ref.read(onboardingControllerProvider.notifier);
    final images = [
      AppImages.intro1,
      AppImages.intro2,
      AppImages.intro3,
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),

                SizedBox(
                  width: screenWidth,
                  height: 580.h,
                  child: PageView.builder(
                    controller: notifier.pageController,
                    itemCount: images.length,
                    onPageChanged: notifier.onPageChanged,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return Center(
                        child: CustomImageWidget(
                          isFlag: true,
                          imageUrl: images[index],
                          width: screenWidth,
                          height: 580.h,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),

                AppTextIconButton(
                  text: state.currentIndex == images.length - 1
                      ? S.of(context).skip
                      : S.of(context).skip,
                  icon: Icons.arrow_back,
                  onPressed: notifier.onSkipPressed,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SmoothPageIndicator(
                  controller: notifier.pageController,
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
                SizedBox(
                  height: 20.h,
                ),
                HideTipsSwitch(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}