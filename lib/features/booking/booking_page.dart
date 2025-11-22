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
import 'package:smart/features/booking/presentation/controller/booking_controller.dart';
import 'package:smart/features/booking/presentation/widgets/booking_details/booking_details_view.dart';
import 'package:smart/features/booking/presentation/widgets/booking_list_view.dart';

import '../../../../core/theme/app_color.dart';

import '../../core/constants/image_string.dart';
import '../../core/widgets/details_reserve_parking_widget/app_bar_widget.dart';
import 'presentation/widgets/booking_components.dart';

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.settingsBackgroundColor,
        appBar: CustomAppBar(
          backgroundColor: AppColor.backgroundAppBarColor,
          leading: CircleImageButton(
            onTap: () {},
            imageUrl: AppImages.appLogo,
            size: 37,
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: inDetailsView
                    ? BookingDetailView(reservation: selectedReservation)
                    : const BookingListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
