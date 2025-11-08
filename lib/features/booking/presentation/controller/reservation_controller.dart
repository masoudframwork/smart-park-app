import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/booking/domain/models/booking_state.dart';
import '../../domain/models/booking_model.dart';

final reservationController =
    StateNotifierProvider<ReservationController, BookingState>((ref) {
  return ReservationController();
});

class ReservationController extends StateNotifier<BookingState> {
  ReservationController() : super(BookingState.initial()) {
    loadReservations();
  }
  Future<void> loadReservations() async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 1));

      final now = DateTime.now();
      final mockReservations = [
        BookingModel(
          id: '1',
          startTime: '8:00 ص',
          endTime: '4:00 م',
          date: 'نيسان بالعظيم، 2023 / أيمود',
          duration: '05:06:30',
          status: 'active',
          startDateTime: now.subtract(const Duration(hours: 1)),
          endDateTime:
              now.add(const Duration(hours: 4, minutes: 6, seconds: 30)),
        ),
        BookingModel(
          id: '2',
          startTime: '11:00 ص',
          endTime: '1:00 م',
          date: 'يونيو كانون، 2024 / أخضر',
          duration: '02:00:00',
          status: 'active',
          startDateTime: now.add(const Duration(hours: 1)),
          endDateTime: now.add(const Duration(hours: 3)),
        ),
      ];
      state = state.copyWith(
        reservations: mockReservations,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'فشل في تحميل الحجوزات',
      );
    }
  }

  void selectReservation(String reservationId) {
    state = state.copyWith(selectedReservationId: reservationId);
  }

  void clearSelection() {
    state = state.copyWith(
      selectedReservationId: null,
    );
  }

  Future<void> cancelReservation(String reservationId) async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 1));

      final updatedReservations = state.reservations
          .where((reservation) => reservation.id != reservationId)
          .toList();

      state = state.copyWith(
        reservations: updatedReservations,
        isLoading: false,
        selectedReservationId: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'فشل في إلغاء الحجز',
      );
    }
  }

  void refresh() {
    loadReservations();
  }
}
