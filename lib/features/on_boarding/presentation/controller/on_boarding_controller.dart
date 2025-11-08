import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../domain/models/onboarding_state.dart';

final onboardingControllerProvider =
    AutoDisposeNotifierProvider<OnboardingController, OnboardingState>(
  OnboardingController.new,
);

class OnboardingController extends AutoDisposeNotifier<OnboardingState> {
  late final PageController pageController;

  @override
  OnboardingState build() {
    pageController = PageController();

    ref.onDispose(() {
      pageController.dispose();
    });

    return OnboardingState(currentIndex: 0);
  }

  void onPageChanged(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void onSkipPressed() {
    NavigationService.go(RoutePaths.bottomNavBar);
  }
}
