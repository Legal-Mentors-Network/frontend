import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/models/user.dart';
import 'package:lmn/state/state.dart';
import 'package:pocketbase/pocketbase.dart';

final userProvider = StateNotifierProvider<UserNotifier, User?>(
  (ref) => UserNotifier(ref),
);

class UserNotifier extends StateNotifier<User?> {
  UserNotifier(this.ref) : super(null);

  final Ref ref;

  Future<void> setUser(RecordModel? record) async {
    debugPrint("setting user with record: $record");
    if (record == null) return;
    final onboarding = record.getBoolValue('onboarding');

    if (onboarding) return;

    final pb = await ref.read(pocketbase);

    try {
      final user = await pb.collection('user').getOne(record.id);
      state = User.fromNetwork(user);
    } on ClientException catch (e) {
      debugPrint("Failed to fetch user profile ${e.statusCode} ${e.originalError}");
      if (e.statusCode == 404) {
        // TODO: render notification "Failed to fetch your user data. Please contact support if this problem persists";
      }
    }
  }
}
