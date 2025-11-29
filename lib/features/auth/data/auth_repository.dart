import 'package:smart/features/auth/data/remote/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepository(this.remote);

  Future<Map<String, dynamic>> login(String mobile) {
    return remote.login(mobile);
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String mobile,
    required int code,
    required int type,
    String? fullName,
  }) {
    return remote.verifyOtp(
      mobile: mobile,
      code: code,
      type: type,
      fullName: fullName,
    );
  }

  Future<Map<String, dynamic>> resendOtp({
    required String mobile,
    required int otpType,
  }) {
    return remote.resendOtp(
      mobile: mobile,
      otpType: otpType,
    );
  }

  Future<Map<String, dynamic>> getLastActiveOtp(String mobile) {
    return remote.getLastActiveOtp(mobile);
  }
}
