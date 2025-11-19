import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import '../../../../core/constants/image_string.dart';

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
              index: 0,
              currentIndex: currentIndex,
              onTap: () => ref.read(bottomNavBarController).changeIndex(0),
              icon: SvgPicture.asset(
                AppImages.homeIcon,
                color: currentIndex == 0 ? Colors.white : Colors.white70,
                width: 20,
                height: 20,
              ),
            ),


            _navItem(
              index: 1,
              currentIndex: currentIndex,
              onTap: () => ref.read(bottomNavBarController).changeIndex(1),
              icon: SvgPicture.asset(
                AppImages.reservationNotSelectedIcon,
                color: currentIndex == 0 ? Colors.white : Colors.white70,
                width: 20,
                height: 20,
              ),
            ),

            _navItem(
              index: 2,
              currentIndex: currentIndex,
              onTap: () => ref.read(bottomNavBarController).changeIndex(2),
              icon: SvgPicture.asset(
                AppImages.personIcon,
                color: currentIndex == 0 ? Colors.white : Colors.white70,
                width: 20,
                height: 20,
              ),
            ),

            // _navItem(
            //   index: 3,
            //   currentIndex: currentIndex,
            //   onTap: () => ref.read(bottomNavBarController).changeIndex(3),
            //   icon: SvgPicture.asset(
            //     AppImages.qrCodeIcon,
            //     color: currentIndex == 0 ? Colors.white : Colors.white70,
            //     width: 20,
            //     height: 20,
            //   ),
            // ),
            _navItem(
              index: 3,
              currentIndex: currentIndex,
              onTap: () {
                // ref.read(bottomNavBarController).changeIndex(3);
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (_) => const SettingsScreen()),
                // );
              },
              icon: SvgPicture.asset(AppImages.qrCodeIcon, width: 20),
            ),
          ],
        ),
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
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? const Color(0xFF6CBF4E) // green circle
              : Colors.transparent,
        ),
        child: Center(child: icon),
      ),
    );
  }


}
