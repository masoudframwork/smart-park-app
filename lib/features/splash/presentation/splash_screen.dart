import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/image_string.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_splash_background.dart';
import '../../../core/widgets/custom_image_widget.dart';
import '../../on_boarding/presentation/controller/onboarding_prefs_providers.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(splashControllerProvider);
    final onboardingHiddenAsync = ref.watch(isOnboardingHiddenProvider);

    ref.listen(splashControllerProvider, (_, next) {
      if (next.isFinished && context.mounted) {
        onboardingHiddenAsync.when(
          data: (hidden) {
            if (hidden) {
              context.go(RoutePaths.bottomNavBar);
            } else {
              context.go(RoutePaths.onBoardingScreen);
            }
          },
          loading: () {},
          error: (_, __) {
            context.go(RoutePaths.onBoardingScreen);
          },
        );
      }
    });

    return Scaffold(
      body: AppSplashBackground(
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: controller.isAnimated ? 1 : 0,
            curve: Curves.easeInOut,
            child: AnimatedScale(
              duration: const Duration(seconds: 2),
              scale: controller.isAnimated ? 1.0 : 0.6,
              curve: Curves.elasticOut,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 1500),
                offset:
                    controller.isAnimated ? Offset.zero : const Offset(0, 1),
                curve: Curves.easeOutBack,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageWidget(
                      isFlag: true,
                      imageUrl: AppImages.appLogo,
                      width: 134,
                      height: 93.08,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
