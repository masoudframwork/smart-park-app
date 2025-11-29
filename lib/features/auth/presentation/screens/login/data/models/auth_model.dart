class AuthModel {
  final String? message;
  final String? token;
  final Member? member;

  AuthModel({this.message, this.token, this.member});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      member: json['member'] != null
          ? Member.fromJson(json['member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'member': member?.toJson(),
    };
  }
}

class Member {
  final int? id;
  final String? name;
  final String? phone;
  final bool? verified;
  final String? otpExpiresAt;
  final String? createdAt;
  final String? updatedAt;

  Member({
    this.id,
    this.name,
    this.phone,
    this.verified,
    this.otpExpiresAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      verified: json['verified'] as bool?, // might be absent
      otpExpiresAt: json['otp_expires_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'verified': verified,
      'otp_expires_at': otpExpiresAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
