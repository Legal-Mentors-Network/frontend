import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lmn/models/attachment.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/state/state.dart';
import 'package:lmn/state/user.dart';
import 'package:pocketbase/pocketbase.dart';

final messageProvider = AsyncNotifierProvider.family<MessageNotifier, List<Message>, String>(MessageNotifier.new);

class MessageNotifier extends FamilyAsyncNotifier<List<Message>, String> {
  late final String conversationId;

  List<Message> get messages => state.value ?? [];

  @override
  Future<List<Message>> build(String id) async {
    final pb = await ref.read(pocketbase);

    conversationId = id;

    try {
      final filter = 'conversation = "$conversationId"';
      final messages = await pb.collection('messages').getList(page: 1, perPage: 30, filter: filter);

      registerListener();
      return messages.items.map((message) => Message.fromNetwork(message)).toList();
    } on ClientException catch (e) {
      log("Failed to fetch messages ${e.statusCode} ${e.originalError}");
    }

    return [];
  }

  Future<void> registerListener() async {
    final pb = await ref.read(pocketbase);

    pb.collection('messages').subscribe('*', (e) {
      final record = e.record;

      if (e.action != 'create' || record == null) return;
      if (record.getStringValue('conversation') != conversationId) return;

      final message = Message.fromNetwork(record);
      state = AsyncData([...messages, message]);
    });

    ref.onCancel(() {
      log("destroying msgs listener...");
      pb.collection('messages').unsubscribe('*');
    });
  }

  Future<void> sendMessage({
    required String conversationId,
    required String message,
    Attachment? file,
  }) async {
    final pb = await ref.read(pocketbase);
    final user = ref.read(userProvider.notifier).user;

    if (user == null) return;

    final body = <String, dynamic>{
      "conversation": conversationId,
      "author": user.id,
      "message": message,
      "read": false,
    };

    final List<http.MultipartFile> files = [];

    if (file != null) {
      files.add(
        await http.MultipartFile.fromPath(
          "attachment",
          file.path,
          filename: file.name,
        ),
      );
    }

    try {
      await pb.collection('messages').create(body: body, files: files);
    } on ClientException catch (e) {
      log("Failed to send message ${e.statusCode} ${e.originalError}");
    }
  }
}
