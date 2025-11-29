class LoginResponse {
  final DateTime nextOtpAvailableAt;

  LoginResponse({required this.nextOtpAvailableAt});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      nextOtpAvailableAt: DateTime.parse(json["nextOtpAvailableAt"]),
    );
  }
}
