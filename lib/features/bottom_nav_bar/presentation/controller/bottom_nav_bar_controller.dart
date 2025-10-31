import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/features/bottom_nav_bar/domain/models/bottom_nav_bar_item.dart';
import 'package:smart/features/home/presentation/home_page.dart';
import 'package:smart/generated/l10n.dart';

final bottomNavBarController = ChangeNotifierProvider(
  (ref) => BottomNavBarController(),
);

class BottomNavBarController extends ChangeNotifier {
  List<Widget> pages = [
    const HomePage(),
    const Placeholder(), // Bookings page placeholder
    const Placeholder(), // Wallet page placeholder
  ];
  List<BottomNavBarItem> navItems = [
    BottomNavBarItem(title: S.current.home, index: 0, icon: AppImages.homeTab),
    BottomNavBarItem(
      title: S.current.bookings,
      index: 1,
      icon: AppImages.bookingTab,
    ),
    BottomNavBarItem(
      title: S.current.wallet,
      index: 2,
      icon: AppImages.walletTab,
    ),
  ];
  int currentIndex = 0;

  void changeIndex(int val) {
    currentIndex = val;
    notifyListeners();
  }
}
