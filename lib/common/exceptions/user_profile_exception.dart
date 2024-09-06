enum UserProfileExceptionCodes { userProfileDoesNotExist }

class UserProfileException implements Exception {
  String cause;
  UserProfileExceptionCodes code;

  UserProfileException({required this.cause, required this.code});

  @override
  String toString() {
    return "User Profile Exception ${code.name} with message: $cause";
  }
}
