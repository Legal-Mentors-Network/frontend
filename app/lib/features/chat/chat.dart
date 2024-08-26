import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/chat/chat_bubble.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/state/message.dart';

class Chat extends ConsumerWidget {
  const Chat({
    super.key,
    required this.conversationId,
  });

  final String conversationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageProvider(conversationId));

    return messages.when(
      data: (data) {
        if (data.isEmpty) return const SizedBox.shrink();
        return MessagesView(messages: data);
      },
      error: (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return const Text("Error");
      },
      loading: () => const Text("Loading..."),
    );
  }
}

class MessagesView extends StatelessWidget {
  const MessagesView({super.key, required this.messages});

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(md),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ChatBubble(message: messages[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: sm),
        itemCount: messages.length,
      ),
    );
  }
}
