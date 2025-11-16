class ParkingLocation {
  final String id;
  final double lat;
  final double lng;
  final String title;
  final String description;
  final String type; // 'parking', 'charging', 'service'
  final bool isAvailable;
  final String? price;
  final double? distance;
  final int? availableSpots;
  final int? totalSpots;
  final String? imageUrl;
  final double? rating;

  // ADD THESE:
  final String code;
  final String address;
  final String carInfo;
  final String startTime;
  final String endTime;

  ParkingLocation({
    required this.id,
    required this.lat,
    required this.lng,
    required this.title,
    required this.description,
    required this.type,
    required this.isAvailable,
    required this.price,
    required this.code,
    required this.address,
    required this.carInfo,
    required this.startTime,
    required this.endTime,
    this.distance,
    this.availableSpots,
    this.totalSpots,
    this.imageUrl,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lat': lat,
      'lng': lng,
      'title': title,
      'description': description,
      'type': type,
      'isAvailable': isAvailable,
      'price': price,
      'distance': distance,
      'availableSpots': availableSpots,
      'totalSpots': totalSpots,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }

  factory ParkingLocation.fromMap(Map<String, dynamic> map) {
    return ParkingLocation(
      id: map['id'] ?? '',
      lat: (map['lat'] ?? 0.0).toDouble(),
      lng: (map['lng'] ?? 0.0).toDouble(),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? 'parking',
      isAvailable: map['isAvailable'] ?? true,
      price: map['price'],
      distance: map['distance']?.toDouble(),
      availableSpots: map['availableSpots'],
      totalSpots: map['totalSpots'],
      imageUrl: map['imageUrl'],
      rating: map['rating']?.toDouble(),
      code:  map['code']?.toDouble(),
      address: map['address']?.toDouble(),
      carInfo:  map['carInfo']?.toDouble(),
      startTime: map['startTime']?.toDouble(),
      endTime: map['endTime']?.toDouble(),
    );
  }
}
