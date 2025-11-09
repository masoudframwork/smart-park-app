import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/image_string.dart';

class VehicleOption {
  final String title;
  final String assetSvg;
  const VehicleOption({required this.title, required this.assetSvg});
}

final vehicleOptionsProvider = Provider<List<VehicleOption>>((ref) {
  return const [
    VehicleOption(
      title: 'نيسان باتفايندر 2023 / أسود',
      assetSvg: AppImages.carVehicleCar2,
    ),
    VehicleOption(
      title: 'تويوتا كورولا 2024 / أحمر',
      assetSvg: AppImages.carVehicleCar1,
    ),
  ];
});

final selectedVehicleIndexProvider = StateProvider<int>((ref) => 0);
