import 'dart:async' show Timer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/booking/domain/models/timer_state.dart';
import 'package:smart/features/booking/presentation/controller/booking_controller.dart'
    show reservationController;

class TimerController extends StateNotifier<TimerState> {
  Timer? _timer;
  final DateTime startTime;
  final DateTime endTime;

  TimerController({
    required this.startTime,
    required this.endTime,
  }) : super(TimerState(
          remainingTime: Duration.zero,
          progress: 0.0,
        )) {
    _startTimer();
  }

  void _startTimer() {
    _updateTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateTimer();
    });
  }

  void _updateTimer() {
    final now = DateTime.now();

    if (now.isBefore(startTime)) {
      state = TimerState(
        remainingTime: Duration.zero,
        progress: 0.0,
      );
      return;
    }

    if (now.isAfter(endTime)) {
      state = TimerState(
        remainingTime: Duration.zero,
        progress: 1.0,
      );
      _timer?.cancel();
      return;
    }

    final totalDuration = endTime.difference(startTime);
    final elapsed = now.difference(startTime);
    final remaining = endTime.difference(now);

    state = TimerState(
      remainingTime: remaining,
      progress: elapsed.inSeconds / totalDuration.inSeconds,
    );
  }

  String getFormattedTime() {
    final hours = state.remainingTime.inHours;
    final minutes = (state.remainingTime.inMinutes % 60);
    final seconds = (state.remainingTime.inSeconds % 60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final timerControllerProvider =
    StateNotifierProvider.family<TimerController, TimerState, String>(
  (ref, reservationId) {
    final reservations = ref.watch(reservationController).reservations;
    final reservation = reservations.firstWhere((r) => r.id == reservationId);

    return TimerController(
      startTime: reservation.startDateTime,
      endTime: reservation.endDateTime,
    );
  },
);
