import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import '../../data/location_service.dart';

class HomeController extends ChangeNotifier {
  HomeController() : _state = HomeState.initial();

  HomeState _state;
  HomeState get state => _state;

  Future<void> initializeMap() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final locationService = LocationService();

      await locationService.requestLocationPermission();

      final isEnabled = await locationService.isLocationServiceEnabled();
      if (!isEnabled) {
        _state = _state.copyWith(
          error:
              'Location services are disabled. Please enable them in settings.',
          isLoading: false,
        );
        notifyListeners();
        return;
      }

      final position = await locationService.getCurrentLocation();
      if (position == null) {
        _state = _state.copyWith(
          error: 'Failed to get current location',
          isLoading: false,
        );
        notifyListeners();
        return;
      }

      final nearbyLocations = await locationService.getNearbyLocations(
        position.latitude,
        position.longitude,
        1.0,
      );

      _state = _state.copyWith(
        userLocation: LatLng(position.latitude, position.longitude),
        locations: nearbyLocations,
        isLoading: false,
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        error: 'Failed to initialize map: $e',
        isLoading: false,
      );
      notifyListeners();
    }
  }

  void selectMarker(Map<String, dynamic> location, int index) {
    _state = _state.copyWith(
      selectedMarker: location,
      selectedMarkerIndex: index,
    );
    notifyListeners();
  }

  void clearSelection() {
    _state = _state.copyWith(
      selectedMarker: null,
      selectedMarkerIndex: -1,
    );
    notifyListeners();
  }
}

class HomeState {
  final LatLng? userLocation;
  final List<Map<String, dynamic>> locations;
  final bool isLoading;
  final String? error;
  final Map<String, dynamic>? selectedMarker;
  final int selectedMarkerIndex;

  HomeState({
    this.userLocation,
    required this.locations,
    required this.isLoading,
    this.error,
    this.selectedMarker,
    this.selectedMarkerIndex = -1,
  });

  factory HomeState.initial() {
    return HomeState(
      locations: [],
      isLoading: true,
    );
  }

  HomeState copyWith({
    LatLng? userLocation,
    List<Map<String, dynamic>>? locations,
    bool? isLoading,
    String? error,
    Map<String, dynamic>? selectedMarker,
    int? selectedMarkerIndex,
  }) {
    return HomeState(
      userLocation: userLocation ?? this.userLocation,
      locations: locations ?? this.locations,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedMarker: selectedMarker,
      selectedMarkerIndex: selectedMarkerIndex ?? this.selectedMarkerIndex,
    );
  }
}

final homeControllerProvider = ChangeNotifierProvider(
  (ref) => HomeController(),
);
