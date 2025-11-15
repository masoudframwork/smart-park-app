class LoginState {
  final bool isLoading;
  final String phone;
  final String? errorMessage;

  const LoginState({
    this.isLoading = false,
    this.phone = '',
    this.errorMessage,
  });

  LoginState copyWith({
    bool? isLoading,
    String? phone,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      phone: phone ?? this.phone,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, phone, errorMessage];
}
