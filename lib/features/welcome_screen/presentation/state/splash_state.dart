import 'package:flutter/animation.dart';

class SplashState {
  final bool showProgress;
  final String loadingText;
  final Animation<double>? fadeAnimation;
  final Animation<double>? scaleAnimation;
  final Animation<Offset>? slideAnimation;

  const SplashState({
    this.showProgress = false,
    this.loadingText = '',
    this.fadeAnimation,
    this.scaleAnimation,
    this.slideAnimation,
  });

  SplashState copyWith({
    bool? showProgress,
    String? loadingText,
    Animation<double>? fadeAnimation,
    Animation<double>? scaleAnimation,
    Animation<Offset>? slideAnimation,
  }) {
    return SplashState(
      showProgress: showProgress ?? this.showProgress,
      loadingText: loadingText ?? this.loadingText,
      fadeAnimation: fadeAnimation ?? this.fadeAnimation,
      scaleAnimation: scaleAnimation ?? this.scaleAnimation,
      slideAnimation: slideAnimation ?? this.slideAnimation,
    );
  }

  factory SplashState.initial() => const SplashState();
}
