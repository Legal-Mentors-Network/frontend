class PermissionException implements Exception {
  String cause;

  PermissionException(this.cause);

  @override
  String toString() {
    return cause;
  }
}
