class BookingModel {
  final String id;
  final String startTime;
  final String endTime;
  final String date;
  final String duration;
  final String status;

  BookingModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.duration,
    required this.status,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      date: json['date'] ?? '',
      duration: json['duration'] ?? '',
      status: json['status'] ?? 'active',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'duration': duration,
      'status': status,
    };
  }
}