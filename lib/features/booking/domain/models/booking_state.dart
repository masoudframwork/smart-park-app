// import 'package:smart/features/booking/domain/models/booking_model.dart';
//
// class BookingState {
//   final List<BookingModel> reservations;
//   final String? selectedReservationId;
//   final bool isLoading;
//   final String? errorMessage;
//   final int selectedTabIndex;
//
//   BookingState({
//     required this.reservations,
//     this.selectedReservationId,
//     required this.isLoading,
//     this.errorMessage,
//     required this.selectedTabIndex,
//   });
//
//   factory BookingState.initial() {
//     return BookingState(
//       reservations: [],
//       selectedReservationId: null,
//       isLoading: false,
//       errorMessage: null,
//       selectedTabIndex: 0,
//     );
//   }
//
//   List<BookingModel> get currentBookings =>
//       reservations.where((r) => r.isActive).toList();
//
//   List<BookingModel> get previousBookings =>
//       reservations.where((r) => r.isCompleted).toList();
//
//   List<BookingModel> get displayedBookings =>
//       selectedTabIndex == 0 ? currentBookings : previousBookings;
//
//   BookingState copyWith({
//     List<BookingModel>? reservations,
//     String? selectedReservationId,
//     bool? isLoading,
//     String? errorMessage,
//     int? selectedTabIndex,
//   }) {
//     return BookingState(
//       reservations: reservations ?? this.reservations,
//       selectedReservationId: selectedReservationId,
//       isLoading: isLoading ?? this.isLoading,
//       errorMessage: errorMessage,
//       selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
//     );
//   }
// }
import 'booking_model.dart';

class BookingState {
  final List<BookingModel> reservations;
  final String? selectedReservationId;
  final bool isLoading;
  final String? errorMessage;
  final int selectedTabIndex;

  BookingState({
    required this.reservations,
    this.selectedReservationId,
    required this.isLoading,
    this.errorMessage,
    required this.selectedTabIndex,
  });

  factory BookingState.initial() {
    return BookingState(
      reservations: [],
      selectedReservationId: null,
      isLoading: false,
      errorMessage: null,
      selectedTabIndex: 0,
    );
  }

  List<BookingModel> get currentBookings =>
      reservations.where((r) => r.isActive).toList();

  List<BookingModel> get previousBookings =>
      reservations.where((r) => r.isCompleted).toList();

  List<BookingModel> get displayedBookings =>
      selectedTabIndex == 0 ? currentBookings : previousBookings;

  /// 🟢 الحجز المختار
  BookingModel? get selectedReservation {
    if (selectedReservationId == null) return null;
    try {
      return reservations.firstWhere((r) => r.id == selectedReservationId);
    } catch (_) {
      return null;
    }
  }

  BookingState copyWith({
    List<BookingModel>? reservations,
    String? selectedReservationId,
    bool? isLoading,
    String? errorMessage,
    int? selectedTabIndex,
  }) {
    return BookingState(
      reservations: reservations ?? this.reservations,
      selectedReservationId:
      selectedReservationId ?? this.selectedReservationId,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }
}
