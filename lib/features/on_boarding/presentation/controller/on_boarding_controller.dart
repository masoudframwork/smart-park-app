import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/routing/app_route.dart';
import '../../../../core/routing/navigation_service.dart';

final onboardingProvider =
    ChangeNotifierProvider.autoDispose<OnboardingController>(
  (ref) => OnboardingController(),
);

class OnboardingController extends ChangeNotifier {
  int currentIndex = 0;

  void nextPage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onSkipPressed() {
    NavigationService.go(AppRoutes.bottomNavBar);
  }
}
