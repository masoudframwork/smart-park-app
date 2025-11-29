import 'package:dio/dio.dart';
import '../../../../core/constants/api_endpoints.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  // ---------------- LOGIN ----------------
  Future<Map<String, dynamic>> login(String mobile) async {
    print("Calling URL: ${ApiEndpoints.login}");
    final res = await dio.post(
      ApiEndpoints.login,
      data: {"mobile": mobile},
    );
    return res.data;
  }

  // ---------------- VERIFY OTP ----------------
  Future<Map<String, dynamic>> verifyOtp({
    required String mobile,
    required int code,
    required int type,       // 1 = Login, 2 = Registration (example)
    String? fullName,
  }) async {
    final res = await dio.post(
      ApiEndpoints.verifyOtp,
      data: {
        "fullName": fullName,
        "mobile": mobile,
        "type": type,
        "code": code,
      },
    );
    return res.data;
  }

  // ---------------- RESEND OTP ----------------
  Future<Map<String, dynamic>> resendOtp({
    required String mobile,
    required int otpType,   // based on swagger: otpType is int
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
