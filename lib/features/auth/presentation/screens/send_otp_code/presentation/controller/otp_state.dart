class OtpState {
  final bool isLoading;
  final bool isVerified;
  final String? errorMessage;
  final bool canResend;

  OtpState({
    this.isLoading = false,
    this.isVerified = false,
    this.errorMessage,
    this.canResend = false,
  });

  OtpState copyWith({
    bool? isLoading,
    bool? isVerified,
    String? errorMessage,
    bool? canResend,
  }) {
    return OtpState(
      isLoading: isLoading ?? this.isLoading,
      isVerified: isVerified ?? this.isVerified,
      errorMessage: errorMessage,
      canResend: canResend ?? this.canResend,
    );
  }
}