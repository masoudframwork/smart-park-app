import 'package:flutter/material.dart';

//Splash State
class SplashState {
  final double fadeValue;
  final double scaleValue;
  final double slideValue;
  final bool showProgress;
  final String loadingText;
  final bool navigateNext;

  const SplashState({
    this.fadeValue = 0.0,
    this.scaleValue = 0.7,
    this.slideValue = 0.3,
    this.showProgress = false,
    this.loadingText = '',
    this.navigateNext = false,
  });

  SplashState copyWith({
    double? fadeValue,
    double? scaleValue,
    double? slideValue,
    bool? showProgress,
    String? loadingText,
    bool? navigateNext,
  }) {
    return SplashState(
      fadeValue: fadeValue ?? this.fadeValue,
      scaleValue: scaleValue ?? this.scaleValue,
      slideValue: slideValue ?? this.slideValue,
      showProgress: showProgress ?? this.showProgress,
      loadingText: loadingText ?? this.loadingText,
      navigateNext: navigateNext ?? this.navigateNext,
    );
  }
}

// Intro Page Model
class IntroPage {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  String? imageUrl;

  IntroPage({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    this.imageUrl,
  });
}

// IntroState
class IntroWalkthroughState {
  final List<IntroPage> pages;
  final int currentPage;
  final String currentLanguage;

  IntroWalkthroughState({
    this.pages = const [],
    this.currentPage = 0,
    this.currentLanguage = 'English',
  });

  IntroWalkthroughState copyWith({
    List<IntroPage>? pages,
    int? currentPage,
    String? currentLanguage,
  }) {
    return IntroWalkthroughState(
      pages: pages ?? this.pages,
      currentPage: currentPage ?? this.currentPage,
      currentLanguage: currentLanguage ?? this.currentLanguage,
    );
  }
}
