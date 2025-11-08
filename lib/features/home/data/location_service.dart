import 'package:geolocator/geolocator.dart';
import 'models/parking_location.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  Future<Position?> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied');
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      return position;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ParkingLocation>> getNearbyLocations(
    double latitude,
    double longitude,
    double radiusInKm,
  ) async {
    // This is a mock implementation
    // In a real app, you would call your backend API here
    return _generateMockLocations(latitude, longitude, radiusInKm);
  }

  List<ParkingLocation> _generateMockLocations(
    double userLat,
    double userLng,
    double radiusInKm,
  ) {
    final locations = <ParkingLocation>[];

    // Generate parking spots around user location
    for (int i = 0; i < 5; i++) {
      final latOffset = (i - 2) * 0.001; // Spread markers around
      final lngOffset = (i % 2 == 0 ? 1 : -1) * 0.001;
      final spotLat = userLat + latOffset;
      final spotLng = userLng + lngOffset;

      locations.add(
        ParkingLocation(
          id: 'parking_$i',
          lat: spotLat,
          lng: spotLng,
          title: 'المنطقة ${013 + i}',
          description: 'Available parking space',
          type: 'parking',
          isAvailable: i % 3 != 0, // Some spots are occupied
          price: '${5.0 + (i * 0.5)}',
          distance: _calculateDistance(
            userLat,
            userLng,
            spotLat,
            spotLng,
          ),
          availableSpots: i % 3 != 0 ? 10 + (i * 3) : 0,
          totalSpots: 60 + (i * 5),
          imageUrl: null,
        ),
      );
    }

    // Generate charging stations
    for (int i = 0; i < 2; i++) {
      final latOffset = (i == 0 ? 0.002 : -0.002);
      final lngOffset = (i == 0 ? 0.002 : 0.001);
      final stationLat = userLat + latOffset;
      final stationLng = userLng + lngOffset;

      locations.add(
        ParkingLocation(
          id: 'charging_$i',
          lat: stationLat,
          lng: stationLng,
          title: 'EV Charging Station ${i + 1}',
          description: 'Electric vehicle charging point',
          type: 'charging',
          isAvailable: true,
          price: '${2.5 + (i * 0.5)}',
          distance: _calculateDistance(
            userLat,
            userLng,
            stationLat,
            stationLng,
          ),
          imageUrl: null,
        ),
      );
    }

    // Generate service center
    final serviceLat = userLat - 0.002;
    final serviceLng = userLng;
    locations.add(
      ParkingLocation(
        id: 'service_1',
        lat: serviceLat,
        lng: serviceLng,
        title: 'Service Center 1',
        description: 'Vehicle service and maintenance',
        type: 'service',
        isAvailable: true,
        price: null,
        distance: _calculateDistance(
          userLat,
          userLng,
          serviceLat,
          serviceLng,
        ),
        rating: 4.5,
        imageUrl: null,
      ),
    );

    return locations;
  }

  double _calculateDistance(
      double lat1, double lng1, double lat2, double lng2) {
    return Geolocator.distanceBetween(lat1, lng1, lat2, lng2) / 1000; // in km
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }

  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}
