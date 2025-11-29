class ApiResponse<T> {
  final bool success;
  final int code;
  final String? message;
  final T? data;

  ApiResponse({
    required this.success,
    required this.code,
    this.message,
    this.data,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) create) {
    return ApiResponse(
      success: json["success"],
      code: json["code"],
      message: json["message"] is List
          ? json["message"]?.join(", ")
          : json["message"],
      data: json["data"] != null ? create(json["data"]) : null,
    );
  }
}
