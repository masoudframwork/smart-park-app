import 'package:flutter/material.dart';

class DurationState {
  final int activeStep;
  final double hours;
  final TimeOfDay start;
  final TimeOfDay end;
  final double hourlyPrice;
  final int capacityUsed;
  final int capacityTotal;

  const DurationState({
    this.activeStep = 1,
    this.hours = 0.0,
    this.start = const TimeOfDay(hour: 0, minute: 0),
    this.end = const TimeOfDay(hour: 0, minute: 0),
    this.hourlyPrice = 5,
    this.capacityUsed = 13,
    this.capacityTotal = 70,
  });

  double get total => hours * hourlyPrice;

  DurationState copyWith({
    int? activeStep,
    double? hours,
    TimeOfDay? start,
    TimeOfDay? end,
    double? hourlyPrice,
    int? capacityUsed,
    int? capacityTotal,
  }) {
    return DurationState(
      activeStep: activeStep ?? this.activeStep,
      hours: hours ?? this.hours,
      start: start ?? this.start,
      end: end ?? this.end,
      hourlyPrice: hourlyPrice ?? this.hourlyPrice,
      capacityUsed: capacityUsed ?? this.capacityUsed,
      capacityTotal: capacityTotal ?? this.capacityTotal,
    );
  }
}
