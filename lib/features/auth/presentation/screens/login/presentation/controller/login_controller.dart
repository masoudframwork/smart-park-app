import 'package:flutter/foundation.dart';
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

      final isSuccess = response["IsSuccess"] as bool? ?? false;
      final errors = response["Errors"];
      final data = response["Data"];

      if (!isSuccess) {
        // Extract readable error
        final errorText = errors is List ? errors.join(", ") : errors.toString();

        state = state.copyWith(
          isLoading: false,
          errorMessage: errorText,
          success: false,
        );
        return;
      }

      // SUCCESS FLOW
      final nextOtp = data?["nextOtpAvailableAt"];

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
    if (kDebugMode) {
      print("Go to Register Page");
    }
  }

  void guestLogin() {
    if (kDebugMode) {
      print("Guest Login");
    }
  }

  void loginWithNafath() {
    if (kDebugMode) {
      print("Login with Nafath");
    }
  }
}


// ---------------------- PROVIDER ----------------------
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginController(repo);
});
