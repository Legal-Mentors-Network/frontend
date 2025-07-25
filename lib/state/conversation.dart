import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/models/conversation.dart';
import 'package:lmn/models/user.dart';
import 'package:lmn/state/state.dart';
import 'package:lmn/state/user.dart';
import 'package:pocketbase/pocketbase.dart';

final conversationProvider = AsyncNotifierProvider<ConversationNotifier, List<Conversation>>(ConversationNotifier.new);

class ConversationNotifier extends AsyncNotifier<List<Conversation>> {
  List<Conversation> get conversations => state.value ?? [];

  @override
  Future<List<Conversation>> build() async {
    final pb = await ref.read(pocketbase);

    final user = ref.read(userProvider.notifier).user;
    if (user == null) return [];

    try {
      final filter = 'author = "${user.id}" || recipient = "${user.id}"';
      const expand = 'authorProfile,recipientProfile,latestMessage';
      //   final conversations = await pb.collection('conversations_list').getList(page: 1, perPage: 30, expand: expand);
      final conversations = await pb.collection('conversations_list').getFullList(filter: filter, expand: expand);
      return conversations.map((conversation) => Conversation.fromNetwork(conversation)).toList();
    } on ClientException catch (e) {
      debugPrint("Failed to fetch conversations ${e.statusCode} ${e.originalError}");
    }

    return [];
  }

  Conversation getConversation(String conversationId) {
    return (state.value ?? []).where((conversation) => conversation.id == conversationId).first;
  }

  User getConversationRecipient(Conversation conversation, User user) {
    return conversation.author.id == user.profileId ? conversation.recipient : conversation.author;
  }
}
