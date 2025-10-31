 import 'package:flutter/material.dart';

TimeOfDay addMinutes(TimeOfDay t, int minutes) {
final total = t.hour * 60 + t.minute + minutes;
final wrapped = (total % (24 * 60) + 24 * 60) % (24 * 60);
final h = wrapped ~/ 60;
final m = wrapped % 60;
return TimeOfDay(hour: h, minute: m);
}


TimeOfDay roundTo15(TimeOfDay t) {
final mod = t.minute % 15;
final down = t.minute - mod;
final up = mod == 0 ? t.minute : down + 15;
// قرب للأقرب
final useUp = mod >= 8; // >= نصف الربع
return TimeOfDay(hour: t.hour, minute: useUp ? up % 60 : down);
}
