import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/chat/chat_bubble.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/state/conversation.dart';
import 'package:lmn/state/message.dart';
import 'package:lmn/state/user.dart';

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
        return MessagesView(conversationId: conversationId, messages: data);
      },
      error: (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return const Text("Error");
      },
      loading: () => const Text("Loading..."),
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
    final ScrollController listViewController = ScrollController();

    // find a way to have it load at the bottom instantly
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        listViewController.animateTo(
          listViewController.position.maxScrollExtent * 2,
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
        );
      });
    });

    if (user == null) {
      log("user is empty");
      throw Exception("Error rendering messages. User is empty.");
    }

    final notifier = ref.read(conversationProvider.notifier);
    final conversation = notifier.getConversation(conversationId);
    final recipient = notifier.getConversationRecipient(conversation, user);

    return Padding(
      padding: const EdgeInsets.all(md),
      child: ListView.separated(
        controller: listViewController,
        itemBuilder: (context, index) {
          return ChatBubble(
            message: messages[index],
            author: user,
            recipient: recipient,
            showRecipientName: false,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: sm),
        itemCount: messages.length,
      ),
    );
  }
}
