import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const int kNafathRefreshSeconds = 23;

final nafathTimerProvider =
    StateNotifierProvider.autoDispose<NafathTimerNotifier, int>(
  (ref) => NafathTimerNotifier(),
);

class NafathTimerNotifier extends StateNotifier<int> {
  Timer? _timer;

  NafathTimerNotifier() : super(kNafathRefreshSeconds) {
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

  void _onTimerFinished() async {
    restart();
  }

  void restart() {
    state = kNafathRefreshSeconds;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
