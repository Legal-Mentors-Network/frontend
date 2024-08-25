import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/controllers/application_controller.dart';
import 'package:lmn/models/user.dart';
import 'package:lmn/state/state.dart';
import 'package:pocketbase/pocketbase.dart';

final userProvider = AsyncNotifierProvider<UserNotifier, User?>(UserNotifier.new);

class UserNotifier extends AsyncNotifier<User?> {
  User? get user => state.value;

  @override
  Future<User?> build() async {
    final record = await ApplicationController(ref).loadFromCache();
    if (record == null) return null;
    if (record.getBoolValue('onboarding')) return null;
    return await _getUser(record);
  }

  Future<void> setUser(RecordModel? record) async {
    debugPrint("setting user with record: $record");

    if (record == null) return;
    if (record.getBoolValue('onboarding')) return;
    state = AsyncValue.data(await _getUser(record));
  }

  Future<User?> _getUser(RecordModel record) async {
    final pb = await ref.read(pocketbase);

    try {
      final user = await pb.collection('user').getOne(record.id);
      return User.fromNetwork(user);
    } on ClientException catch (e) {
      debugPrint("Failed to fetch user profile ${e.statusCode} ${e.originalError}");
      if (e.statusCode == 404) {
        // TODO: render notification "Failed to fetch your user data. Please contact support if this problem persists";
      }
    }

    return null;
  }
}
