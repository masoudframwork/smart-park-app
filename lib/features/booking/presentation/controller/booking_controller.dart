import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/booking/domain/models/booking_state.dart';
import '../../domain/models/booking_model.dart';

final reservationController =
    StateNotifierProvider<BookingController, BookingState>((ref) {
  return BookingController();
});

class BookingController extends StateNotifier<BookingState> {
  BookingController() : super(BookingState.initial()) {
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
          locationName: 'المنطقة 013',
          address: 'طريق خريص، الرياض، المملكة العربية السعودية',
          startTime: '8:00 ص',
          endTime: '4:00 م',
          date: 'نيسان بالعظيم، 2023 / أيمود',
          duration: '05:06:30',
          price: 30.0,
          status: 'active',
          startDateTime: now.subtract(const Duration(hours: 1)),
          endDateTime:
              now.add(const Duration(hours: 4, minutes: 6, seconds: 30)),
        ),
        BookingModel(
          id: '2',
          locationName: 'المنطقة 025',
          address: 'طريق خريص، الرياض، المملكة العربية السعودية',
          startTime: '8:00 ص',
          endTime: '4:00 م',
          date: 'يونيو كانون، 2024 / أخضر',
          duration: '02:00:00',
          status: 'active',
          price: 30.0,
          startDateTime: now.add(const Duration(hours: 1)),
          endDateTime: now.add(const Duration(hours: 3)),
        ),
        BookingModel(
          id: '3',
          locationName: 'المنطقة 013',
          address: 'طريق خريص، الرياض، المملكة العربية السعودية',
          startTime: '8:00 ص',
          endTime: '4:00 م',
          date: 'نيسان بالعظيم، 2023 / أيمود',
          duration: '08:00:00',
          status: 'completed',
          startDateTime: now.subtract(const Duration(days: 2)),
          endDateTime: now.subtract(const Duration(days: 2, hours: -8)),
          price: 30.0,
          paymentStatus: 'إجمالي المدفوع',
        ),
        BookingModel(
          id: '4',
          locationName: 'المنطقة 025',
          address: 'طريق خريص، الرياض، المملكة العربية السعودية',
          startTime: '8:00 ص',
          endTime: '4:00 م',
          date: 'يونيو كانون، 2024 / أخضر',
          duration: '08:00:00',
          status: 'completed',
          startDateTime: now.subtract(const Duration(days: 5)),
          endDateTime: now.subtract(const Duration(days: 5, hours: -8)),
          price: 30.0,
          paymentStatus: 'إجمالي المدفوع',
        ),
        BookingModel(
          id: '5',
          locationName: 'المنطقة 013',
          address: 'طريق خريص، الرياض، المملكة العربية السعودية',
          startTime: '8:00 ص',
          endTime: '4:00 م',
          date: 'نيسان بالعظيم، 2023 / أيمود',
          duration: '08:00:00',
          status: 'completed',
          startDateTime: now.subtract(const Duration(days: 10)),
          endDateTime: now.subtract(const Duration(days: 10, hours: -8)),
          price: 30.0,
          paymentStatus: 'إجمالي المدفوع',
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

  void changeTab(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void selectReservation(String reservationId) {
    state = state.copyWith(selectedReservationId: reservationId);
  }

  void clearSelection() {
    state = state.copyWith(selectedReservationId: null);
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

  Future<void> extendReservation(String reservationId) async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 1));

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'فشل في تمديد الحجز',
      );
    }
  }

  Future<void> bookAgain(String reservationId) async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 1));

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'فشل في إعادة الحجز',
      );
    }
  }

  void refresh() {
    loadReservations();
  }
}
