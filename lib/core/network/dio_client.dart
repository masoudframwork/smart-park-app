import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late Dio dio;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Log request
          print("➡️ API REQUEST: ${options.uri}");
          if (options.data != null) print("📦 Body: ${options.data}");
          if (options.queryParameters.isNotEmpty) {
            print("🔍 Query: ${options.queryParameters}");
          }

          // Example: Add token later (when user logs in)
          // final token = AppStorage.getToken();
          // if (token != null) {
          //   options.headers["Authorization"] = "Bearer $token";
          // }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("⬅️ API RESPONSE: ${response.statusCode}");
          print("📦 Data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          print("❌ API ERROR: ${error.message}");
          if (error.response != null) {
            print("❌ Error Body: ${error.response?.data}");
          }
          return handler.next(error);
        },
      ),
    );
  }

  // ---------------------------
  // HTTP Helpers
  // ---------------------------

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return dio.get(url, queryParameters: queryParameters);
  }

  Future<Response> post(String url, {dynamic data}) async {
    return dio.post(url, data: data);
  }

  Future<Response> put(String url, {dynamic data}) async {
    return dio.put(url, data: data);
  }

  Future<Response> delete(String url, {dynamic data}) async {
    return dio.delete(url, data: data);
  }
}
