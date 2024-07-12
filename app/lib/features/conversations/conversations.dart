import 'package:flutter/material.dart';
import 'package:lmn/features/conversations/conversation_tile/conversation_tile.dart';

class Conversations extends StatelessWidget {
  const Conversations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // conversations
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => const ConversationTile(),
            separatorBuilder: (context, index) => const SizedBox(height: 0),
            itemCount: 14,
          ),
        ),
      ],
    );
  }
}
