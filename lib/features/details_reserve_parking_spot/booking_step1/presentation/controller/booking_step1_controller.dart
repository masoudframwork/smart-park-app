import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/data/models/booking_flow_state.dart';

class BookingStep1Controller extends StateNotifier<BookingStep1State> {
  BookingStep1Controller() : super(const BookingStep1State());

  // 🔹 اختيار المركبة
  void selectVehicle(String id) {
    state = BookingStep1State(
      selectedVehicleId: id,
      selectedDurationId: null,
    );
  }

  // 🔹 اختيار المدة
  void selectDuration(String id) {
    if (!state.hasVehicle) return;

    state = state.copyWith(
      selectedDurationId: id,
    );
  }

  void reset() {
    state = const BookingStep1State();
  }
}

final bookingFlowControllerProvider =
    StateNotifierProvider<BookingStep1Controller, BookingStep1State>(
  (ref) => BookingStep1Controller(),
);
