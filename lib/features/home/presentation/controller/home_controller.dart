import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/location_service.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initial());

  Future<void> initializeMap() async {
    try {
      final locationService = LocationService();

      // Check if location services are enabled
      final isEnabled = await locationService.isLocationServiceEnabled();
      if (!isEnabled) {
        state = state.copyWith(error: 'Location services are disabled');
        return;
      }

      // Get current position
      final position = await locationService.getCurrentLocation();
      if (position == null) {
        state = state.copyWith(error: 'Failed to get current location');
        return;
      }

      // Get nearby locations
      final nearbyLocations = await locationService.getNearbyLocations(
        position.latitude,
        position.longitude,
        1.0, // 1km radius
      );

      // Create custom markers
      final markers = _createCustomMarkers(nearbyLocations);

      state = state.copyWith(
        userLocation: LatLng(position.latitude, position.longitude),
        markers: markers,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to initialize map: $e',
        isLoading: false,
      );
    }
  }

  Set<Marker> _createCustomMarkers(List<Map<String, dynamic>> locations) {
    final markers = <Marker>{};

    for (int i = 0; i < locations.length; i++) {
      final location = locations[i];
      markers.add(
        Marker(
          markerId: MarkerId(location['id'] ?? 'marker_$i'),
          position: LatLng(location['lat'], location['lng']),
          infoWindow: InfoWindow(
            title: location['title'],
            snippet: location['description'],
          ),
          onTap: () => _onMarkerTapped(i, location),
        ),
      );
    }

    return markers;
  }

  void _onMarkerTapped(int index, Map<String, dynamic> location) {
    // Handle marker tap action
    state = state.copyWith(
      selectedMarker: location,
      selectedMarkerIndex: index,
    );

    // You can add more specific actions based on marker type
    switch (location['type']) {
      case 'parking':
        _handleParkingAction(location);
        break;
      case 'charging':
        _handleChargingAction(location);
        break;
      case 'service':
        _handleServiceAction(location);
        break;
    }
  }

  void _handleParkingAction(Map<String, dynamic> location) {
    // Implement parking-specific action
    print('Parking action for: ${location['title']}');
  }

  void _handleChargingAction(Map<String, dynamic> location) {
    // Implement charging-specific action
    print('Charging action for: ${location['title']}');
  }

  void _handleServiceAction(Map<String, dynamic> location) {
    // Implement service-specific action
    print('Service action for: ${location['title']}');
  }

  void clearSelection() {
    state = state.copyWith(
      selectedMarker: null,
      selectedMarkerIndex: -1,
    );
  }
}

class HomeState {
  final LatLng? userLocation;
  final Set<Marker> markers;
  final bool isLoading;
  final String? error;
  final Map<String, dynamic>? selectedMarker;
  final int selectedMarkerIndex;

  HomeState({
    this.userLocation,
    required this.markers,
    required this.isLoading,
    this.error,
    this.selectedMarker,
    this.selectedMarkerIndex = -1,
  });

  factory HomeState.initial() {
    return HomeState(
      markers: {},
      isLoading: true,
    );
  }

  HomeState copyWith({
    LatLng? userLocation,
    Set<Marker>? markers,
    bool? isLoading,
    String? error,
    Map<String, dynamic>? selectedMarker,
    int? selectedMarkerIndex,
  }) {
    return HomeState(
      userLocation: userLocation ?? this.userLocation,
      markers: markers ?? this.markers,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedMarker: selectedMarker ?? this.selectedMarker,
      selectedMarkerIndex: selectedMarkerIndex ?? this.selectedMarkerIndex,
    );
  }
}

// Provider
final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(),
);
