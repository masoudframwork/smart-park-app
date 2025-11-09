// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../../../../../core/helpers/time_of_day.dart';
// import '../../domain/duration_state.dart';
//
// final durationControllerProvider =
//     StateNotifierProvider<DurationController, DurationState>((ref) {
//   return DurationController();
// });
//
// class DurationController extends StateNotifier<DurationState> {
//   DurationController() : super(const DurationState()) {
//     _recalculateFromTimes();
//   }
//
//   void setHours(int h) {
//     final fixed = h.clamp(1, 24);
//
//     final newEnd = addMinutes(state.start, fixed * 60);
//
//     state = state.copyWith(
//       hours: fixed,
//       end: newEnd,
//     );
//   }
//
//   void setStart(TimeOfDay t) {
//     final rounded = roundTo15(t);
//
//     final newHours = _calcHoursBetween(rounded, state.end);
//
//     state = state.copyWith(
//       start: rounded,
//       hours: newHours,
//     );
//   }
//
//   void setEnd(TimeOfDay t) {
//     final rounded = roundTo15(t);
//
//     final newHours = _calcHoursBetween(state.start, rounded);
//
//     state = state.copyWith(
//       end: rounded,
//       hours: newHours,
//     );
//   }
//
//   void incrementStart([int minutes = 15]) {
//     final newStart = addMinutes(state.start, minutes);
//     setStart(newStart);
//   }
//
//   void decrementStart([int minutes = 15]) {
//     final newStart = addMinutes(state.start, -minutes);
//     setStart(newStart);
//   }
//
//   void incrementEnd([int minutes = 15]) {
//     final newEnd = addMinutes(state.end, minutes);
//     setEnd(newEnd);
//   }
//
//   void decrementEnd([int minutes = 15]) {
//     final newEnd = addMinutes(state.end, -minutes);
//     setEnd(newEnd);
//   }
//
//   int _calcHoursBetween(TimeOfDay start, TimeOfDay end) {
//     final startTotalMinutes = start.hour * 60 + start.minute;
//     final endTotalMinutes = end.hour * 60 + end.minute;
//
//     final diffMinutes = endTotalMinutes - startTotalMinutes;
//
//     if (diffMinutes <= 0) return 1;
//
//     final diffHoursDouble = diffMinutes / 60.0;
//     final hoursInt = diffHoursDouble.ceil();
//
//     return hoursInt.clamp(1, 24);
//   }
//
//   void _recalculateFromTimes() {
//     final newHours = _calcHoursBetween(state.start, state.end);
//     state = state.copyWith(hours: newHours);
//   }
//
//   void goToStep(int step) {
//     state = state.copyWith(activeStep: step);
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/duration_state.dart';

final durationControllerProvider =
    StateNotifierProvider<DurationController, DurationState>(
  (ref) => DurationController(),
);

class DurationController extends StateNotifier<DurationState> {
  DurationController() : super(const DurationState());

  // تغيير المدة السريعة (نص ساعة، ساعة، ...)
  void setHours(double hours) {
    // ثبّت النهاية بحسب البداية + الساعات الجديدة
    final end = _addMinutes(state.start, (hours * 60).round());
    state = state.copyWith(hours: hours, end: end);
  }

  // تطبيق فترة مخصّصة بعد الضغط على "تحديث"
  void setCustomRange(TimeOfDay start, TimeOfDay end) {
    // احسب الفرق بالدقائق (يدعم عبور منتصف الليل)
    final diffMinutes = _diffMinutes(start, end);
    // قرّب لأقرب 30 دقيقة
    final rounded = (diffMinutes / 30).round() * 30;
    final hours = rounded / 60.0;
    final fixedEnd = _addMinutes(start, rounded);
    state = state.copyWith(start: start, end: fixedEnd, hours: hours);
  }

  // أزرار +/− في شيت المدة (فوريًا لو حبيت تستخدمها مباشرة)
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

  // ===== Helpers =====
  TimeOfDay _addMinutes(TimeOfDay t, int minutes) {
    final base = DateTime(2000, 1, 1, t.hour, t.minute);
    final res = base.add(Duration(minutes: minutes));
    return TimeOfDay(hour: res.hour, minute: res.minute);
  }

  // فرق الدقائق بين start -> end (يدعم عبور منتصف الليل)
  int _diffMinutes(TimeOfDay start, TimeOfDay end) {
    final s = DateTime(2000, 1, 1, start.hour, start.minute);
    var e = DateTime(2000, 1, 1, end.hour, end.minute);
    if (!e.isAfter(s)) {
      // لو النهاية <= البداية اعتبرها لليوم التالي
      e = e.add(const Duration(days: 1));
    }
    return e.difference(s).inMinutes;
  }
}
