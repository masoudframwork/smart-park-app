import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart/core/theme/app_color.dart';
import '../../../core/constants/image_string.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_image_widget.dart';
import '../../on_boarding/presentation/controller/onboarding_prefs_providers.dart';
import 'controller/splash_controller.dart';

const double _logoEndAlignmentY = -0.08;
const double _logoStartAlignmentY = -0.25;

// class SplashScreen extends ConsumerWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = ref.watch(splashControllerProvider);
//     final onboardingHiddenAsync = ref.watch(isOnboardingHiddenProvider);
//
//     ref.listen(splashControllerProvider, (_, next) {
//       if (next.isFinished && context.mounted) {
//         onboardingHiddenAsync.when(
//           data: (hidden) {
//             if (hidden) {
//               context.go(RoutePaths.bottomNavBar);
//             } else {
//               context.go(RoutePaths.onBoardingScreen);
//             }
//           },
//           loading: () {},
//           error: (_, __) {
//             context.go(RoutePaths.onBoardingScreen);
//           },
//         );
//       }
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: _SplashCardShape(
//           isAnimated: controller.isAnimated,
//         ),
//       ),
//     );
//   }
// }
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  void _tryNavigate(BuildContext context, WidgetRef ref) {
    if (!context.mounted) return;

    final alreadyNavigated = ref.read(splashNavigationDoneProvider);
    if (alreadyNavigated) return;

    final splashState = ref.read(splashControllerProvider);
    final onboardingHiddenAsync = ref.read(isOnboardingHiddenProvider);

    if (!splashState.isFinished) return;

    if (!onboardingHiddenAsync.hasValue) return;

    ref.read(splashNavigationDoneProvider.notifier).state = true;

    final hidden = onboardingHiddenAsync.value ?? false;

    if (hidden) {
      context.go(RoutePaths.bottomNavBar);
    } else {
      context.go(RoutePaths.onBoardingScreen);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(splashControllerProvider);

    // نسمع لتغيّر حالة السبلاش
    ref.listen(splashControllerProvider, (_, __) {
      _tryNavigate(context, ref);
    });

    // ونسمع برضه لتغيّر حالة الـ onboarding prefs
    ref.listen(isOnboardingHiddenProvider, (_, __) {
      _tryNavigate(context, ref);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _SplashCardShape(
          isAnimated: controller.isAnimated,
        ),
      ),
    );
  }
}

class _SplashCardShape extends StatelessWidget {
  final bool isAnimated;

  const _SplashCardShape({
    required this.isAnimated,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double cardHeight = size.height * 0.8;

    return Container(
      width: double.infinity,
      height: size.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
      ),
      child: Stack(
        children: [
          _AnimatedLogo(isAnimated: isAnimated),
          _AnimatedBottomWave(
            isAnimated: isAnimated,
            cardHeight: cardHeight,
          ),
        ],
      ),
    );
  }
}

class _AnimatedLogo extends StatelessWidget {
  final bool isAnimated;

  const _AnimatedLogo({
    required this.isAnimated,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutBack,
      alignment: isAnimated
          ? Alignment(0, _logoEndAlignmentY)
          : Alignment(0, _logoStartAlignmentY),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutBack,
        scale: isAnimated ? 1.0 : 0.2,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 600),
          opacity: isAnimated ? 1.0 : 0.0,
          child: Container(
            width: 147.w,
            height: 147.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipOval(
              child: CustomImageWidget(
                isFlag: true,
                imageUrl: AppImages.appLogo,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedBottomWave extends StatelessWidget {
  final bool isAnimated;
  final double cardHeight;

  const _AnimatedBottomWave({
    required this.isAnimated,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      left: 0,
      right: 0,
      bottom: isAnimated ? 0 : -cardHeight * 0.35,
      height: cardHeight * 0.30,
      child: ClipPath(
        clipper: _BottomWaveClipper(),
        child: Container(
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}

class _BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final double leftBaseY = size.height * 0.20;
    final double peakX = size.width * 0.17;
    final double peakY = size.height * 0.02;
    final double rightBaseY = size.height * 0.20;

    path.moveTo(0, size.height);
    path.lineTo(0, leftBaseY);
    path.lineTo(peakX, peakY);
    path.quadraticBezierTo(
      size.width * 0.60,
      size.height * 0.40,
      size.width,
      rightBaseY,
    );
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
