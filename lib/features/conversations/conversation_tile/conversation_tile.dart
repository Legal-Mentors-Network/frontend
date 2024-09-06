import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/conversations/conversation_tile/message_text.dart';
import 'package:lmn/features/conversations/conversation_tile/name.dart';
import 'package:lmn/features/conversations/conversation_tile/time.dart';
import 'package:lmn/features/conversations/conversation_tile/user_avatar.dart';
import 'package:lmn/models/conversation.dart';
import 'package:lmn/state/conversation.dart';
import 'package:lmn/state/user.dart';

class ConversationTile extends ConsumerWidget {
  const ConversationTile({
    super.key,
    required this.conversation,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider.notifier).user;

    if (user == null) {
      return const SizedBox.shrink();
    }

    final recipient = ref.read(conversationProvider.notifier).getConversationRecipient(conversation, user);

    final latestMessage = conversation.latestMessage;

    return Slidable(
      endActionPane: const ActionPane(
        motion: DrawerMotion(),
        children: [DeleteAction()],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: lg),
        onTap: () => context.pushNamed('chat', pathParameters: {'conversationId': conversation.id}),
        leading: Avatar(image: recipient.image, unreadMessages: conversation.unreadMessages),
        title: Name(name: recipient.name),
        subtitle: MessageText(message: latestMessage.message),
        trailing: Time(time: latestMessage.createdAt),
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
