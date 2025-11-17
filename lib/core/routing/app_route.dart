import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart/core/routing/navigation_service.dart';
import 'package:smart/core/routing/routes.dart';
import 'package:smart/features/bottom_nav_bar/presentation/bottom_nav_bar_page.dart';
import 'package:smart/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:smart/features/splash/presentation/splash_screen.dart';
import '../../features/auth/bankcarddata/presentation/bank_card_data_page.dart';
import '../../features/auth/login/presentation/login_page.dart';
import '../../features/auth/send_the_code/presentation/send_the_code_page.dart';
import '../../features/auth/sign_up/presentation/sign_up_page.dart';
import '../../features/details_reserve_parking_spot/booking-parking_details/presentation/booking_parking_details_page.dart';
import '../../features/details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';
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
      GoRoute(
        path: RoutePaths.signUpPage,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: SignUpPage(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.bankCardDataPage,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: BankCardDataPage(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.bookingParkingDetailsPage,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: BookingParkingDetailsPage(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.bookingStep1Page,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: BookingStep1Page(),
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
