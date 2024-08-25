import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/conversations/conversation_tile/message_text.dart';
import 'package:lmn/features/conversations/conversation_tile/name.dart';
import 'package:lmn/features/conversations/conversation_tile/time.dart';
import 'package:lmn/features/conversations/conversation_tile/user_avatar.dart';
import 'package:lmn/models/conversation.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    super.key,
    required this.conversation,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: const ActionPane(
        motion: DrawerMotion(),
        children: [DeleteAction()],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: lg),
        onTap: () => context.pushNamed('chat', pathParameters: {'conversationId': conversation.id}),
        leading: const UserImage(),
        title: const Name(),
        subtitle: const MessageText(),
        trailing: const Time(),
      ),
    );
  }
}

class DeleteAction extends StatelessWidget {
  const DeleteAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {},
      backgroundColor: Colors.red,
      icon: Icons.delete,
    );
  }
}
