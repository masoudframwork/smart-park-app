import 'package:aml_client/riverpod_exam/exam-screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/welcome_screen/presentation/onboarding/onboarding_screen.dart';
import '../../features/welcome_screen/presentation/splash/splash_screen.dart';


final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._internal();

  static const String splashScreen = '/';

  static const String onboardingScreen = '/onboardingScreen';
  static const String examScreen = '/examScreen';

}

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.onboardingScreen,
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(
        path: AppRoutes.examScreen,
        name: 'examScreen',
        builder: (context, state) => const ExamScreen(),
      ),


    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
