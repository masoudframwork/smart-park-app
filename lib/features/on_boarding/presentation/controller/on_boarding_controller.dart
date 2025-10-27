import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}
