import 'booking_model.dart';

class BookingState {
  final List<BookingModel> reservations;
  final bool isLoading;
  final String? errorMessage;
  final String? selectedReservationId;

  BookingState({
    required this.reservations,
    this.isLoading = false,
    this.errorMessage,
    this.selectedReservationId,
  });

  BookingState copyWith({
    List<BookingModel>? reservations,
    bool? isLoading,
    String? errorMessage,
    String? selectedReservationId,
  }) {
    return BookingState(
      reservations: reservations ?? this.reservations,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      selectedReservationId: selectedReservationId ?? this.selectedReservationId,
    );
  }

  factory BookingState.initial() {
    return BookingState(
      reservations: [],
      isLoading: false,
    );
  }
}