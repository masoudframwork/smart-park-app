import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../data/auth_repository.dart';
import '../data/remote/auth_remote_data_source.dart';
import '../presentation/screens/login/presentation/controller/login_controller.dart';
import '../presentation/screens/send_otp_code/presentation/controller/otp_controller.dart';
import '../presentation/screens/send_otp_code/presentation/controller/otp_state.dart';

/// Provide Dio globally
final dioProvider = Provider((ref) => DioClient().dio);

/// Remote data source (requires Dio)
final authRemoteProvider = Provider(
      (ref) => AuthRemoteDataSource(ref.read(dioProvider)),
);

/// Repository (requires Remote source)
final authRepositoryProvider = Provider(
      (ref) => AuthRepository(ref.read(authRemoteProvider)),
);

/// Login Controller
final loginControllerProvider =
StateNotifierProvider<LoginController, LoginState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginController(repo);
});

/// ✅ OTP Controller Provider (requires mobile number)
final otpControllerProvider = StateNotifierProvider.autoDispose
    .family<OtpController, OtpState, String>((ref, mobileNumber) {
  final repo = ref.watch(authRepositoryProvider);
  return OtpController(repo, mobileNumber, ref);
});