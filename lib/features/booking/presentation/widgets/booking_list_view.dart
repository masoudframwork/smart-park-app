// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:smart/features/booking/presentation/widgets/booking_card.dart'
//     show CurrentBookingCard;
// import 'package:smart/features/booking/presentation/widgets/booking_details/booking_details_view.dart' show BookingDetailView;
// import 'package:smart/features/booking/presentation/widgets/booking_tap.dart'
//     show BookingTabBar;
// import '../../../../core/theme/app_color.dart';
// import '../controller/booking_controller.dart';
// import 'booking_empty_state.dart';
// import 'previous_booking_card.dart';
//
// class BookingListView extends ConsumerWidget {
//   const BookingListView({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final reservationState = ref.watch(reservationController);
//
//     if (reservationState.isLoading && reservationState.reservations.isEmpty) {
//       return Center(
//         child: CircularProgressIndicator(color: AppColor.primaryColor),
//       );
//     }
//
//     if (reservationState.errorMessage != null) {
//       return BookingErrorState(
//         errorMessage: reservationState.errorMessage!,
//         onRetry: () => ref.read(reservationController.notifier).refresh(),
//       );
//     }
//
//     final displayedBookings = reservationState.displayedBookings;
//
//     return Column(
//       children: [
//         BookingTabBar(
//           selectedIndex: reservationState.selectedTabIndex,
//           onTabChanged: (index) {
//             ref.read(reservationController.notifier).changeTab(index);
//           },
//         ),
//         Expanded(
//           child: displayedBookings.isEmpty
//               ? BookingEmptyState(
//                   selectedTabIndex: reservationState.selectedTabIndex,
//                 )
//               : RefreshIndicator(
//                   color: AppColor.primaryColor,
//                   onRefresh: () async =>
//                       ref.read(reservationController.notifier).refresh(),
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemCount: displayedBookings.length,
//                     itemBuilder: (context, index) {
//                       final reservation = displayedBookings[index];
//                       return _buildBookingCard(
//                         context,
//                         ref,
//                         reservation,
//                       );
//                     },
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBookingCard(
//     BuildContext context,
//     WidgetRef ref,
//     reservation,
//   ) {
//     if (reservation.isActive) {
//       return CurrentBookingCard(
//         reservation: reservation,
//         onTap: () => _navigateToDetail(context, reservation),
//         onCancel: () => _navigateToDetail(context, reservation),
//         onExtend: () => _navigateToDetail(context, reservation),
//       );
//     } else {
//       return PreviousBookingCard(
//         reservation: reservation,
//         onTap: () => _navigateToDetail(context, reservation),
//         onBookAgain: () => ref
//             .read(reservationController.notifier)
//             .bookAgain(reservation.id),
//       );
//     }
//   }
//
//   void _navigateToDetail(BuildContext context, reservation) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => BookingDetailView(
//           reservation: reservation,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/booking/domain/models/booking_model.dart';
import 'package:smart/features/booking/presentation/widgets/booking_card.dart'
    show CurrentBookingCard;
import 'package:smart/features/booking/presentation/widgets/booking_tap.dart'
    show BookingTabBar;
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/theme/app_color.dart';
import '../controller/booking_controller.dart';
import 'booking_empty_state.dart';
import 'previous_booking_card.dart';

class BookingListView extends ConsumerWidget {
  const BookingListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationState = ref.watch(reservationController);

    if (reservationState.isLoading && reservationState.reservations.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: AppColor.primaryColor),
      );
    }

    if (reservationState.errorMessage != null) {
      return BookingErrorState(
        errorMessage: reservationState.errorMessage!,
        onRetry: () => ref.read(reservationController.notifier).refresh(),
      );
    }

    final displayedBookings = reservationState.displayedBookings;

    return Column(
      children: [
        BookingTabBar(
          selectedIndex: reservationState.selectedTabIndex,
          onTabChanged: (index) {
            ref.read(reservationController.notifier).changeTab(index);
          },
        ),
        Expanded(
          child: displayedBookings.isEmpty
              ? BookingEmptyState(
            selectedTabIndex: reservationState.selectedTabIndex,
          )
              : RefreshIndicator(
            color: AppColor.primaryColor,
            onRefresh: () async =>
                ref.read(reservationController.notifier).refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: displayedBookings.length,
              itemBuilder: (context, index) {
                final reservation = displayedBookings[index];
                return _buildBookingCard(
                  context,
                  ref,
                  reservation,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBookingCard(
      BuildContext context,
      WidgetRef ref,
      BookingModel reservation,
      ) {
    if (reservation.isActive) {
      return CurrentBookingCard(
        reservation: reservation,
        onTap: () => _navigateToDetail(context, ref, reservation),
        onCancel: () => _navigateToDetail(context, ref, reservation),
        onExtend: () => _navigateToDetail(context, ref, reservation),
      );
    } else {
      return PreviousBookingCard(
        reservation: reservation,
        onTap: () => _navigateToDetail(context, ref, reservation),
        onBookAgain: () =>
            ref.read(reservationController.notifier).bookAgain(reservation.id),
      );
    }
  }

  void _navigateToDetail(
      BuildContext context,
      WidgetRef ref,
      BookingModel reservation,
      ) {
    ref
        .read(reservationController.notifier)
        .selectReservation(reservation.id);
    NavigationService.push('/bookingDetailView');

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const BookingDetailView(),
    //   ),
    // );
  }
}
