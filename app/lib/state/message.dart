import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/state/state.dart';
import 'package:pocketbase/pocketbase.dart';

final messageProvider = AsyncNotifierProvider.family<MessageNotifier, List<Message>, String>(MessageNotifier.new);

class MessageNotifier extends FamilyAsyncNotifier<List<Message>, String> {
  List<Message>? get messages => state.value;

  @override
  Future<List<Message>> build(String conversationId) async {
    log("convo id $conversationId");
    final pb = await ref.read(pocketbase);

    try {
      final filter = 'conversation = "$conversationId"';
      final messages = await pb.collection('messages').getList(page: 1, perPage: 30, filter: filter);
      return messages.items.map((message) => Message.fromNetwork(message)).toList();
    } on ClientException catch (e) {
      log("Failed to fetch messages ${e.statusCode} ${e.originalError}");
    }

    return [];
  }
}
