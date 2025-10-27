import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_park_app/features/bottom_nav_bar/presentation/bottom_nav_bar_page.dart';
import '../../features/on_boarding/presentation/on_boarding_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._internal();

  static const String splashScreen = '/';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String bottomNavBar = '/bottomNavBar';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.bottomNavBar,
        builder: (context, state) => BottomNavBarPage(),
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
