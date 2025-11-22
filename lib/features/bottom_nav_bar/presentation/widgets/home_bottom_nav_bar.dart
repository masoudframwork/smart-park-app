// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smart/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
//
// class HomeBottomNavigationBar extends ConsumerWidget {
//   const HomeBottomNavigationBar({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = ref.watch(bottomNavBarController);
//     final currentIndex = controller.currentIndex;
//
//     // Colors from your design
//     const selectedColor = Color(0xFF6CBF4E);
//     const unselectedColor = Color(0xFF9E9E9E);
//
//     return Container(
//       height: 82.h,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.r),
//           topRight: Radius.circular(24.r),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 12,
//             offset: const Offset(0, -4),
//           ),
//         ],
//       ),
//       child: Directionality(
//         textDirection: TextDirection.rtl, // your app uses Arabic UI
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _item(
//               index: 0,
//               label: "الرئيسية",
//               icon: Icons.home_rounded,
//               isSelected: currentIndex == 0,
//               selectedColor: selectedColor,
//               unselectedColor: unselectedColor,
//               onTap: () {
//                 // ref.read(bottomNavBarController).setIndex(0);
//               }
//             ),
//             _item(
//               index: 1,
//               label: "الحجوزات",
//               icon: Icons.event_note_rounded,
//               isSelected: currentIndex == 1,
//               selectedColor: selectedColor,
//               unselectedColor: unselectedColor,
//                 onTap: () {
//                   // ref.read(bottomNavBarController).setIndex(1);
//                 }
//             ),
//             _item(
//               index: 2,
//               label: "المحفظة",
//               icon: Icons.account_balance_wallet_rounded,
//               isSelected: currentIndex == 2,
//               selectedColor: selectedColor,
//               unselectedColor: unselectedColor,
//                 onTap: () {
//                   // ref.read(bottomNavBarController).setIndex(2);
//                 }
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _item({
//     required int index,
//     required String label,
//     required IconData icon,
//     required bool isSelected,
//     required Color selectedColor,
//     required Color unselectedColor,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       behavior: HitTestBehavior.opaque,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Top green highlight
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             height: 3.h,
//             width: isSelected ? 36.w : 0,
//             decoration: BoxDecoration(
//               color: isSelected ? selectedColor : Colors.transparent,
//               borderRadius: BorderRadius.circular(50),
//             ),
//           ),
//           SizedBox(height: 6.h),
//
//           Icon(
//             icon,
//             size: 26.sp,
//             color: isSelected ? selectedColor : unselectedColor,
//           ),
//
//           SizedBox(height: 4.h),
//
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12.5.sp,
//               fontWeight: FontWeight.w500,
//               color: isSelected ? selectedColor : unselectedColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
