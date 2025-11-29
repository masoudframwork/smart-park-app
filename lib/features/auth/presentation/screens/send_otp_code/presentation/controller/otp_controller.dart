import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../data/auth_repository.dart';
import 'otp_state.dart';
import 'send_code_timer_provider.dart';

class OtpController extends StateNotifier<OtpState> {
  final AuthRepository _repo;
  final String mobileNumber;
  final Ref ref;

  OtpController(this._repo, this.mobileNumber, this.ref) : super(OtpState());

  /// ✅ VERIFY OTP
  Future<void> verifyOtp(String otpCode) async {
    if (kDebugMode) {
      print("🔵 Verifying OTP: $otpCode for mobile: $mobileNumber");
    }

    if (otpCode.trim().isEmpty) {
      state = state.copyWith(errorMessage: "Please enter OTP code");
      return;
    }

    if (otpCode.length != 4) {
      state = state.copyWith(errorMessage: "OTP must be 4 digits");
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _repo.verifyOtp(
        mobile: mobileNumber,
        code: int.parse(otpCode),
        type: 1, // 1 = Login, 2 = Register
      );

      if (kDebugMode) {
        print("✅ API Response: $response");
      }

      final success = response["IsSuccess"] as bool? ?? false;

      if (!success) {
        final errors = response["Errors"] as List?;
        state = state.copyWith(
          isLoading: false,
          errorMessage: errors?.join(", ") ?? "Verification failed",
        );
        return;
      }

      // ✅ SUCCESS - Extract tokens
      final data = response["Data"];
      final accessToken = data?["accessToken"] as String?;
      final refreshToken = data?["refreshToken"] as String?;


      if (kDebugMode) {
        print("🎉 Success! Token: ${accessToken?.substring(0, 20)}...");
      }

      if (accessToken != null && refreshToken != null) {
        if (kDebugMode) {
          print("✅ Access Token: $accessToken");
        }
        if (kDebugMode) {
          print("✅ Refresh Token: $refreshToken");
        }

        state = state.copyWith(isLoading: false, isVerified: true);
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: "Invalid response from server",
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("💥 Exception: $e");
      }
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Something went wrong: ${e.toString()}",
      );
    }
  }

  /// ✅ RESEND OTP
  Future<void> resendOtp() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _repo.resendOtp(
        mobile: mobileNumber,
        otpType: 1, // 1 = Login
      );

      final success = response["IsSuccess"] as bool? ?? false;

      if (!success) {
        final errors = response["Errors"] as List?;
        state = state.copyWith(
          isLoading: false,
          errorMessage: errors?.join(", ") ?? "Resend failed",
        );
        return;
      }

      // ✅ SUCCESS - Restart timer
      ref.read(sendCodeTimerProvider.notifier).restart();

      state = state.copyWith(
        isLoading: false,
        canResend: false,
        errorMessage: null,
      );

      print("✅ OTP resent successfully");
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Failed to resend: ${e.toString()}",
      );
    }
  }

  /// ✅ Enable resend button when timer expires
  void enableResend() {
    state = state.copyWith(canResend: true);
  }
}