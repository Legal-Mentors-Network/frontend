import 'package:lmn/models/auth_user.dart';
import 'package:pocketbase/pocketbase.dart';

class User extends AuthUser {
  final String profileId;
  final String name;
  final int age;
  final String location;
  final String image;

  User({
    required super.id,
    required this.profileId,
    required super.email,
    required this.name,
    required this.age,
    required this.location,
    required this.image,
    required super.onboarding,
  });

  factory User.fromNetwork(RecordModel record) {
    return User(
      id: record.id,
      profileId: record.getStringValue('profileId'),
      email: record.getStringValue('email'),
      name: record.getStringValue('name'),
      age: record.getIntValue('age'),
      location: record.getStringValue('location'),
      image: record.getStringValue('avatar'),
      onboarding: record.getBoolValue('onboarding'),
    );
  }
}
