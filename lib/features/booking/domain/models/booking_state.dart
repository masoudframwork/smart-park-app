import 'package:smart/features/booking/domain/models/booking_model.dart';

class BookingState {
  final List<BookingModel> reservations;
  final String? selectedReservationId;
  final bool isLoading;
  final String? errorMessage;

  BookingState({
    required this.reservations,
    this.selectedReservationId,
    required this.isLoading,
    this.errorMessage,
  });

  factory BookingState.initial() {
    return BookingState(
      reservations: [],
      selectedReservationId: null,
      isLoading: false,
      errorMessage: null,
    );
  }

  BookingState copyWith({
    List<BookingModel>? reservations,
    String? selectedReservationId,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BookingState(
      reservations: reservations ?? this.reservations,
      selectedReservationId: selectedReservationId, // Don't use ?? here
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
