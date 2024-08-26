import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/components/chat_app_bar/chat_app_bar.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/models/user.dart';
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
    final conversations = ref.watch(conversationProvider.notifier).conversations;
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

    User recipient = conversation.recipient;
    if (conversation.recipient.id == user.id) {
      recipient = conversation.author;
    }

    return Scaffold(
      appBar: ChatAppBar(recipient: recipient),
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: md),
          child: child,
        ),
      ),
    );
  }
}
