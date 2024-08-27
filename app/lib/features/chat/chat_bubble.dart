import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/models/message.dart';
import 'package:lmn/models/user.dart';
import 'package:lmn/state/theme.dart';

class ChatBubble extends ConsumerWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.author,
    required this.recipient,
    this.showRecipientName = false,
  });

  final Message message;
  final User author;
  final User recipient;
  final bool showRecipientName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    inspect(message);

    if (message.author == author.id) {
      return UserBubble(message: message);
    }

    return RecipientBubble(
      message: message,
      recipient: recipient,
      showRecipientName: showRecipientName,
    );
  }
}

class RecipientBubble extends ConsumerWidget {
  const RecipientBubble({
    super.key,
    required this.message,
    required this.recipient,
    this.showRecipientName = false,
  });

  final Message message;
  final User recipient;
  final bool showRecipientName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final color = theme == ThemeMode.dark ? const Color.fromARGB(255, 43, 43, 45) : const Color(0xFFf5f5f7);
    final textColor = theme == ThemeMode.dark ? context.colors.secondary : const Color(0xFFfd7590);

    return Row(
      children: [
        Flexible(
          flex: 4,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(rl)),
            ),
            margin: const EdgeInsets.symmetric(vertical: 0.5),
            elevation: 0,
            color: color,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: lg, vertical: lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showRecipientName) RecipientName(recipient: recipient, textColor: textColor),
                  Text(
                    message.message,
                    style: context.text.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class RecipientName extends StatelessWidget {
  const RecipientName({
    super.key,
    required this.recipient,
    required this.textColor,
  });

  final User recipient;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          recipient.name,
          style: context.text.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: xs),
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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(rl)),
            ),
            margin: const EdgeInsets.symmetric(vertical: 0.5),
            elevation: 0,
            color: const Color(0xFF4F3EEE),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: lg, vertical: lg),
              child: Text(
                message.message,
                style: context.text.titleSmall?.apply(color: context.colors.onPrimary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
