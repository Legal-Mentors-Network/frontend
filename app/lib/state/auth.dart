import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/utils.dart';
import 'package:lmn/data/config_table.dart';
import 'package:lmn/data/user_profile_table.dart';
import 'package:lmn/models/auth_user.dart';
import 'package:lmn/state/state.dart';
import 'package:lmn/state/user.dart';
import 'package:pocketbase/pocketbase.dart';

final auth = AsyncNotifierProvider<AuthNotifier, AuthUser?>(AuthNotifier.new);

class AuthNotifier extends AsyncNotifier<AuthUser?> {
  static String field = 'authenticated_user';

  @override
  Future<AuthUser?> build() async {
    debugPrint("building auth...");
    final record = await _loadFromCache();
    await registerListener();

    if (record == null) {
      return null;
    }

    final user = AuthUser.fromNetwork(record);
    await ref.read(userProvider.notifier).setUser(record);
    return user;
  }

  Future<RecordModel?> _loadFromCache() async {
    final db = await ref.read(databaseProvider);

    try {
      final item = await ConfigTable(db).getItem(field);
      if (item == null) return null;

      final record = _process(json.decode(item.value) as Map<String, Object?>);
      if (record == null) return null;

      return record;
    } catch (e) {
      debugPrint("Failed to set current user from cache $e");
    }
    return null;
  }

  RecordModel? _process(Map<String, Object?> data) {
    return switch (data) { {'model': final Map<String, dynamic> model} => RecordModel.fromJson(model), _ => null };
  }

  Future<void> setCurrentUser(RecordModel? record) async {
    if (record == null) {
      state = const AsyncData(null);
      return;
    }

    AuthUser.fromNetwork(record);
    state = AsyncData(AuthUser.fromNetwork(record));
  }

  Future<void> registerListener() async {
    debugPrint("registering auth listener...");

    final userNotifier = ref.read(userProvider.notifier);
    final pb = await ref.read(pocketbase);

    pb.authStore.onChange.listen((event) async {
      final record = event.model as RecordModel?;

      // null check?
      debugPrint("FIRED auth listener... $record");
      await setCurrentUser(record);
      await userNotifier.setUser(record);
    });
  }

  Future<String?> login(String email, String password) async {
    final pb = await ref.read(pocketbase);
    final users = pb.collection('users');
    return guard(() async => users.authWithPassword(email.toLowerCase(), password), message: 'Invalid Login Credentials');
  }

  Future<String?> register(String email, String password, String confirmPassword) async {
    final body = {
      'email': email.toLowerCase(),
      'password': password,
      'passwordConfirm': confirmPassword,
      'onboarding': true,
    };

    final pb = await ref.read(pocketbase);
    final collection = pb.collection('users');

    return signUpGuard(
      () async {
        final user = await collection.create(body: body);
        final db = await ref.read(databaseProvider);
        await UserProfileTable(db).createUserProfile(user.id);
        await login(email, password);
      },
      message: 'Failed to create your account. Please try again later',
    );
  }

  Future<void> logout() async {
    debugPrint("Logging out...");
    final pb = await ref.read(pocketbase);
    pb.authStore.clear();
  }

  Future<void> refreshNetworkAuthState(PocketBase pb) async {
    try {
      // if (!pb.authStore.isValid) redirect user to login- throw exception
      await pb.collection("users").authRefresh();
    } on ClientException catch (e) {
      debugPrint("Failed to refresh auth... response: ${e.statusCode} ${e.originalError}");
      pb.authStore.clear();
    }
  }
}
