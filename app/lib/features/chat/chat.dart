import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({
    super.key,
    required this.conversationId,
  });

  final String conversationId;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat'),
    );
  }
}
