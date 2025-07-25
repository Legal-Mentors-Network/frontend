import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/components/chat_app_bar/chat_app_bar.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/state/conversation.dart';
import 'package:lmn/state/user.dart';

class ChatLayout extends ConsumerWidget {
  const ChatLayout({
    super.key,
    required this.conversationId,
    required this.child,
  });

  final String conversationId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(conversationProvider.notifier);
    final conversations = notifier.conversations;

    final user = ref.read(userProvider.notifier).user;

    if (conversations.isEmpty || user == null) {
      return const SizedBox.shrink();
    }

    final conversation = conversations.where((element) {
      return element.id == conversationId;
    }).firstOrNull;

    if (conversation == null) {
      return const SizedBox.shrink();
    }

    final recipient = notifier.getConversationRecipient(conversation, user);

    return Scaffold(
      appBar: ChatAppBar(recipient: recipient),
      backgroundColor: context.colors.primaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: sm),
          child: child,
        ),
      ),
    );
  }
}
