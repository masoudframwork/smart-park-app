import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/login_state.dart';

final loginControllerProvider =
AutoDisposeNotifierProvider<LoginController, LoginState>(
  LoginController.new,
);

class LoginController extends AutoDisposeNotifier<LoginState> {
  late final TextEditingController phoneController;
  late final GlobalKey<FormState> formKey;

  @override
  LoginState build() {
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();

    ref.onDispose(() {
      phoneController.dispose();
    });

    return const LoginState();
  }

  void onPhoneChanged(String value) {
    state = state.copyWith(phone: value, errorMessage: null);
  }

  String? validatePhone(String? value) {
    final phone = value?.trim() ?? '';
    if (phone.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (phone.length < 9) {
      return 'رقم الهاتف غير صحيح';
    }
    return null;
  }

  Future<void> sendCode() async {
    final form = formKey.currentState;
    if (form == null) return;

    if (!form.validate()) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {

    } catch (e) {
      state = state.copyWith(
        errorMessage: 'حدث خطأ ما، حاول مرة أخرى',
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void loginWithNafath() {
  }

  void goToRegister() {

  }

  void guestLogin() {

  }
}
