import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/helpers/time_of_day.dart';
import '../../domain/booking_summary_state.dart' show BookingSummaryState;

final bookingSummaryControllerProvider =
StateNotifierProvider<BookingSummaryController, BookingSummaryState>((ref) {
  return BookingSummaryController();
});

class BookingSummaryController extends StateNotifier<BookingSummaryState> {
  BookingSummaryController() : super(const BookingSummaryState()) {
    _recalculateEnd();
  }

  void setHours(int h) {
    final fixed = h.clamp(1, 24);
    state = state.copyWith(hours: fixed);
    _recalculateEnd();
  }

  void setStart(TimeOfDay t) {
    state = state.copyWith(start: roundTo15(t));
    _recalculateEnd();
  }

  void incrementStart([int minutes = 15]) {
    setStart(addMinutes(state.start, minutes));
  }

  void decrementStart([int minutes = 15]) {
    setStart(addMinutes(state.start, -minutes));
  }

  void _recalculateEnd() {
    final minutes = state.hours * 60;
    final end = addMinutes(state.start, minutes);
    state = state.copyWith(end: end);
  }
}
