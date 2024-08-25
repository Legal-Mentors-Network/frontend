import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/state/user.dart';

class ChatBubble extends ConsumerWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider.notifier).user;

    if (user == null) {
      log("user is empty");
      throw Exception("User is empty when rendering chat bubble");
    }

    inspect(message);
    return message.author == user.id ? UserBubble(message: message) : RecipientBubble(message: message);
  }
}

class RecipientBubble extends StatelessWidget {
  const RecipientBubble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 4,
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 0.5),
            elevation: 0,
            color: const Color(0xFFECEBF5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                message.message,
                style: context.text.bodyMedium,
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class UserBubble extends StatelessWidget {
  const UserBubble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        Flexible(
          flex: 4,
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 0.5),
            elevation: 0,
            color: context.colors.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                message.message,
                style: context.text.bodyMedium?.apply(color: context.colors.onPrimary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
