import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/chat/state.dart';
import 'package:lmn/state/message.dart';

class SendMessage extends ConsumerWidget {
  const SendMessage({
    super.key,
    required this.conversationId,
  });

  final String conversationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendMessage = ref.read(messageProvider(conversationId).notifier).sendMessage;
    final messageController = ref.read(messageControllerProvider);

    final textColor = context.colors.onPrimaryContainer.withOpacity(0.7);

    void submitMessage() {
      if (messageController.text.isEmpty) {
        return;
      }

      sendMessage(
        message: messageController.text,
        conversationId: conversationId,
      );

      messageController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }

    return Material(
      elevation: xs,
      borderRadius: BorderRadius.circular(rl),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: lg, vertical: xs),
        decoration: BoxDecoration(
          color: context.colors.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(rl)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: md),
                child: TextField(
                  controller: messageController,
                  cursorColor: textColor,
                  autocorrect: false,
                  onEditingComplete: submitMessage,
                  style: TextStyle(color: context.colors.onPrimaryContainer),
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: textColor),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              color: textColor,
              onPressed: submitMessage,
            ),
          ],
        ),
      ),
    );
  }
}
