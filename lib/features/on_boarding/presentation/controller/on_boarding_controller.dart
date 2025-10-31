import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/core/routing/navigation_service.dart';
import 'package:smart/core/routing/routes.dart';

final onboardingProvider =
    ChangeNotifierProvider.autoDispose<OnboardingController>(
  (ref) => OnboardingController(),
);

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void nextPage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onSkipPressed() {
    NavigationService.go(RoutePaths.bottomNavBar);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
