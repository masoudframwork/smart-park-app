import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int kOtpResendSeconds = 23;

final sendCodeTimerProvider =
    StateNotifierProvider.autoDispose<SendCodeTimerNotifier, int>(
  (ref) => SendCodeTimerNotifier(),
);

class SendCodeTimerNotifier extends StateNotifier<int> {
  Timer? _timer;

  SendCodeTimerNotifier() : super(kOtpResendSeconds) {
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state = state - 1;
      } else {
        timer.cancel();
        _onTimerFinished();
      }
    });
  }

  void _onTimerFinished() {
    restart();
  }

  void restart() {
    state = kOtpResendSeconds;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final codeControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();

  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});
