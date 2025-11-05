import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/core/theme/app_text_theme.dart';
import 'package:smart/core/widgets/app_text.dart';
import 'package:smart/core/widgets/svg_image_widget.dart';
import 'package:smart/features/bottom_nav_bar/domain/models/bottom_nav_bar_item.dart';
import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';

// ignore: must_be_immutable
class HomeBottomNavigationBar extends ConsumerWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(

      // height: 70.h,
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
      child: Container(
        decoration: BoxDecoration(
          // color: isSelected
          //     ? AppColor.selectedTabTextColor
          //     : Colors.transparent,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 220),
              curve: Curves.easeOut,
              height: 2,
              width: 70.w,
              decoration: BoxDecoration(

                color: isSelected
                    ? AppColor.selectedTabTextColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),

            SvgImageWidget(
              item.icon,
              height: 21,
              width: 21,
              fit: BoxFit.cover,
              color: isSelected
                  ? AppColor.selectedTabTextColor
                  : AppColor.greyTextColor,
            ),

            const SizedBox(height: 5),

            // النص
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
    );
  }
}

// Widget navBarItem(BottomNavBarItem item, {required WidgetRef ref}) {
//   return GestureDetector(
//     onTap: () {
//       ref.read(bottomNavBarController).changeIndex(item.index);
//     },
//     child: SizedBox(
//       height: 64,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgImageWidget(
//               item.icon,
//               height: 21,
//               width: 21,
//               fit: BoxFit.cover,
//               color:
//                   ref.watch(bottomNavBarController).currentIndex == item.index
//                       ? AppColor.selectedTabTextColor
//                       : AppColor.greyTextColor,
//             ),
//             // SvgPicture.asset(
//             //   item.icon,
//             //   height: 21,
//             //   width: 21,
//             //   fit: BoxFit.cover,
//
//             //   color:
//             //       ref.watch(bottomNavBarController).currentIndex == item.index
//             //       ? AppColor.selectedTabTextColor
//             //       : AppColor.greyTextColor,
//             // ),
//             const SizedBox(height: 5),
//             AppText(
//               text: item.title,
//               appTextTheme: AppTextTheme.bodySmallTextStyle().copyWith(
//                 color: ref.watch(bottomNavBarController).currentIndex ==
//                         item.index
//                     ? AppColor.selectedTabTextColor
//                     : AppColor.greyTextColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
