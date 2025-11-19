import 'package:flutter/material.dart';

enum VehicleType {
  saudi,
  nonSaudi,
}

@immutable
class VehicleFormState {
  final VehicleType vehicleType;

  // سعودي
  final String? plateType; // نوع اللوحة
  final String saudiNumbers; // أرقام اللوحة)
  final String saudiLetters; // حروف اللوحة

  // غير سعودي
  final String nonSaudiPlate; // رقم اللوحة

  // مشترك
  final String? vehicleColor; // لون المركبة
  final String? avatar; // الصورة الرمزية
  final bool saveForLater; // احفظ المركبة للاستخدام لاحقاً

  final bool isSubmitting;
  final bool showErrors;

  const VehicleFormState({
    this.vehicleType = VehicleType.saudi,
    this.plateType,
    this.saudiNumbers = '',
    this.saudiLetters = '',
    this.nonSaudiPlate = '',
    this.vehicleColor,
    this.avatar,
    this.saveForLater = false,
    this.isSubmitting = false,
    this.showErrors = false,
  });

  bool get isSaudi => vehicleType == VehicleType.saudi;

  bool get canSubmit {
    if (isSaudi) {
      return plateType != null &&
          plateType!.isNotEmpty &&
          saudiNumbers.length == 4 &&
          saudiLetters.length == 3 &&
          (vehicleColor?.isNotEmpty ?? false) &&
          (avatar?.isNotEmpty ?? false);
    } else {
      return nonSaudiPlate.isNotEmpty &&
          (vehicleColor?.isNotEmpty ?? false) &&
          (avatar?.isNotEmpty ?? false);
    }
  }

  VehicleFormState copyWith({
    VehicleType? vehicleType,
    String? plateType,
    String? saudiNumbers,
    String? saudiLetters,
    String? nonSaudiPlate,
    String? vehicleColor,
    String? avatar,
    bool? saveForLater,
    bool? isSubmitting,
    bool? showErrors,
  }) {
    return VehicleFormState(
      vehicleType: vehicleType ?? this.vehicleType,
      plateType: plateType ?? this.plateType,
      saudiNumbers: saudiNumbers ?? this.saudiNumbers,
      saudiLetters: saudiLetters ?? this.saudiLetters,
      nonSaudiPlate: nonSaudiPlate ?? this.nonSaudiPlate,
      vehicleColor: vehicleColor ?? this.vehicleColor,
      avatar: avatar ?? this.avatar,
      saveForLater: saveForLater ?? this.saveForLater,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showErrors: showErrors ?? this.showErrors,
    );
  }
}
