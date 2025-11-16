import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/booking/booking_page.dart';
import 'package:smart/features/home/presentation/home_page.dart';

final bottomNavBarController = ChangeNotifierProvider(
      (ref) => BottomNavBarController(),
);

class BottomNavBarController extends ChangeNotifier {
  int currentIndex = 0;

  // ---- UPDATE WITH 4 PAGES ----
  List<Widget> pages = [
    const HomePage(),        // index 0
    const BookingPage(),     // index 1
    const Placeholder(),     // CAMERA PAGE (index 2) — replace later
    const Placeholder(),     // PROFILE PAGE (index 3) — replace later
  ];

  void changeIndex(int val) {
    currentIndex = val;
    notifyListeners();
  }
}