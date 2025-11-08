import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/the_vehicle_model.dart';
import '../../domain/the_vehicle_state.dart';

class VehicleController extends StateNotifier<VehicleScreenState> {
  VehicleController() : super(VehicleScreenState.initial());

  void selectVehicle(String id) {
    state = state.copyWith(selectedId: id);
  }

  Future<void> loadFromApiMock() async {}

  void addVehicle({
    required String id,
    required String title,
  }) {
    final newList = [...state.vehicles];

    final addNewIndex = newList.indexWhere((v) => v.isAddNew);
    if (addNewIndex != -1) {
      newList.insert(
        addNewIndex,
        VehicleItem(
          id: id,
          title: title,
          isAddNew: false,
        ),
      );
    } else {
      newList.add(
        VehicleItem(
          id: id,
          title: title,
          isAddNew: false,
        ),
      );
    }

    state = state.copyWith(
      vehicles: newList,
      selectedId: id,
    );
  }
}

final vehicleScreenProvider =
    StateNotifierProvider<VehicleController, VehicleScreenState>(
  (ref) => VehicleController(),
);
