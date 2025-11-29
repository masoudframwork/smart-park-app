// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:smart/features/auth/data/auth_repository.dart';
//
// import '../../provider/auth_providers.dart';
//
// class AuthState {
//   final bool isLoading;
//   final String? error;
//   final bool success;
//   final DateTime? nextOtpAvailableAt;
//
//   const AuthState({
//     this.isLoading = false,
//     this.error,
//     this.success = false,
//     this.nextOtpAvailableAt,
//   });
//
//   AuthState copyWith({
//     bool? isLoading,
//     String? error,
//     bool? success,
//     DateTime? nextOtpAvailableAt,
//   }) {
//     return AuthState(
//       isLoading: isLoading ?? this.isLoading,
//       error: error,
//       success: success ?? this.success,
//       nextOtpAvailableAt: nextOtpAvailableAt ?? this.nextOtpAvailableAt,
//     );
//   }
// }
//
// class AuthController extends StateNotifier<AuthState> {
//   final AuthRepository _repo;
//
//   AuthController(this._repo) : super(const AuthState());
//
//   Future<void> login(String mobile) async {
//     if (mobile.trim().isEmpty) {
//       state = state.copyWith(error: "Mobile is required");
//       return;
//     }
//
//     state = state.copyWith(isLoading: true, error: null, success: false);
//
//     try {
//       final json = await _repo.login(mobile);
//
//       final success = json["success"] == true;
//       final code = json["code"] as int?;
//       final msgList = json["message"];
//       String? message;
//       if (msgList is List && msgList.isNotEmpty) {
//         message = msgList.first.toString();
//       }
//
//       DateTime? otpTime;
//       final data = json["data"];
//       if (data is Map && data["nextOtpAvailableAt"] != null) {
//         otpTime = DateTime.tryParse(data["nextOtpAvailableAt"].toString());
//       }
//
//       if (!success) {
//         state = state.copyWith(
//           isLoading: false,
//           success: false,
//           error: message ?? "Login failed (code: $code)",
//         );
//         return;
//       }
//
//       state = state.copyWith(
//         isLoading: false,
//         success: true,
//         error: null,
//         nextOtpAvailableAt: otpTime,
//       );
//
//       // Here you can navigate to OTP screen later
//       // NavigationService.push('/otpScreen');
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         success: false,
//         error: e.toString(),
//       );
//     }
//   }
// }
//
// /// Riverpod provider
// final authControllerProvider =
// StateNotifierProvider<AuthController, AuthState>((ref) {
//   final repository = ref.read(authRepositoryProvider);
//   return AuthController(repository);
// });