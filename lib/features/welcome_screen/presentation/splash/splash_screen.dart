import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_color.dart';
import '../../domain/splash_notifier.dart';
import 'widget/logo_widget.dart';
import 'widget/loading_indicator_widget.dart';
import 'widget/footer_info_widget.dart';
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(splashNotifierProvider);
    if (state.navigateNext) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.goNamed('onboarding');
      });
    }
    return Scaffold(
      backgroundColor: AppColor.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 1),
            LogoWidget(
              fadeValue: state.fadeValue,
              scaleValue: state.scaleValue,
              slideValue: state.slideValue,
            ),
            const Spacer(flex: 5),
            if (state.showProgress)
              LoadingIndicatorWidget(text: state.loadingText),
            const Spacer(flex: 3),
            Opacity(opacity: state.fadeValue, child: const FooterInfoWidget()),
          ],
        ),
      ),
    );
  }
}
