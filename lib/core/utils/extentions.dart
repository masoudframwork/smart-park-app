import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

extension Context on BuildContext {
  T read<T>(ProviderBase<T> provider) {
    return ProviderScope.containerOf(this, listen: false).read(provider);
  }
}

extension DateTimeFormatting on DateTime {
  String toFormattedString({String? format}) {
    return DateFormat(format ?? 'yyyy-MM-dd HH:mm:ss').format(this);
  }
}
