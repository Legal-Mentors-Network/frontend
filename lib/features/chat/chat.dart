import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/chat/chat_bubble.dart';
import 'package:lmn/features/chat/send_message.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/state/conversation.dart';
import 'package:lmn/state/message.dart';
import 'package:lmn/state/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
        return MessagesView(messages: data, conversationId: conversationId);
      },
      error: (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return const Text("Error");
      },
      loading: () => Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: xl),
          child: LoadingAnimationWidget.fourRotatingDots(
            color: context.colors.secondary,
            size: 50,
          ),
        ),
      ),
    );
  }
}

class MessagesView extends ConsumerWidget {
  const MessagesView({super.key, required this.conversationId, required this.messages});

  final String conversationId;
  final List<Message> messages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider.notifier).user;

    if (user == null) {
      log("user is empty");
      throw Exception("Error rendering messages. User is empty.");
    }

    final notifier = ref.read(conversationProvider.notifier);
    final conversation = notifier.getConversation(conversationId);
    final recipient = notifier.getConversationRecipient(conversation, user);

    return Padding(
      padding: const EdgeInsets.only(top: md, right: md, left: md),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.separated(
            padding: const EdgeInsets.only(bottom: 78),
            reverse: true,
            itemBuilder: (context, index) {
              return ChatBubble(
                message: messages[messages.length - 1 - index],
                author: user,
                recipient: recipient,
                showRecipientName: false,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: md),
            itemCount: messages.length,
          ),

          //
          SendMessage(conversationId: conversationId),
        ],
      ),
    );
  }
}
