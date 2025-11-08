import 'package:flutter/material.dart';

class CacheKeys {
  CacheKeys._internal();

  static final CacheKeys _instance = CacheKeys._internal();

  factory CacheKeys() => _instance;

  final String locale = 'locale';
  final String theme = 'theme';
//
  final String onboardingHidden = 'onboarding_hidden';

  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> homeNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> bookingNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> walletNavKey = GlobalKey<NavigatorState>();
}
