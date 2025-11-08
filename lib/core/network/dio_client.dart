import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart/generated/l10n.dart';

import 'dart:async';
import 'dart:io';
import 'api_response.dart';
import 'constants.dart';
import 'custom_failure.dart';
import 'base_http_client.dart' as client;

typedef TokenRefreshCallback = Future<String?> Function();

class DioClient implements client.HttpClient {
  late Dio _dio;
  String? _authToken;
  final Map<String, CancelToken> _cancelTokens = {};

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "ApiEndpoints().baseUrl",
        connectTimeout: NetworkTimeouts.connect,
        receiveTimeout: NetworkTimeouts.receive,
        sendTimeout: NetworkTimeouts.send,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.clear();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (_authToken != null &&
              !options.headers.containsKey('Authorization')) {
            options.headers['Authorization'] = "Bearer $_authToken";
          }

          options.headers['X-Request-ID'] =
              DateTime.now().millisecondsSinceEpoch.toString();

          if (kDebugMode) {
            debugPrint('➡️ [${options.method}] ${options.uri}');
            if (options.data != null) {
              debugPrint('📤 Request Data: ${options.data}');
            }
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            debugPrint(
              '✅ [${response.statusCode}] ${response.requestOptions.uri}',
            );
            debugPrint('📥 Response: ${response.data}');
          }
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (kDebugMode) {
            debugPrint(
              '❌ [${error.response?.statusCode ?? 'NO_STATUS'}] ${error.requestOptions.uri}',
            );
            debugPrint('💥 Error: ${error.message}');
          }

          _handleError(error);
          return handler.reject(error);
        },
      ),
    );

    _dio.interceptors.add(_RetryInterceptor());

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: false,
          requestBody: false,
          responseBody: true,
          responseHeader: false,
          error: false,
          logPrint: (obj) => debugPrint('🔍 Dio: $obj'),
        ),
      );
    }
  }

  CustomFailure _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return CustomFailure(S.current.dio_timeout);
    }

    if (e.type == DioExceptionType.badCertificate) {
      return CustomFailure(S.current.dio_ssl_error);
    }

    if (e.type == DioExceptionType.cancel) {
      return CustomFailure(S.current.dio_request_cancelled);
    }

    if (e.type == DioExceptionType.badResponse) {
      return _handleBadResponse(e);
    }

    if (e.type == DioExceptionType.unknown) {
      if (e.error is SocketException) {
        return CustomFailure(S.current.dio_no_connection);
      }
      return CustomFailure(S.current.dio_no_connection);
    }

    return CustomFailure(S.current.dio_unexpected_error);
  }

  CustomFailure _handleBadResponse(DioException e) {
    final statusCode = e.response?.statusCode ?? 0;
    String serverMessage = S.current.dio_server_error;

    // Try to extract error message from response
    try {
      final responseData = e.response?.data;
      if (responseData is Map<String, dynamic>) {
        serverMessage = responseData['message'] ??
            responseData['error'] ??
            responseData['detail'] ??
            serverMessage;
      } else if (responseData is String) {
        serverMessage = responseData;
      }
    } catch (_) {}

    switch (statusCode) {
      case HttpStatusCodes.unauthorized:
        return CustomFailure(S.current.dio_unauthorized, code: statusCode);
      case HttpStatusCodes.forbidden:
        return CustomFailure('Access forbidden', code: statusCode);
      case HttpStatusCodes.notFound:
        return CustomFailure(S.current.dio_not_found, code: statusCode);
      case HttpStatusCodes.serverError:
      case HttpStatusCodes.badGateway:
      case HttpStatusCodes.serviceUnavailable:
      case HttpStatusCodes.gatewayTimeout:
        return CustomFailure(S.current.dio_server_error, code: statusCode);
      default:
        if (statusCode >= 400 && statusCode < 500) {
          return CustomFailure(
            'Client error: $serverMessage',
            code: statusCode,
          );
        } else if (statusCode >= 500) {
          return CustomFailure(S.current.dio_server_error, code: statusCode);
        }
        return CustomFailure(
          'HTTP $statusCode: $serverMessage',
          code: statusCode,
        );
    }
  }

  @override
  void setAuthToken(String? token) {
    _authToken = token;
  }

  void setTokenRefreshCallback(TokenRefreshCallback callback) {}

  CancelToken createCancelToken(String requestId) {
    final cancelToken = CancelToken();
    _cancelTokens[requestId] = cancelToken;
    return cancelToken;
  }

  void cancelRequest(String requestId) {
    final cancelToken = _cancelTokens[requestId];
    if (cancelToken != null && !cancelToken.isCancelled) {
      cancelToken.cancel('Request cancelled by user');
      _cancelTokens.remove(requestId);
    }
  }

  void cancelAllRequests() {
    for (final cancelToken in _cancelTokens.values) {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel('All requests cancelled');
      }
    }
    _cancelTokens.clear();
  }

  @override
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
    CancelToken? cancelToken,
    String? token,
  }) async {
    try {
      Options? customOptions;

      if (token != null) {
        customOptions = Options(headers: {"Authorization": token});
      }

      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: customOptions,
      );

      return _handleSuccess<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleFailure<T>(e);
    } catch (e) {
      return ApiResponse.failure('Unexpected error: $e');
    }
  }

  @override
  Future<ApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
    CancelToken? cancelToken,
    String? token,
    Options? options,
  }) async {
    try {
      final baseHeaders = <String, String>{};
      if (token != null) baseHeaders['Authorization'] = token;

      final merged = (options ?? Options()).copyWith(
        headers: {
          ...?options?.headers,
          ...baseHeaders,
          'Accept': 'application/json',
        },
      );

      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: merged,
      );
      return _handleSuccess<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleFailure<T>(e);
    } catch (e) {
      return ApiResponse.failure('Unexpected error: $e');
    }
  }

  @override
  Future<ApiResponse<T>> put<T>(
    String path, {
    dynamic data,
    T Function(dynamic)? fromJson,
    CancelToken? cancelToken,
    String? token,
  }) async {
    try {
      Options? customOptions;

      if (token != null) {
        customOptions = Options(headers: {"Authorization": token});
      }

      final response = await _dio.put(
        path,
        data: data,
        cancelToken: cancelToken,
        options: customOptions,
      );
      return _handleSuccess<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleFailure<T>(e);
    } catch (e) {
      return ApiResponse.failure('Unexpected error: $e');
    }
  }

  @override
  Future<ApiResponse<T>> delete<T>(
    String path, {
    T Function(dynamic)? fromJson,
    CancelToken? cancelToken,
    String? token,
  }) async {
    try {
      Options? customOptions;

      if (token != null) {
        customOptions = Options(headers: {"Authorization": token});
      }

      final response = await _dio.delete(
        path,
        cancelToken: cancelToken,
        options: customOptions,
      );
      return _handleSuccess<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleFailure<T>(e);
    } catch (e) {
      return ApiResponse.failure('Unexpected error: $e');
    }
  }

  Future<ApiResponse<T>> uploadFile<T>(
    String path,
    String filePath, {
    String fieldName = 'file',
    Map<String, dynamic>? additionalData,
    T Function(dynamic)? fromJson,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
    String? token,
  }) async {
    try {
      Options? customOptions;

      if (token != null) {
        customOptions = Options(headers: {"Authorization": token});
      }

      final formData = FormData();

      // Add file
      formData.files.add(
        MapEntry(fieldName, await MultipartFile.fromFile(filePath)),
      );

      // Add additional data
      if (additionalData != null) {
        for (final entry in additionalData.entries) {
          formData.fields.add(MapEntry(entry.key, entry.value.toString()));
        }
      }

      final response = await _dio.post(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
        options: customOptions,
      );

      return _handleSuccess<T>(response, fromJson);
    } on DioException catch (e) {
      return _handleFailure<T>(e);
    } catch (e) {
      return ApiResponse.failure('File upload failed: $e');
    }
  }

  ApiResponse<T> _handleSuccess<T>(
    Response response,
    T Function(dynamic)? fromJson,
  ) {
    final data = response.data;

    if (fromJson != null && data != null) {
      try {
        final parsedData = fromJson(data);
        return ApiResponse.success(parsedData, statusCode: response.statusCode);
      } catch (e) {
        return ApiResponse.failure(
          'Data parsing failed: $e',
          statusCode: response.statusCode,
        );
      }
    }

    return ApiResponse.success(data as T, statusCode: response.statusCode);
  }

  ApiResponse<T> _handleFailure<T>(DioException e) {
    final failure =
        e.error is CustomFailure ? e.error as CustomFailure : _handleError(e);

    return ApiResponse.failure(
      failure.message,
      statusCode: failure.code ?? e.response?.statusCode,
    );
  }

  void _dispose() {
    cancelAllRequests();
    _dio.close();
  }

  @override
  void dispose() {
    _dispose();
  }
}

// Retry interceptor for handling network failures
class _RetryInterceptor extends Interceptor {
  static const int maxRetries = 3;
  static const List<Duration> retryDelays = [
    Duration(seconds: 1),
    Duration(seconds: 2),
    Duration(seconds: 4),
  ];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final shouldRetry = _shouldRetry(err);
    final retryCount = err.requestOptions.extra['retryCount'] ?? 0;

    if (shouldRetry && retryCount < maxRetries) {
      await Future.delayed(retryDelays[retryCount]);

      err.requestOptions.extra['retryCount'] = retryCount + 1;

      if (kDebugMode) {
        debugPrint(
          '🔄 Retrying request (${retryCount + 1}/$maxRetries): ${err.requestOptions.uri}',
        );
      }

      try {
        final dio = Dio();
        final response = await dio.fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        if (kDebugMode) {
          debugPrint('💥 Retry failed: $e');
        }
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        (err.type == DioExceptionType.unknown && err.error is SocketException);
  }
}
