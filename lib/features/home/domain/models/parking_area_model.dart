
// Model for Parking Area

class ParkingArea {
  final String id;
  final String code;
  final String name;
  final String location;
  final int waitTimeMinutes;
  final int availableSpots;
  final int totalSpots;
  final String? imageUrl;
  final double latitude;
  final double longitude;
  final int pricePerHour;
  final bool isActive;

  ParkingArea({
    required this.id,
    required this.code,
    required this.name,
    required this.location,
    required this.waitTimeMinutes,
    required this.availableSpots,
    required this.totalSpots,
    this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.pricePerHour,
    this.isActive = true,
  });

  double get availabilityPercentage => (availableSpots / totalSpots) * 100;

  bool get isAlmostFull => availabilityPercentage < 20;

  bool get isFull => availableSpots == 0;

  String get formattedAvailability => '$availableSpots/$totalSpots';

  String get waitTimeText => '$waitTimeMinutes';

  // Copy with method for updates
  ParkingArea copyWith({
    String? id,
    String? code,
    String? name,
    String? location,
    int? waitTimeMinutes,
    int? availableSpots,
    int? totalSpots,
    String? imageUrl,
    double? latitude,
    double? longitude,
    int? pricePerHour,
    bool? isActive,
  }) {
    return ParkingArea(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      location: location ?? this.location,
      waitTimeMinutes: waitTimeMinutes ?? this.waitTimeMinutes,
      availableSpots: availableSpots ?? this.availableSpots,
      totalSpots: totalSpots ?? this.totalSpots,
      imageUrl: imageUrl ?? this.imageUrl,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      pricePerHour: pricePerHour ?? this.pricePerHour,
      isActive: isActive ?? this.isActive,
    );
  }
}

// Model for Active Parking Session
class ParkingSession {
  final String sessionId;
  final String parkingAreaId;
  final DateTime startTime;
  final DateTime? endTime;
  final int durationMinutes;
  final double totalCost;
  final bool isActive;

  ParkingSession({
    required this.sessionId,
    required this.parkingAreaId,
    required this.startTime,
    this.endTime,
    required this.durationMinutes,
    required this.totalCost,
    this.isActive = true,
  });

  int get elapsedMinutes => DateTime.now().difference(startTime).inMinutes;

  double get progressPercentage => durationMinutes > 0
      ? (elapsedMinutes / durationMinutes).clamp(0.0, 1.0)
      : 0.0;

  int get remainingMinutes =>
      (durationMinutes - elapsedMinutes).clamp(0, durationMinutes);

  bool get isExpiringSoon => remainingMinutes <= 5 && remainingMinutes > 0;

  bool get isExpired => remainingMinutes <= 0;
}
