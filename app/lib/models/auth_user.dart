import 'package:pocketbase/pocketbase.dart';

class AuthUser {
  final String id;
  final String email;
  final bool onboarding;

  AuthUser({
    required this.id,
    required this.email,
    required this.onboarding,
  });

  factory AuthUser.fromNetwork(RecordModel record) {
    return AuthUser(
      id: record.id,
      email: record.getStringValue('email'),
      onboarding: record.getBoolValue('onboarding'),
    );
  }
}
