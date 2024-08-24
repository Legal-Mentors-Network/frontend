import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/conversations/conversation_tile/message_text.dart';
import 'package:lmn/features/conversations/conversation_tile/name.dart';
import 'package:lmn/features/conversations/conversation_tile/time.dart';
import 'package:lmn/features/conversations/conversation_tile/user_avatar.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: lg),
      onTap: () => context.pushNamed('chat', pathParameters: {'conversationId': '123'}),
      leading: const UserImage(),
      title: const Name(),
      subtitle: const MessageText(),
      trailing: const Time(),
    );
  }
}
