import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'widgets/custom_bottom_nav_bar.dart';

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
      // extendBody: true, // <-- keep this for transparent BOTTOM ONLY
      body: Consumer(
        builder: (context, ref, child) {
          final currentIndex = ref.watch(bottomNavBarController).currentIndex;
          final pages = ref.read(bottomNavBarController).pages;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: IndexedStack(
              key: ValueKey(currentIndex),
              index: currentIndex,
              children: pages.asMap().entries.map((entry) {
                final index = entry.key;
                final page = entry.value;

                return Navigator(
                  key: ValueKey('navigator_$index'),
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      builder: (context) => page,
                      settings: settings,
                    );
                  },
                );
              }).toList(),
            ),
          );
        },
      ),

      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: const SafeArea(
          child: CustomBottomNavigationBar(),
        ),
      ),
    );
  }
}
