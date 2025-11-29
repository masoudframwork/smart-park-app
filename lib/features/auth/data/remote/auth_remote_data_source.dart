import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/constants/api_endpoints.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  // ---------------- LOGIN ----------------
  Future<Map<String, dynamic>> login(String mobile) async {
    if (kDebugMode) {
      print("Calling URL: ${ApiEndpoints.login}");
    }
    final res = await dio.post(
      ApiEndpoints.login,
      data: {"mobile": mobile},
    );
    return res.data;
  }

  // ---------------- VERIFY OTP ----------------
  // VERIFY OTP
  Future<Map<String, dynamic>> verifyOtp({
    required String mobile,
    required int code,
    required int type,
    String? fullName,
  }) async {
    final requestData = {
      "fullName": fullName,
      "mobile": mobile,
      "type": type,
      "code": code,
    };

    if (kDebugMode) {
      print("🔵 Sending OTP Verification:");
    }
    if (kDebugMode) {
      print("📍 URL: ${ApiEndpoints.verifyOtp}");
    }
    if (kDebugMode) {
      print("📦 Body: $requestData");
    }

    try {
      final res = await dio.post(
        ApiEndpoints.verifyOtp,
        data: requestData,
      );

      if (kDebugMode) {
        print("✅ Response: ${res.data}");
      }
      return res.data;
    } on DioException catch (e) {
      if (kDebugMode) {
        print("❌ Error Status: ${e.response?.statusCode}");
      }
      if (kDebugMode) {
        print("❌ Error Body: ${e.response?.data}");
      }
      rethrow;
    }
  }

  // ---------------- RESEND OTP ----------------
  Future<Map<String, dynamic>> resendOtp({
    required String mobile,
    required int otpType,
  }) async {
    final res = await dio.post(
      ApiEndpoints.resendOtp,
      data: {
        "mobileNumber": mobile,
        "otpType": otpType,
      },
    );
    return res.data;
  }

  // ---------------- GET LAST ACTIVE OTP ----------------
  Future<Map<String, dynamic>> getLastActiveOtp(String mobile) async {
    final res = await dio.get(
      ApiEndpoints.getLastActiveOtp,
      queryParameters: {"mobile": mobile},
    );
    return res.data;
  }
}
