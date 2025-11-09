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
    _syncHoursWithTimes();
  }

  void setHours(int h) {
    final fixed = h.clamp(1, 24);
    final newEnd = addMinutes(state.start, fixed * 60);

    state = state.copyWith(
      hours: fixed,
      end: newEnd,
    );
  }

  void incrementHours() {
    setHours(state.hours + 1);
  }

  void decrementHours() {
    setHours(state.hours - 1);
  }

  void setStart(TimeOfDay t) {
    final roundedStart = roundTo15(t);

    final newHours = _calcHoursBetween(roundedStart, state.end);

    state = state.copyWith(
      start: roundedStart,
      hours: newHours,
    );
  }

  void incrementStart([int minutes = 15]) {
    final newStart = addMinutes(state.start, minutes);
    setStart(newStart);
  }

  void decrementStart([int minutes = 15]) {
    final newStart = addMinutes(state.start, -minutes);
    setStart(newStart);
  }

  void setEnd(TimeOfDay t) {
    final roundedEnd = roundTo15(t);

    final newHours = _calcHoursBetween(state.start, roundedEnd);

    state = state.copyWith(
      end: roundedEnd,
      hours: newHours,
    );
  }

  void incrementEnd([int minutes = 15]) {
    final newEnd = addMinutes(state.end, minutes);
    setEnd(newEnd);
  }

  void decrementEnd([int minutes = 15]) {
    final newEnd = addMinutes(state.end, -minutes);
    setEnd(newEnd);
  }

  void goToStep(int step) {
    state = state.copyWith(activeStep: step);
  }

  void nextStep() {
    state = state.copyWith(activeStep: state.activeStep + 1);
  }

  void prevStep() {
    state = state.copyWith(activeStep: state.activeStep - 1);
  }

  void _syncHoursWithTimes() {
    final newHours = _calcHoursBetween(state.start, state.end);
    state = state.copyWith(hours: newHours);
  }

  int _calcHoursBetween(TimeOfDay start, TimeOfDay end) {
    final startTotal = start.hour * 60 + start.minute;
    final endTotal = end.hour * 60 + end.minute;

    final diffMinutes = endTotal - startTotal;

    if (diffMinutes <= 0) return 1;

    final diffHoursDouble = diffMinutes / 60.0;
    final hoursInt = diffHoursDouble.ceil();

    return hoursInt.clamp(1, 24);
  }

  void setCustomRange(TimeOfDay start, TimeOfDay end) {
    final roundedStart = roundTo15(start);
    final roundedEnd   = roundTo15(end);
    final newHours     = _calcHoursBetween(roundedStart, roundedEnd);

    state = state.copyWith(
      start: roundedStart,
      end:   roundedEnd,
      hours: newHours,
    );
  }



}
