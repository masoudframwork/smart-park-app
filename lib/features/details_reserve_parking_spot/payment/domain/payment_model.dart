import 'package:flutter/material.dart';

class PaymentMethodModel {
  final String id;
  final String line1;
  final String? line2;

  final String? assetImage;

  final IconData? icon;

  final Color? assetColor;

  final double logoMaxW;
  final double logoMaxH;

  const PaymentMethodModel({
    required this.id,
    required this.line1,
    this.line2,
    this.assetImage,
    this.icon,
    this.assetColor,
    this.logoMaxW = 61,
    this.logoMaxH = 43,
  });

  bool get _isVisa => (assetImage ?? '').toLowerCase().contains('visa');

  bool get _isPay => (assetImage ?? '').toLowerCase().contains('pay');

  bool get hasLogoBorder => _isVisa || _isPay;
}
