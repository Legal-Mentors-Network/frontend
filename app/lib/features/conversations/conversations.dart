import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/conversations/conversation_tile/conversation_tile.dart';
import 'package:lmn/models/conversation.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/models/user.dart';
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
      loading: () {
        final user = User(
          id: "1",
          profileId: "1",
          email: "example@mail.com",
          name: BoneMock.words(2),
          age: 24,
          location: "London",
          image: "asdadadada",
          onboarding: true,
        );

        final message = Message(
          id: "1",
          conversation: "1",
          author: "1",
          message: BoneMock.words(6),
          createdAt: DateTime.now(),
        );

        final conversation = Conversation(
          id: "1",
          author: user,
          recipient: user,
          latestMessage: message,
          unreadMessages: 0,
        );

        final conversations = List.filled(3, conversation);
        return Skeletonizer(child: ConversationsView(conversations: conversations));
      },
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
