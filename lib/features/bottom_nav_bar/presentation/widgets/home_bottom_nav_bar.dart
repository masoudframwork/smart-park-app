import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';
import 'package:smart/features/bottom_nav_bar/domain/models/bottom_nav_bar_item.dart';
import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';

class HomeBottomNavigationBar extends ConsumerWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 394.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: ref
            .read(bottomNavBarController)
            .navItems
            .map((e) => Expanded(child: navBarItem(e, ref: ref)))
            .toList(),
      ),
    );
  }

  Widget navBarItem(BottomNavBarItem item, {required WidgetRef ref}) {
    final isSelected =
        ref.watch(bottomNavBarController).currentIndex == item.index;

    return GestureDetector(
      onTap: () => ref.read(bottomNavBarController).changeIndex(item.index),
      child: SizedBox(
        height: 80.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              height: isSelected ? 2.h : 0,
              width: 74.w,
              margin: const EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColor.selectedTabTextColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color:
                              AppColor.selectedTabTextColor.withOpacity(0.25),
                          blurRadius: 8,
                          spreadRadius: 0.8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  SvgImageWidget(
                    item.icon,
                    height: 21.h,
                    width: 21.w,
                    fit: BoxFit.cover,
                    color: isSelected
                        ? AppColor.selectedTabTextColor
                        : AppColor.greyTextColor,
                  ),
                  const SizedBox(height: 5),
                  AppText(
                    text: item.title,
                    appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
                      color: isSelected
                          ? AppColor.selectedTabTextColor
                          : AppColor.greyTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
