import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import '../../../../core/constants/image_string.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bottomNavBarController);
    final currentIndex = controller.currentIndex;

    return Container(
      height: 62,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.bottomNavigationBarColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            offset: const Offset(0, 10),
            blurRadius: 24,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(
            index: 0,
            currentIndex: currentIndex,
            onTap: () => ref.read(bottomNavBarController).changeIndex(0),
            icon: SvgPicture.asset(
              AppImages.homeIcon,
              width: 22,
              height: 22,
            ),
          ),
          _navItem(
            index: 1,
            currentIndex: currentIndex,
            onTap: () => ref.read(bottomNavBarController).changeIndex(1),
            icon: SvgPicture.asset(
              AppImages.reservationNotSelectedIcon,
              width: 22,
              height: 22,
            ),
          ),
          _navItem(
            index: 2,
            currentIndex: currentIndex,
            onTap: () => ref.read(bottomNavBarController).changeIndex(2),
            icon: SvgPicture.asset(
              AppImages.personIcon,
              width: 22,
              height: 22,
            ),
          ),
          _navItem(
            index: 3,
            currentIndex: currentIndex,
            onTap: () => ref.read(bottomNavBarController).changeIndex(3),
            icon: SvgPicture.asset(
              AppImages.qrCodeIcon,
              width: 22,
              height: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required int index,
    required int currentIndex,
    required Widget icon,
    required VoidCallback onTap,
  }) {
    final bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
            color:
                isSelected ? AppColor.tabBarSelectedColor : Colors.transparent,
            borderRadius: BorderRadius.circular(18)),
        child: icon,
      ),
    );
  }
}
