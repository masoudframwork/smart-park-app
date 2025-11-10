import 'package:flutter/animation.dart';

class PaymentMethodModel {
  final String id;
  final String line1;
  final String assetImage;
  final Color? assetColor;

  const PaymentMethodModel({
    required this.id,
    required this.line1,
    required this.assetImage,
    this.assetColor,
  });
}
