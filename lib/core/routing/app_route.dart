import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart/core/routing/navigation_service.dart';
import 'package:smart/core/routing/routes.dart';

import 'package:smart/features/bottom_nav_bar/presentation/bottom_nav_bar_page.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_summary/presentation/booking_summary.dart';
import 'package:smart/features/details_reserve_parking_spot/duration/presentation/duration_screen.dart';
import 'package:smart/features/details_reserve_parking_spot/payment/presentation/payment_screen.dart';
import 'package:smart/features/details_reserve_parking_spot/the_vehicle/persentation/the_vehicle_screen.dart';
import 'package:smart/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:smart/features/splash/presentation/splash_screen.dart';

import '../../features/auth/login/presentation/login_page.dart';
import '../../features/auth/send_the_code/presentation/send_the_code_page.dart';
import '../../features/home/presentation/widgets/voice_to_text/voice_to_text_screen.dart';
import '../helpers/soft_transition_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutePaths.splashScreen,
    routes: [
      GoRoute(
        path: RoutePaths.splashScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.onBoardingScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: OnBoardingScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.bottomNavBar,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: BottomNavBarPage(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.durationScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: DurationScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.theVehicleScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: TheVehicleScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.paymentScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: PaymentScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.bookingSummary,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: BookingSummary(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.voiceToTextScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: VoiceToTextScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.loginPage,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: LoginPage(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.sendTheCodePage,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: SendTheCodePage(),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return softTransitionPage(
        child: const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
    },
  );

  static void initialize() {
    NavigationService.initialize(router);
  }
}
