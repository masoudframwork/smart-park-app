class BookingModel {
  final String id;
  final String locationName;
  final String address;
  final String startTime;
  final String endTime;
  final String date;
  final String duration;
  final String status;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final double? price;
  final String? paymentStatus;

  BookingModel({
    required this.id,
    required this.locationName,
    required this.address,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.duration,
    required this.status,
    required this.startDateTime,
    required this.endDateTime,
    this.price,
    this.paymentStatus,
  });

  bool get isActive => status == 'active';
  bool get isCompleted => status == 'completed';

  BookingModel copyWith({
    String? id,
    String? locationName,
    String? address,
    String? startTime,
    String? endTime,
    String? date,
    String? duration,
    String? status,
    DateTime? startDateTime,
    DateTime? endDateTime,
    double? price,
    String? paymentStatus,
  }) {
    return BookingModel(
      id: id ?? this.id,
      locationName: locationName ?? this.locationName,
      address: address ?? this.address,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      date: date ?? this.date,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      price: price ?? this.price,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }
}