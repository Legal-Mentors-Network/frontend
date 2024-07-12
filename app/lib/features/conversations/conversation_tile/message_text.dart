import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class MessageText extends StatelessWidget {
  const MessageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Say hello to my little friend",
      style: context.text.bodySmall,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
