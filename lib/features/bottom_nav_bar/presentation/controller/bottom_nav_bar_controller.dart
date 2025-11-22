// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:smart/features/booking/booking_page.dart';
// import 'package:smart/features/home/presentation/home_page.dart';
// import 'package:smart/features/settings/presentation/settings_screen.dart';
//
// import '../../../profile/data/models/user_profile.dart';
// import '../../../profile/presentation/profile_screen.dart';
//
// final bottomNavBarController = ChangeNotifierProvider(
//   (ref) => BottomNavBarController(),
// );
//
// class BottomNavBarController extends ChangeNotifier {
//   int currentIndex = 0;
//
//   static const mockProfile = UserProfile(
//     fullName: "عبدالرحمن أحمد عبدالله",
//     nationalId: "1234567890",
//     phoneNumber: "+966 500 123 456",
//   );
//
//   // ---- UPDATE WITH 4 PAGES ----
//   List<Widget> pages = [
//     const HomePage(), // index 0
//     const BookingPage(), // index 1
//     const ProfileScreen(
//         // profile: mockProfile,
//         ), // CAMERA PAGE (index 2) — replace later
//     //  Placeholder(), // PROFILE PAGE (index 3) — replace later
//     const SettingsScreen(),
//   ];
//
//   void changeIndex(int val) {
//     currentIndex = val;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/booking/booking_page.dart';
import 'package:smart/features/home/presentation/home_page.dart';
import 'package:smart/features/settings/presentation/settings_screen.dart';
import '../../../profile/presentation/profile_screen.dart';
import '../../../qr_scanner/scan_code_screen.dart';

final bottomNavBarController = ChangeNotifierProvider(
  (ref) => BottomNavBarController(),
);

class BottomNavBarController extends ChangeNotifier {
  int currentIndex = 0;

  static const int homeIndex = 0;
  static const int bookingIndex = 1;
  static const int profileIndex = 2;
  static const int cameraIndex = 3;

  List<Widget> pages = [
    const HomePage(), // 0
    const BookingPage(), // 1
    const ProfileScreen(), // 2
    // const ScanCodeScreen(), // 3
  ];

  void changeIndex(int val) {
    currentIndex = val;
    notifyListeners();
  }
}
