import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart'; 
import '../../data/location_service.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initial());

  Future<void> initializeMap() async {
    state = state.copyWith(isLoading: true);
    
    try {
      final locationService = LocationService();

      await locationService.requestLocationPermission();

      final isEnabled = await locationService.isLocationServiceEnabled();
      if (!isEnabled) {
        state = state.copyWith(
          error: 'Location services are disabled. Please enable them in settings.',
          isLoading: false,
        );
        return;
      }

      final position = await locationService.getCurrentLocation();
      if (position == null) {
        state = state.copyWith(
          error: 'Failed to get current location',
          isLoading: false,
        );
        return;
      }

      final nearbyLocations = await locationService.getNearbyLocations(
        position.latitude,
        position.longitude,
        1.0,
      );

      state = state.copyWith(
        userLocation: LatLng(position.latitude, position.longitude),
        locations: nearbyLocations,
        isLoading: false,
      );
    } catch (e) {
      print('Error initializing map: $e');
      state = state.copyWith(
        error: 'Failed to initialize map: $e',
        isLoading: false,
      );
    }
  }

  void selectMarker(Map<String, dynamic> location, int index) {
    state = state.copyWith(
      selectedMarker: location,
      selectedMarkerIndex: index,
    );

    switch (location['type']) {
      case 'parking':
        print('Parking action for: ${location['title']}');
        break;
      case 'charging':
        print('Charging action for: ${location['title']}');
        break;
      case 'service':
        print('Service action for: ${location['title']}');
        break;
    }
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

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(),
);