import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/splash_state.dart';

class SplashController extends StateNotifier<SplashState> {
  SplashController() : super(SplashState.initial());

  late AnimationController fadeController;
  late AnimationController scaleController;
  late AnimationController slideController;

  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;

  void initAnimations(TickerProvider ticker) {
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: ticker,
    );

    scaleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: ticker,
    );

    slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: ticker,
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeInOut));

    scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: slideController, curve: Curves.easeOutBack),
        );
  }

  Future<void> startSequence(VoidCallback onComplete) async {
    fadeController.forward();
    scaleController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    slideController.forward();

    await Future.delayed(const Duration(milliseconds: 1000));
    state = state.copyWith(
      showProgress: true,
      loadingText: 'Loading security protocols...',
    );

    await Future.delayed(const Duration(milliseconds: 1200));
    state = state.copyWith(loadingText: 'Preparing compliance dashboard...');

    await Future.delayed(const Duration(milliseconds: 1000));
    state = state.copyWith(loadingText: 'Ready to secure your transactions');

    await Future.delayed(const Duration(milliseconds: 800));
    onComplete();
  }






  @override
  void dispose() {
    fadeController.dispose();
    scaleController.dispose();
    slideController.dispose();
    super.dispose();
  }
}
