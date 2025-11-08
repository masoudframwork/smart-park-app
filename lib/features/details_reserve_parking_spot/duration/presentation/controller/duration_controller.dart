import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/helpers/time_of_day.dart';
import '../../domain/duration_state.dart';

final durationControllerProvider =
    StateNotifierProvider<DurationController, DurationState>((ref) {
  return DurationController();
});

class DurationController extends StateNotifier<DurationState> {
  DurationController() : super(const DurationState()) {
    _recalculateFromTimes();
  }

  void setHours(int h) {
    final fixed = h.clamp(1, 24);

    final newEnd = addMinutes(state.start, fixed * 60);

    state = state.copyWith(
      hours: fixed,
      end: newEnd,
    );
  }

  void setStart(TimeOfDay t) {
    final rounded = roundTo15(t);

    final newHours = _calcHoursBetween(rounded, state.end);

    state = state.copyWith(
      start: rounded,
      hours: newHours,
    );
  }

  void setEnd(TimeOfDay t) {
    final rounded = roundTo15(t);

    final newHours = _calcHoursBetween(state.start, rounded);

    state = state.copyWith(
      end: rounded,
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

  void incrementEnd([int minutes = 15]) {
    final newEnd = addMinutes(state.end, minutes);
    setEnd(newEnd);
  }

  void decrementEnd([int minutes = 15]) {
    final newEnd = addMinutes(state.end, -minutes);
    setEnd(newEnd);
  }

  int _calcHoursBetween(TimeOfDay start, TimeOfDay end) {
    final startTotalMinutes = start.hour * 60 + start.minute;
    final endTotalMinutes = end.hour * 60 + end.minute;

    final diffMinutes = endTotalMinutes - startTotalMinutes;

    if (diffMinutes <= 0) return 1;

    final diffHoursDouble = diffMinutes / 60.0;
    final hoursInt = diffHoursDouble.ceil();

    return hoursInt.clamp(1, 24);
  }

  void _recalculateFromTimes() {
    final newHours = _calcHoursBetween(state.start, state.end);
    state = state.copyWith(hours: newHours);
  }

  void goToStep(int step) {
    state = state.copyWith(activeStep: step);
  }
}
