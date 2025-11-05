import 'package:latlong2/latlong.dart';
import 'parking_location.dart';

class HomeModel {
  final LatLng? userLocation;
  final List<ParkingLocation> locations;
  final bool isLoading;
  final String? error;
  final ParkingLocation? selectedMarker;
  final int selectedMarkerIndex;
  final bool isSearchOpen;

  HomeModel({
    this.userLocation,
    required this.locations,
    required this.isLoading,
    this.error,
    this.selectedMarker,
    this.selectedMarkerIndex = -1,
    this.isSearchOpen = false,

  });

  // Initial empty state
  factory HomeModel.initial() {
    return HomeModel(
      userLocation: null,
      locations: [],
      isLoading: true,
      error: null,
      selectedMarker: null,
      selectedMarkerIndex: -1,
      isSearchOpen: false,

    );
  }

  // Dummy data initialization (kept for fallback/testing)
  factory HomeModel.withDummyData() {
    return HomeModel(
      userLocation: const LatLng(24.7136, 46.6753), // Riyadh coordinates
      locations: _generateDummyLocations(),
      isLoading: false,
      error: null,
      selectedMarker: null,
      selectedMarkerIndex: -1,
      isSearchOpen: false,
    );
  }

  static List<ParkingLocation> _generateDummyLocations() {
    final baseLat = 24.7136;
    final baseLng = 46.6753;

    return [
      ParkingLocation(
        id: 'parking_1',
        lat: baseLat + 0.001,
        lng: baseLng + 0.001,
        title: 'المنطقة 013',
        description: 'Available parking space',
        type: 'parking',
        isAvailable: true,
        price: '5',
        distance: 0.5,
        availableSpots: 13,
        totalSpots: 70,
        imageUrl: null,
      ),
      ParkingLocation(
        id: 'parking_2',
        lat: baseLat - 0.001,
        lng: baseLng + 0.001,
        title: 'المنطقة 014',
        description: 'Available parking space',
        type: 'parking',
        isAvailable: true,
        price: '6',
        distance: 0.8,
        availableSpots: 25,
        totalSpots: 80,
        imageUrl: null,
      ),
      ParkingLocation(
        id: 'parking_3',
        lat: baseLat + 0.001,
        lng: baseLng - 0.001,
        title: 'المنطقة 015',
        description: 'Available parking space',
        type: 'parking',
        isAvailable: false,
        price: '5.5',
        distance: 1.2,
        availableSpots: 0,
        totalSpots: 60,
        imageUrl: null,
      ),
      ParkingLocation(
        id: 'parking_4',
        lat: baseLat - 0.001,
        lng: baseLng - 0.001,
        title: 'المنطقة 016',
        description: 'Available parking space',
        type: 'parking',
        isAvailable: true,
        price: '7',
        distance: 1.5,
        availableSpots: 45,
        totalSpots: 90,
        imageUrl: null,
      ),
      ParkingLocation(
        id: 'parking_5',
        lat: baseLat + 0.002,
        lng: baseLng,
        title: 'المنطقة 017',
        description: 'Available parking space',
        type: 'parking',
        isAvailable: true,
        price: '4.5',
        distance: 0.9,
        availableSpots: 30,
        totalSpots: 75,
        imageUrl: null,
      ),
      ParkingLocation(
        id: 'charging_1',
        lat: baseLat,
        lng: baseLng + 0.002,
        title: 'EV Charging Station 1',
        description: 'Electric vehicle charging point',
        type: 'charging',
        isAvailable: true,
        price: '2.5',
        distance: 1.0,
        imageUrl: null,
      ),
      ParkingLocation(
        id: 'charging_2',
        lat: baseLat + 0.002,
        lng: baseLng + 0.002,
        title: 'EV Charging Station 2',
        description: 'Electric vehicle charging point',
        type: 'charging',
        isAvailable: true,
        price: '3',
        distance: 1.3,
        imageUrl: null,
      ),
      ParkingLocation(
        id: 'service_1',
        lat: baseLat - 0.002,
        lng: baseLng,
        title: 'Service Center 1',
        description: 'Vehicle service and maintenance',
        type: 'service',
        isAvailable: true,
        price: null,
        distance: 1.8,
        rating: 4.5,
        imageUrl: null,
      ),
    ];
  }

  HomeModel copyWith({
    LatLng? userLocation,
    List<ParkingLocation>? locations,
    bool? isLoading,
    String? error,
    ParkingLocation? selectedMarker,
    int? selectedMarkerIndex,
    bool? isSearchOpen,
  }) {
    return HomeModel(
      userLocation: userLocation ?? this.userLocation,
      locations: locations ?? this.locations,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedMarker: selectedMarker,
      selectedMarkerIndex: selectedMarkerIndex ?? this.selectedMarkerIndex,

      isSearchOpen: isSearchOpen ?? this.isSearchOpen,
    );
  }
}
