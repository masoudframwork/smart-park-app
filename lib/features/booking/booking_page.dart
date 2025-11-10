// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smart/features/booking/presentation/widgets/booking_details_view.dart'
//     show BookingDetailView;
// import 'package:smart/features/booking/presentation/widgets/booking_list_view.dart'
//     show BookingListView;
// import '../../../../core/theme/app_color.dart';
// import '../../../../core/theme/app_text_theme.dart';
// import '../../../../core/widgets/app_text.dart';
// import '../../core/constants/image_string.dart';
// import 'presentation/controller/reservation_controller.dart';
//
// class BookingPage extends ConsumerWidget {
//   const BookingPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final reservationState = ref.watch(reservationController);
//     final selectedReservation = reservationState.selectedReservationId != null
//         ? reservationState.reservations.firstWhere(
//             (r) => r.id == reservationState.selectedReservationId,
//             orElse: () => reservationState.reservations.first,
//           )
//         : null;
//
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: AppColor.lightBackgroundColor,
//         body: Column(
//           children: [
//
//             _buildCustomAppBar(
//                 context, reservationState.selectedReservationId != null, ref),
//             Expanded(
//               child: reservationState.selectedReservationId != null &&
//                       selectedReservation != null
//                   ? BookingDetailView(reservation: selectedReservation)
//                   : BookingListView(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCustomAppBar(
//       BuildContext context, bool showBackButton, WidgetRef ref) {
//     return Container(
//       padding: EdgeInsets.only(
//         top: MediaQuery.of(context).padding.top + 16.h,
//         left: 16.w,
//         right: 16.w,
//         bottom: 16.h,
//       ),
//       color: AppColor.lightBackgroundColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: 48.h,
//                 width: 48.w,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: AppColor.greyContainerColor,
//                     width: 1,
//                   ),
//                   borderRadius: BorderRadius.circular(10.r),
//                   color: AppColor.whiteColor,
//                 ),
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.menu,
//                     color: AppColor.blackColor,
//                     size: 20.sp,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//
//               // Arrow Button
//               if (showBackButton)
//                 GestureDetector(
//                   onTap: () {
//                     if (showBackButton) {
//                       ref.read(reservationController.notifier).clearSelection();
//                     } else {
//                       Navigator.of(context).pop();
//                     }
//                   },
//                   child: Container(
//                     height: 48.h,
//                     width: 48.w,
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: AppColor.greyContainerColor,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10.r),
//                       color: AppColor.whiteColor,
//                     ),
//                     child: Image.asset(
//                       AppImages.arrowIcon,
//                       width: 8,
//                       height: 8,
//                       color: AppColor.primaryColor,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           if (!showBackButton) ...[
//             SizedBox(height: 22.h),
//             AppText(
//               text: 'الحجوزات',
//               appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
//                   fontWeight: FontWeight.w600,
//                   color: AppColor.blackNumberSmallColor),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/booking/presentation/controller/reservation_controller.dart';
import 'package:smart/features/booking/presentation/widgets/booking_details_view.dart';
import 'package:smart/features/booking/presentation/widgets/booking_list_view.dart';

import '../../../../core/constants/image_string.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';

class BookingPage extends ConsumerWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationState = ref.watch(reservationController);

    final selectedReservation = reservationState.selectedReservationId != null
        ? reservationState.reservations.firstWhere(
            (r) => r.id == reservationState.selectedReservationId,
            orElse: () => reservationState.reservations.first,
          )
        : null;

    final bool inDetailsView = reservationState.selectedReservationId != null &&
        selectedReservation != null;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColor.lightBackgroundColor,
        body: Column(
          children: [
            _BookingCustomAppBar(
              inDetailsView: inDetailsView,
              onBackToList: () {
                ref.read(reservationController.notifier).clearSelection();
              },
              onMenu: () {},
            ),

            Expanded(
              child: inDetailsView
                  ? BookingDetailView(reservation: selectedReservation!)
                  : const BookingListView(),
            ),
          ],
        ),
      ),
    );
  }
}

/// AppBar
class _BookingCustomAppBar extends StatelessWidget {
  final bool inDetailsView;
  final VoidCallback onBackToList;
  final VoidCallback onMenu;

  const _BookingCustomAppBar({
    required this.inDetailsView,
    required this.onBackToList,
    required this.onMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightBackgroundColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16.h,
        right: 16.w,
        left: 16.w,
        bottom: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (inDetailsView)
                _SquareButton(
                  onTap: onBackToList,
                  icon: Image.asset(
                    AppImages.arrowRightIcon,
                    width: 20.w,
                    height: 20.w,
                    color: AppColor.primaryColor,
                  ),
                )
              else
                _SquareButton(
                  onTap: onBackToList,
                  icon: Image.asset(
                    AppImages.arrowRightIcon,
                    width: 20.w,
                    height: 20.w,
                    color: AppColor.primaryColor,
                  ),
                ),
              _SquareButton(
                onTap: onMenu,
                icon: Icon(
                  Icons.menu,
                  size: 20.w,
                  color: AppColor.blackColor,
                ),
              ),
            ],
          ),
          if (!inDetailsView) ...[
            SizedBox(height: 22.h),
            AppText(
              text: 'الحجوزات',
              appTextTheme: AppTextTheme.titleLargeTextStyle().copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.blackNumberSmallColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SquareButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;

  const _SquareButton({
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 34.w,
        height: 34.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColor.contanearGreyColor,
            width: 1,
          ),
        ),
        child: icon,
      ),
    );
  }
}
