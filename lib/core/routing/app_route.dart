import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_park_app/core/routing/routes.dart';
import '../../features/on_boarding/on_boarding_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutePaths.splashScreen,
    routes: [
      GoRoute(
        path: RoutePaths.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: RoutePaths.onBoardingScreen,
        builder: (context, state) => OnBoardingScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
