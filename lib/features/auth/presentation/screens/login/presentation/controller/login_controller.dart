import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../data/auth_repository.dart';
import '../../../../../provider/auth_providers.dart';

// ---------------------- STATE ----------------------
class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool success;
  final String? nextOtpAt;

  LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.success = false,
    this.nextOtpAt,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? success,
    String? nextOtpAt,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
      nextOtpAt: nextOtpAt ?? this.nextOtpAt,
    );
  }
}

// ---------------------- CONTROLLER ----------------------
class LoginController extends StateNotifier<LoginState> {
  final AuthRepository repo;

  LoginController(this.repo) : super(LoginState());

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  // ---------------- VALIDATION ----------------
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number required";
    }
    if (value.length < 9) {
      return "Invalid phone number";
    }
    return null;
  }

  // ---------------- HANDLE TEXT CHANGE ----------------
  void onPhoneChanged(String value) {
    phoneController.text = value;
  }

  // ---------------- LOGIN API ----------------
  Future<void> sendCode() async {
    if (!formKey.currentState!.validate()) return;

    state = state.copyWith(isLoading: true, errorMessage: null, success: false);

    try {
      final response = await repo.login(phoneController.text.trim());

      final success = response["success"] as bool? ?? false;
      final message = response["message"];
      final data = response["data"];

      if (!success) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: message?.toString() ?? "Login failed",
          success: false,
        );
        return;
      }

      /// Extract OTP timer
      final nextOtp = data != null ? data["nextOtpAvailableAt"] : null;
      print("Next OTP time: $nextOtp");

      /// UPDATE STATE
      state = state.copyWith(
        isLoading: false,
        success: true,
        errorMessage: null,
      );

    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  // ---------------- NAVIGATION PLACEHOLDERS ----------------
  void goToRegister() {
    print("Go to Register Page");
  }

  void guestLogin() {
    print("Guest Login");
  }

  void loginWithNafath() {
    print("Login with Nafath");
  }
}


// ---------------------- PROVIDER ----------------------
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginController(repo);
});
