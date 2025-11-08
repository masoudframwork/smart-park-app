import 'package:flutter/material.dart';

enum PaymentMethodType {
  card,
  wallet,
  addNewCard,
}

class PaymentMethodModel {
  final String id;

  final PaymentMethodType type;

  // السطر الأساسي (مثلاً "البطاقة المنتهية بـ 0000")
  final String line1;
  final String? line2;

  final String? assetImage;

  final IconData? icon;

  // تحكمات بالحجم (عشان حالة الرصيد كانت مختلفة)
  final double logoContentMaxWidth;
  final double logoContentMaxHeight;

  final Color? assetColor;

  const PaymentMethodModel({
    required this.id,
    required this.type,
    required this.line1,
    this.line2,
    this.assetImage,
    this.icon,
    this.logoContentMaxWidth = 70,
    this.logoContentMaxHeight = 48,
    this.assetColor,
  });

  bool get isAddNew => type == PaymentMethodType.addNewCard;
  bool get isWallet => type == PaymentMethodType.wallet;
}
