import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_ui_types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/chat/state.dart';
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

class MessagesView extends ConsumerWidget {
  const MessagesView({super.key, required this.messages});

  final List<Message> messages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(chatProvider.notifier).loadMessages();
    final messages = ref.watch(chatProvider);

    const user = chat_ui_types.User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
    );

    return chat_ui.Chat(
      messages: messages,
      showUserNames: true,
      onSendPressed: (PartialText) {},
      user: user,
      theme: chat_ui.DefaultChatTheme(
        backgroundColor: context.colors.surface,
        inputMargin: const EdgeInsets.symmetric(horizontal: md),
        inputContainerDecoration: BoxDecoration(
          color: context.colors.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(mx)),
        ),
      ),
      inputOptions: const chat_ui.InputOptions(
        usesSafeArea: false,
        sendButtonVisibilityMode: chat_ui.SendButtonVisibilityMode.always,
      ),
    );
  }
}
