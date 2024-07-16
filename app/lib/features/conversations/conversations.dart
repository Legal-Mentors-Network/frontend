import 'package:flutter/material.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/conversations/conversation_tile/conversation_tile.dart';

class Conversations extends StatelessWidget {
  const Conversations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => const ConversationTile(),
            separatorBuilder: (context, index) => const SizedBox(height: xs),
            itemCount: 14,
          ),
        ),
      ],
    );
  }
}
