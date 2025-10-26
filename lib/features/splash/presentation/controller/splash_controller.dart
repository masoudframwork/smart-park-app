import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashController = ChangeNotifierProvider.autoDispose(
  (ref) => SplashController(),
);

class SplashController extends ChangeNotifier {
  int val = 0;

  void incrementVal() {
    val++;
    notifyListeners();
  }
}
