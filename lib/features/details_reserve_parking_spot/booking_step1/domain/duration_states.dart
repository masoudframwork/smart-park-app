import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/duration_state.dart';


final durationControllerProvider =
StateNotifierProvider<DurationController, DurationState>(
      (ref) => DurationController(),
);

class DurationController extends StateNotifier<DurationState> {
  DurationController() : super(const DurationState());

  void setHours(double hours) {
    final end = _addMinutes(state.start, (hours * 60).round());
    state = state.copyWith(hours: hours, end: end);
  }

  void setCustomRange(TimeOfDay start, TimeOfDay end) {
    final diffMinutes = _diffMinutes(start, end);
    final rounded = (diffMinutes / 30).round() * 30;
    final hours = rounded / 60.0;
    final fixedEnd = _addMinutes(start, rounded);
    state = state.copyWith(start: start, end: fixedEnd, hours: hours);
  }

  void incrementStart(int minutes) {
    final s = _addMinutes(state.start, minutes);
    final e = _addMinutes(s, (state.hours * 60).round());
    state = state.copyWith(start: s, end: e);
  }

  void decrementStart(int minutes) {
    final s = _addMinutes(state.start, -minutes);
    final e = _addMinutes(s, (state.hours * 60).round());
    state = state.copyWith(start: s, end: e);
  }

  void incrementEnd(int minutes) {
    final e = _addMinutes(state.end, minutes);
    final diff = _diffMinutes(state.start, e);
    state = state.copyWith(end: e, hours: diff / 60.0);
  }

  void decrementEnd(int minutes) {
    final e = _addMinutes(state.end, -minutes);
    final diff = _diffMinutes(state.start, e);
    state = state.copyWith(end: e, hours: diff / 60.0);
  }

  TimeOfDay _addMinutes(TimeOfDay t, int minutes) {
    final base = DateTime(2000, 1, 1, t.hour, t.minute);
    final res = base.add(Duration(minutes: minutes));
    return TimeOfDay(hour: res.hour, minute: res.minute);
  }

  int _diffMinutes(TimeOfDay start, TimeOfDay end) {
    final s = DateTime(2000, 1, 1, start.hour, start.minute);
    var e = DateTime(2000, 1, 1, end.hour, end.minute);
    if (!e.isAfter(s)) {
      e = e.add(const Duration(days: 1));
    }
    return e.difference(s).inMinutes;
  }
}
