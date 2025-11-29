class VerifyOtpRequest {
  final String mobile;
  final String otp;

  VerifyOtpRequest({required this.mobile, required this.otp});

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "otp": otp,
  };
}
