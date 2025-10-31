class TimerState {
  final Duration remainingTime;
  final double progress;

  TimerState({
    required this.remainingTime,
    required this.progress,
  });

  TimerState copyWith({
    Duration? remainingTime,
    double? progress,
  }) {
    return TimerState(
      remainingTime: remainingTime ?? this.remainingTime,
      progress: progress ?? this.progress,
    );
  }
}
