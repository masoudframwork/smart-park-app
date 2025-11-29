import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int kOtpResendSeconds = 23;

/// ✅ Timer Provider
final sendCodeTimerProvider =
StateNotifierProvider.autoDispose<SendOTPNotifier, int>(
      (ref) => SendOTPNotifier(),
);

class SendOTPNotifier extends StateNotifier<int> {
  Timer? _timer;

  SendOTPNotifier() : super(kOtpResendSeconds) {
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state = state - 1;
      } else {
        timer.cancel();
        // Timer stays at 0 until manually restarted
      }
    });
  }

  /// ✅ Manual restart (called when resend OTP is successful)
  void restart() {
    state = kOtpResendSeconds;
    _startTimer();
  }

  /// ✅ Check if timer is finished
  bool get isFinished => state == 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

/// ✅ Code Controller Provider
final codeControllerProvider =
Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();

  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});