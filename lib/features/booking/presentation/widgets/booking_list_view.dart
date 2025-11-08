import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../controller/reservation_controller.dart';
import 'booking_card.dart';

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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: reservationState.errorMessage!,
              appTextTheme: AppTextTheme.bodyMediumTextStyle(),
            ),
            const SizedBox(height: 16),
            CustomButtonWidget(
              text: 'إعادة المحاولة',
              onPressed: () =>
                  ref.read(reservationController.notifier).refresh(),
              width: 200,
            ),
          ],
        ),
      );
    }

    if (reservationState.reservations.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_busy, size: 80, color: AppColor.greyColor),
            const SizedBox(height: 16),
            AppText(
              text: 'لا توجد حجوزات',
              appTextTheme: AppTextTheme.titleMediumTextStyle(),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      color: AppColor.primaryColor,
      onRefresh: () async => ref.read(reservationController.notifier).refresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reservationState.reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservationState.reservations[index];

          return BookingCard(
            reservation: reservation,
            onTap: () => ref
                .read(reservationController.notifier)
                .selectReservation(reservation.id),
          );
        },
      ),
    );
  }
}
