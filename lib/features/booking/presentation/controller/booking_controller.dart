import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/booking/domain/models/booking_state.dart';
import 'package:smart/generated/l10n.dart';
import '../../domain/models/booking_model.dart';

final reservationController =
StateNotifierProvider<BookingController, BookingState>((ref) {
  return BookingController(ref);
});

class BookingController extends StateNotifier<BookingState> {
  final Ref ref;

  BookingController(this.ref) : super(BookingState.initial()) {
    loadReservations();
  }

  BookingModel? reservation;

  bool get isArabic {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    return locale.languageCode == "ar";
  }

  // 🔥 TRANSLATIONS FOR FAKE MOCK DATA
  String trLocation(String ar, String en) => isArabic ? ar : en;
  String trAddress(String ar, String en) => isArabic ? ar : en;
  String trStatus(String ar, String en) => isArabic ? ar : en;
  String trPayment(String ar, String en) => isArabic ? ar : en;

  Future<void> loadReservations() async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 1));
      final now = DateTime.now();

      final mockReservations = [
        BookingModel(
          id: '1',
          locationName: trLocation("المنطقة 013", "Zone 013"),
          address: trAddress("طريق خريص، الرياض، المملكة العربية السعودية",
              "Khurais Road, Riyadh, Saudi Arabia"),
          startTime: isArabic ? "8:00 ص" : "8:00 AM",
          endTime: isArabic ? "4:00 م" : "4:00 PM",
          date: isArabic ? "أبريل 2023" : "April 2023",
          duration: "05:06:30",
          price: 30.0,
          status: trStatus("نشط", "Active"),
          startDateTime: now.subtract(const Duration(hours: 1)),
          endDateTime:
          now.add(const Duration(hours: 4, minutes: 6, seconds: 30)),
        ),
        BookingModel(
          id: '2',
          locationName: trLocation("المنطقة 025", "Zone 025"),
          address: trAddress("طريق خريص، الرياض، المملكة العربية السعودية",
              "Khurais Road, Riyadh, Saudi Arabia"),
          startTime: isArabic ? "8:00 ص" : "8:00 AM",
          endTime: isArabic ? "4:00 م" : "4:00 PM",
          date: isArabic ? "يونيو 2024" : "June 2024",
          duration: "02:00:00",
          status: trStatus("نشط", "Active"),
          price: 30.0,
          startDateTime: now.add(const Duration(hours: 1)),
          endDateTime: now.add(const Duration(hours: 3)),
        ),
        BookingModel(
          id: '3',
          locationName: trLocation("المنطقة 013", "Zone 013"),
          address: trAddress("طريق خريص، الرياض، المملكة العربية السعودية",
              "Khurais Road, Riyadh, Saudi Arabia"),
          startTime: isArabic ? "8:00 ص" : "8:00 AM",
          endTime: isArabic ? "4:00 م" : "4:00 PM",
          date: isArabic ? "أبريل 2023" : "April 2023",
          duration: "08:00:00",
          status: trStatus("مكتمل", "Completed"),
          startDateTime: now.subtract(const Duration(days: 2)),
          endDateTime: now.subtract(const Duration(days: 2, hours: -8)),
          price: 30.0,
          paymentStatus: trPayment("إجمالي المدفوع", "Total Paid"),
        ),
        BookingModel(
          id: '4',
          locationName: trLocation("المنطقة 025", "Zone 025"),
          address: trAddress("طريق خريص، الرياض، المملكة العربية السعودية",
              "Khurais Road, Riyadh, Saudi Arabia"),
          startTime: isArabic ? "8:00 ص" : "8:00 AM",
          endTime: isArabic ? "4:00 م" : "4:00 PM",
          date: isArabic ? "يونيو 2024" : "June 2024",
          duration: "08:00:00",
          status: trStatus("مكتمل", "Completed"),
          startDateTime: now.subtract(const Duration(days: 5)),
          endDateTime: now.subtract(const Duration(days: 5, hours: -8)),
          price: 30.0,
          paymentStatus: trPayment("إجمالي المدفوع", "Total Paid"),
        ),
      ];

      state = state.copyWith(
        reservations: mockReservations,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage:
        isArabic ? "فشل في تحميل الحجوزات" : "Failed to load reservations",
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
        errorMessage:
        isArabic ? "فشل في إلغاء الحجز" : "Failed to cancel reservation",
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
        errorMessage:
        isArabic ? "فشل في تمديد الحجز" : "Failed to extend reservation",
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
        errorMessage:
        isArabic ? "فشل في إعادة الحجز" : "Failed to rebook reservation",
      );
    }
  }

  void refresh() {
    loadReservations();
  }
}
