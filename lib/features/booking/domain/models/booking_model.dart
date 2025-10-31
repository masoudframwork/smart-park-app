class BookingModel {
  final String id;
  final String startTime;
  final String endTime;
  final String date;
  final String duration;
  final String status;
  final DateTime startDateTime;
  final DateTime endDateTime;

  BookingModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.duration,
    required this.status,
    required this.startDateTime,
    required this.endDateTime,
  });

  BookingModel copyWith({
    String? id,
    String? startTime,
    String? endTime,
    String? date,
    String? duration,
    String? status,
    DateTime? startDateTime,
    DateTime? endDateTime,
  }) {
    return BookingModel(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      date: date ?? this.date,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
    );
  }
}