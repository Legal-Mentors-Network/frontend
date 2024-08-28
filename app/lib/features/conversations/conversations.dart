import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/mocks/conversations_mock.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/conversations/conversation_tile/conversation_tile.dart';
import 'package:lmn/models/conversation.dart';
import 'package:lmn/state/conversation.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Conversations extends ConsumerWidget {
  const Conversations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversations = ref.watch(conversationProvider);

    return conversations.when(
      data: (data) {
        if (data.isEmpty) return const SizedBox.shrink();
        return ConversationsView(conversations: data);
      },
      error: (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return const Text("Error");
      },
      loading: () => Skeletonizer(
        child: ConversationsView(conversations: getConversationsMock(3)),
      ),
    );
  }
}

class ConversationsView extends StatelessWidget {
  const ConversationsView({
    super.key,
    required this.conversations,
  });

  final List<Conversation> conversations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => ConversationTile(conversation: conversations[index]),
            separatorBuilder: (context, index) => const SizedBox(height: xs),
            itemCount: conversations.length,
          ),
        ),
      ],
    );
  }
}
