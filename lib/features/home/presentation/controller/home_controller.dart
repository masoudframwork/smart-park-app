import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:smart/features/home/data/models/home_model.dart';
import 'package:smart/features/home/data/models/parking_location.dart';
import 'package:smart/features/home/data/location_service.dart';

class HomeController extends ChangeNotifier {
  final LocationService _locationService = LocationService();

  HomeController() : _model = HomeModel.initial();

  HomeModel _model;
  HomeModel get state => _model;

  Future<void> initializeMap() async {
    _model = _model.copyWith(isLoading: true);
    notifyListeners();

    try {
      // Request location permission
      await _locationService.requestLocationPermission();

      // Check if location services are enabled
      final isEnabled = await _locationService.isLocationServiceEnabled();
      if (!isEnabled) {
        _model = _model.copyWith(
          error:
              'Location services are disabled. Please enable them in settings.',
          isLoading: false,
        );
        notifyListeners();
        return;
      }

      // Get current user location
      final position = await _locationService.getCurrentLocation();
      if (position == null) {
        _model = _model.copyWith(
          error: 'Failed to get current location',
          isLoading: false,
        );
        notifyListeners();
        return;
      }

      final userLocation = LatLng(position.latitude, position.longitude);

      // Update model with user location
      _model = _model.copyWith(userLocation: userLocation, isLoading: true);
      notifyListeners();

      // Get nearby locations based on user location
      final nearbyLocations = await _locationService.getNearbyLocations(
        position.latitude,
        position.longitude,
        1.0, // 1 km radius
      );

      // Update model with locations
      _model = _model.copyWith(
        locations: nearbyLocations,
        isLoading: false,
        error: null,
      );
      notifyListeners();
    } catch (e) {
      _model = _model.copyWith(
        error: 'Failed to initialize map: $e',
        isLoading: false,
      );
      notifyListeners();
    }
  }

  void selectMarker(ParkingLocation location, int index) {
    _model = _model.copyWith(
      selectedMarker: location,
      selectedMarkerIndex: index,
    );
    notifyListeners();
  }

  void clearSelection() {
    _model = _model.copyWith(selectedMarker: null, selectedMarkerIndex: -1);
    notifyListeners();
  }

  void openSearch() {
    _model = _model.copyWith(isSearchOpen: true);
    notifyListeners();
  }

  void closeSearch() {
    _model = _model.copyWith(isSearchOpen: false);
    notifyListeners();
  }


}

final homeControllerProvider = ChangeNotifierProvider(
  (ref) => HomeController(),
);
