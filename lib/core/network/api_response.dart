class ApiResponse<T> {
  T? data;
  final bool success;
  final String? message;
  final int? statusCode;

  ApiResponse({
    this.data,
    required this.success,
    this.message,
    this.statusCode,
  });

  factory ApiResponse.success(T data, {String? message, int? statusCode}) {
    return ApiResponse(
      data: data,
      success: true,
      message: message,
      statusCode: statusCode,
    );
  }

  factory ApiResponse.failure(String message, {int? statusCode}) {
    return ApiResponse(
      data: null,
      success: false,
      message: message,
      statusCode: statusCode,
    );
  }
}
