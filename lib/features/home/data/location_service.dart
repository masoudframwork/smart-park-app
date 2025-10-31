import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();
  
  Future<Position?> getCurrentLocation() async {
    try {

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }


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

  Future<List<Map<String, dynamic>>> getNearbyLocations(
    double latitude,
    double longitude,
    double radiusInKm,
  ) async {
    // This is a mock implementation
    // In a real app, you would call your backend API here
    return _generateMockLocations(latitude, longitude, radiusInKm);
  }

  List<Map<String, dynamic>> _generateMockLocations(
    double userLat,
    double userLng,
    double radiusInKm,
  ) {
    final locations = <Map<String, dynamic>>[];

    // Generate parking spots
    for (int i = 0; i < 5; i++) {
      final latOffset = (i - 2) * 0.001; // Spread markers around
      final lngOffset = (i % 2 == 0 ? 1 : -1) * 0.001;

      locations.add({
        'id': 'parking_$i',
        'lat': userLat + latOffset,
        'lng': userLng + lngOffset,
        'title': 'Parking Spot ${i + 1}',
        'description': 'Available parking space',
        'type': 'parking',
        'isAvailable': i % 3 != 0, // Some spots are occupied
        'price': '5.00',
        'distance': _calculateDistance(
          userLat,
          userLng,
          userLat + latOffset,
          userLng + lngOffset,
        ),
      });
    }

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
