
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTimeFormState {
  final String hoursText;
  final String minutesText;

  const CustomTimeFormState({
    this.hoursText = '',
    this.minutesText = '',
  });

  int get intHours => int.tryParse(hoursText) ?? 0;
  int get intMinutes => int.tryParse(minutesText) ?? 0;

  bool get is24Hours => intHours >= 24;

  CustomTimeFormState copyWith({
    String? hoursText,
    String? minutesText,
  }) {
    return CustomTimeFormState(
      hoursText: hoursText ?? this.hoursText,
      minutesText: minutesText ?? this.minutesText,
    );
  }
}

class CustomTimeFormController extends StateNotifier<CustomTimeFormState> {
  CustomTimeFormController() : super(const CustomTimeFormState());

  void setHours(String value) {
    final digits = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.isEmpty) {
      state = state.copyWith(hoursText: '', minutesText: state.minutesText);
      return;
    }

    int h = int.parse(digits);
    if (h > 24) h = 24;

    final hoursStr = h.toString().padLeft(2, '0');

    String minutesStr = state.minutesText;
    if (h >= 24) {
      minutesStr = '00';
    }

    state = state.copyWith(
      hoursText: hoursStr,
      minutesText: minutesStr,
    );
  }

  void setMinutes(String value) {
    if (state.is24Hours) {
      if (state.minutesText != '00') {
        state = state.copyWith(minutesText: '00');
      }
      return;
    }

    final digits = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.isEmpty) {
      state = state.copyWith(minutesText: '');
      return;
    }

    int m = int.parse(digits);
    if (m > 59) m = 59;

    final minutesStr = m.toString().padLeft(2, '0');

    state = state.copyWith(
      minutesText: minutesStr,
    );
  }

  void reset() {
    state = const CustomTimeFormState();
  }
}

final customTimeFormProvider =
StateNotifierProvider<CustomTimeFormController, CustomTimeFormState>(
      (ref) => CustomTimeFormController(),
);
