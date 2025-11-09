import 'package:smart/features/details_reserve_parking_spot/the_vehicle/domain/the_vehicle_model.dart';

class VehicleScreenState {
  final List<VehicleItem> vehicles;
  final String? selectedId;
  final double total;

  const VehicleScreenState({
    required this.vehicles,
    required this.selectedId,
    required this.total,
  });

  VehicleScreenState copyWith({
    List<VehicleItem>? vehicles,
    String? selectedId,
    double? total,
  }) {
    return VehicleScreenState(
      vehicles: vehicles ?? this.vehicles,
      selectedId: selectedId ?? this.selectedId,
      total: total ?? this.total,
    );
  }

  factory VehicleScreenState.initial() {
    return VehicleScreenState(
      vehicles: [
        VehicleItem(
          id: '1',
          title: 'نيسان باتفايندر 2023 / أسود',
        ),
        VehicleItem(
          id: '2',
          title: 'تويوتا كورولا 2024 / أحمر',
        ),
        VehicleItem(
          id: 'add_new',
          title: 'مركبة أخرى',
          isAddNew: true,
        ),
      ],
      selectedId: '1',
      total: 30.0,
    );
  }
}
