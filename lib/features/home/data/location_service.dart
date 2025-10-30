import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();
Future<Position?> getCurrentLocation() async {
  try {
    print('Checking location services...');
    
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('Location services enabled: $serviceEnabled');
    
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check location permission
    print('Checking permission...');
    LocationPermission permission = await Geolocator.checkPermission();
    print('Current permission: $permission');
    
    if (permission == LocationPermission.denied) {
      print('Requesting permission...');
      permission = await Geolocator.requestPermission();
      print('Permission after request: $permission');
      
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    // Get current position
    print('Getting current position...');
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
    print('Got position: ${position.latitude}, ${position.longitude}');
    
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

    // Generate charging stations
    for (int i = 0; i < 3; i++) {
      final latOffset = (i - 1) * 0.002;
      final lngOffset = (i % 2 == 0 ? 1 : -1) * 0.002;

      locations.add({
        'id': 'charging_$i',
        'lat': userLat + latOffset,
        'lng': userLng + lngOffset,
        'title': 'EV Charging Station ${i + 1}',
        'description': 'Electric vehicle charging point',
        'type': 'charging',
        'isAvailable': true,
        'price': '2.50',
        'power': '50kW',
        'distance': _calculateDistance(
          userLat,
          userLng,
          userLat + latOffset,
          userLng + lngOffset,
        ),
      });
    }

    // Generate service centers
    for (int i = 0; i < 2; i++) {
      final latOffset = (i == 0 ? 0.003 : -0.003);
      final lngOffset = (i == 0 ? 0.003 : -0.003);

      locations.add({
        'id': 'service_$i',
        'lat': userLat + latOffset,
        'lng': userLng + lngOffset,
        'title': 'Service Center ${i + 1}',
        'description': 'Vehicle service and maintenance',
        'type': 'service',
        'isAvailable': true,
        'rating': 4.5,
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
