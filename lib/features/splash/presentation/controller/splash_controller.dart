import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

final splashControllerProvider = ChangeNotifierProvider.autoDispose(
      (ref) => SplashController(),
);

class SplashController extends ChangeNotifier {
  bool _isAnimated = false;
  bool _isFinished = false;

  bool get isAnimated => _isAnimated;
  bool get isFinished => _isFinished;

  SplashController() {
    _startAnimation();
    _navigateAfterDelay();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _isAnimated = true;
      notifyListeners();
    });
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    _isFinished = true;
    notifyListeners();
  }
}
