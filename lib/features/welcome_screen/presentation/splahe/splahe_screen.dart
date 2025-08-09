import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_color.dart';
import '../controller/splahe_controller.dart';
import '../provider/splash_provider.dart';
import 'widget/logo_widget.dart';
import 'widget/loading_indicator_widget.dart';
import 'widget/footer_info_widget.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late SplashController controller;

  @override
  void initState() {
    super.initState();
    controller = ref.read(splashProvider.notifier);
    controller.initAnimations(this);
    controller.startSequence(() {
      context.go('/onboardingScreen');

    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashProvider);
    return Scaffold(
      backgroundColor: AppColor.primaryBlue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.primaryBlue,
              AppColor.lightBlue,
              AppColor.primaryBlue.withOpacity(0.8),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),

              LogoWidget(
                fadeAnimation: controller.fadeAnimation,
                scaleAnimation: controller.scaleAnimation,
                slideAnimation: controller.slideAnimation,
              ),

              const Spacer(flex: 5),
              if (state.showProgress)
                LoadingIndicatorWidget(text: state.loadingText),
              const Spacer(flex: 3),
              SizedBox(height: 4.h),
              FadeTransition(
                opacity: controller.fadeAnimation,
                child: const FooterInfoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


