import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/parking_area_model.dart';

/// Provider to hold the selected parking card data
final selectedParkingAreaDetailsProvider =
    StateProvider<ParkingArea?>((ref) => null);
