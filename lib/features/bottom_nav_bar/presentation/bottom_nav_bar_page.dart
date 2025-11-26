import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import '../../../core/theme/app_color.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class BottomNavBarPage extends ConsumerWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarController).currentIndex;
    final pages = ref.read(bottomNavBarController).pages;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        // extendBody: true, // <-- keep this for transparent BOTTOM ONLY
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: AnimatedSwitcher(
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
                      // settings: settings,
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: const SafeArea(
            child: CustomBottomNavigationBar(),
          ),
        ),
      ),
    );
  }
}
