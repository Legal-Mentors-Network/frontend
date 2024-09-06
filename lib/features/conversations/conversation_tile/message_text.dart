import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class MessageText extends StatelessWidget {
  const MessageText({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: context.text.bodySmall,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
