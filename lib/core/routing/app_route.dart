import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart/core/routing/navigation_service.dart';
import 'package:smart/core/routing/routes.dart';
import 'package:smart/features/bottom_nav_bar/presentation/bottom_nav_bar_page.dart';
import 'package:smart/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:smart/features/splash/presentation/splash_screen.dart';
import '../../features/auth/bankcarddata/presentation/bank_card_data_page.dart';
import '../../features/auth/login/presentation/login_page.dart';
import '../../features/auth/nafath/persentation/nafath_page.dart';
import '../../features/auth/nafath/persentation/widget/nafath_otp_widget.dart';
import '../../features/auth/send_the_code/presentation/send_the_code_page.dart';
import '../../features/auth/sign_up/presentation/sign_up_page.dart';
import '../../features/auth/sign_up/presentation/widget/otp_sign_up/otp_sign_up.dart';
import '../../features/booking/presentation/booking_summary_screen.dart';
import '../../features/booking/presentation/widgets/booking_details/booking_details_view.dart';
import '../../features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import '../../features/details_reserve_parking_spot/booking-parking_details/presentation/booking_parking_details_page.dart';
import '../../features/details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';
import '../../features/home/presentation/widgets/voice_to_text/voice_to_text_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/settings/presentation/settings_screen.dart';
import '../../features/profile/presentation/widget/pre_preserved_vehicles.dart';
import '../../features/qr_scanner/scan_code_screen.dart';
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
      // GoRoute(
      //   path: RoutePaths.bottomNavBar,
      //   pageBuilder: (context, state) {
      //     final tabParam = state.uri.queryParameters['tab'];
      //     final initialIndex = int.tryParse(tabParam ?? '0') ?? 0;
      //
      //     final container = ProviderScope.containerOf(context, listen: false);
      //     container.read(bottomNavBarController).changeIndex(initialIndex);
      //
      //     return softTransitionPage(
      //       child: const BottomNavBarPage(),
      //     );
      //   },
      // ),
      GoRoute(
        path: RoutePaths.bottomNavBar,
        builder: (context, state) {
          final initialIndex =
              state.extra as int? ?? BottomNavBarController.homeIndex;

          return Consumer(
            builder: (context, ref, _) {
              Future.microtask(() {
                ref.read(bottomNavBarController).changeIndex(initialIndex);
              });

              return const BottomNavBarPage();
            },
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
      GoRoute(
        path: RoutePaths.otpSignUpPage,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: OtpSignUpPage(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.nafathPageLogin,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: NafathPageLogin(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.nafathOtpScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: NafathOtpScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.profileScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: ProfileScreen(),
          );
        },
      ),

      GoRoute(
        path: RoutePaths.scanCodeScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: ScanCodeScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.settingsScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: SettingsScreen(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.prePreservedVehicles,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: PrePreservedVehicles(),
          );
        },
      ),

      GoRoute(
        path: RoutePaths.bookingDetailView,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: BookingDetailView(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.bookingSummaryScreen,
        pageBuilder: (context, state) {
          return softTransitionPage(
            child: BookingSummaryScreen(),
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
