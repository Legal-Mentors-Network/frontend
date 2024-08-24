import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({
    super.key,
    this.conversationId,
  });

  final String? conversationId;

  @override
  Widget build(BuildContext context) {
    if (conversationId == null) {
      return const SizedBox.shrink();
    }

    return const Center(
      child: Text('Chat'),
    );
  }
}
