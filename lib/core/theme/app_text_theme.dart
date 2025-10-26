import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  TextStyle mainBottonTextStyle() =>
      TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500);
  TextStyle secondaryBottonTextStyle() =>
      TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500);

  TextStyle titleTextStyle() =>
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700);
  TextStyle bodyLargeTextStyle() =>
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500);
}
