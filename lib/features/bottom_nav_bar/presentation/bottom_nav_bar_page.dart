import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';

import 'widgets/home_bottom_nav_bar.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  DateTime? lastBackPressTime;

  @override
  void initState() {
    super.initState();

    lastBackPressTime = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(
        builder: (context, ref, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: IndexedStack(
              index: ref.watch(bottomNavBarController).currentIndex,
              children: ref.read(bottomNavBarController).pages,
            ),
          );
        },
      ),
      bottomNavigationBar: const SafeArea(child: HomeBottomNavigationBar()),
    );
  }
}
