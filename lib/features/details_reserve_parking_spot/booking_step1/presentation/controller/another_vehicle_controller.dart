import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart/features/details_reserve_parking_spot/booking_step1/domain/vehicle_form_state.dart';

class VehicleFormController extends StateNotifier<VehicleFormState> {
  VehicleFormController() : super(const VehicleFormState());

  void setVehicleType(VehicleType type) {
    state = state.copyWith(vehicleType: type);
  }

  void setPlateType(String? type) {
    state = state.copyWith(plateType: type);
  }

  void setSaudiNumbers(String value) {
    state = state.copyWith(saudiNumbers: value.trim());
  }

  void setSaudiLetters(String value) {
    state = state.copyWith(saudiLetters: value.trim());
  }

  void setNonSaudiPlate(String value) {
    state = state.copyWith(nonSaudiPlate: value.trim());
  }

  void setVehicleColor(String? color) {
    state = state.copyWith(vehicleColor: color);
  }

  void setAvatar(String? avatar) {
    state = state.copyWith(avatar: avatar);
  }

  void toggleSaveForLater(bool value) {
    state = state.copyWith(saveForLater: value);
  }

  Future<void> submit(BuildContext context) async {
    if (!state.canSubmit) {
      state = state.copyWith(showErrors: true);
      return;
    }

    state = state.copyWith(isSubmitting: true);

    await Future.delayed(const Duration(milliseconds: 400));

    state = state.copyWith(isSubmitting: false);

    Navigator.of(context).pop();
  }
}

final vehicleFormControllerProvider =
    StateNotifierProvider<VehicleFormController, VehicleFormState>(
  (ref) => VehicleFormController(),
);
