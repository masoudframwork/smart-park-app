import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bottomNavBarController);
    final currentIndex = controller.currentIndex;

    return Container(
      height: 85,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0C6450), // Dark green background
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              icon: Icons.home_rounded,
              index: 0,
              currentIndex: currentIndex,
              onTap: () => ref.read(bottomNavBarController).changeIndex(0),
            ),
            _navItem(
              icon: Icons.list_alt_rounded,
              index: 1,
              currentIndex: currentIndex,
              onTap: () => ref.read(bottomNavBarController).changeIndex(1),
            ),

            // ----- CENTER CAMERA BUTTON -----
            GestureDetector(
              onTap: () => ref.read(bottomNavBarController).changeIndex(2),
              child: Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xFF9EDB51), // Light green
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),

            _navItem(
              icon: Icons.person_rounded,
              index: 3,
              currentIndex: currentIndex,
              onTap: () => ref.read(bottomNavBarController).changeIndex(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required int index,
    required int currentIndex,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 28,
        color: currentIndex == index ? Colors.white : Colors.white70,
      ),
    );
  }
}
