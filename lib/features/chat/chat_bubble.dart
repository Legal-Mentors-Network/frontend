import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/common/utils.dart';
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
            child: MessageContent(
              message: message,
              isRecipient: true,
              child: Column(
                children: [
                  if (showRecipientName)
                    Padding(
                      padding: !isEmpty(message.attachment.toString())
                          ? const EdgeInsets.only(right: sm, left: sm, top: md, bottom: sm)
                          : EdgeInsets.zero,
                      child: RecipientName(recipient: recipient, textColor: textColor),
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
            child: MessageContent(message: message),
          ),
        ),
      ],
    );
  }
}

class MessageContent extends StatelessWidget {
  const MessageContent({
    super.key,
    required this.message,
    this.isRecipient = false,
    this.child,
  });

  final Message message;
  final Widget? child;
  final bool isRecipient;

  @override
  Widget build(BuildContext context) {
    // no file
    if (isEmpty(message.attachment.toString())) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: lg, vertical: lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (child != null) child!,
            TextMessage(message: message, isRecipient: isRecipient),
          ],
        ),
      );
    }

    // file but no text
    if (isEmpty(message.message)) {
      return Media(attachment: message.attachment!);
    }

    // file and text
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sm, vertical: sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (child != null) child!,
          Media(attachment: message.attachment!),
          Padding(
            padding: const EdgeInsets.only(right: sm, left: sm, bottom: xs, top: sm),
            child: TextMessage(message: message, isRecipient: isRecipient),
          ),
        ],
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({super.key, required this.message, this.isRecipient = false});

  final Message message;
  final bool isRecipient;

  @override
  Widget build(BuildContext context) {
    final color = isRecipient ? context.colors.onSurface : context.colors.onPrimary;

    return Text(
      message.message,
      style: context.text.bodyLarge?.apply(color: color),
    );
  }
}

class Media extends StatelessWidget {
  const Media({super.key, required this.attachment});

  final Uri attachment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(md)),
      child: CachedNetworkImage(
        imageUrl: attachment.toString(),
        fit: BoxFit.cover,
      ),
    );
  }
}
