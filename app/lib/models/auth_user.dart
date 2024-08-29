import 'package:pocketbase/pocketbase.dart';

class AuthUser {
  final String id;
  final String email;
  final bool onboarding;
  final int numConversations;

  AuthUser({
    required this.id,
    required this.email,
    required this.onboarding,
    this.numConversations = 0,
  });

  factory AuthUser.fromNetwork(RecordModel record) {
    return AuthUser(
      id: record.id,
      email: record.getStringValue('email'),
      onboarding: record.getBoolValue('onboarding'),
      numConversations: record.getIntValue('numConversations'),
    );
  }
}
