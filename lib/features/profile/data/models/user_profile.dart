// lib/features/profile/domain/models/user_profile.dart
class UserProfile {
  final String fullName;
  final String nationalId;
  final String phoneNumber;

  const UserProfile({
    required this.fullName,
    required this.nationalId,
    required this.phoneNumber,
  });
}
