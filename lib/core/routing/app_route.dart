import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_park_app/core/routing/navigation_service.dart';
import 'package:smart_park_app/core/routing/routes.dart';
import 'package:smart_park_app/features/bottom_nav_bar/presentation/bottom_nav_bar_page.dart';
import '../../features/details_reserve_parking_spot/booking_summary/presentation/booking_summary.dart';
import '../../features/details_reserve_parking_spot/duration/presentation/duration_screen.dart';
import '../../features/details_reserve_parking_spot/payment/presentation/payment_screen.dart';
import '../../features/details_reserve_parking_spot/the_vehicle/persentation/the_vehicle_screen.dart';
import '../../features/on_boarding/presentation/on_boarding_screen.dart';
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
      GoRoute(
        path: RoutePaths.bottomNavBar,
        builder: (context, state) => BottomNavBarPage(),
      ),
      GoRoute(
        path: RoutePaths.durationScreen,
        builder: (context, state) => DurationScreen(),
      ),

      GoRoute(
        path: RoutePaths.theVehicleScreen,
        builder: (context, state) => TheVehicleScreen(),
      ),
      GoRoute(
        path: RoutePaths.paymentScreen,
        builder: (context, state) => PaymentScreen(),
      ),
      GoRoute(
        path: RoutePaths.bookingSummary,
        builder: (context, state) =>BookingSummary(),
      ),




    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
  static void initialize() {
    NavigationService.initialize(router);
  }
}
