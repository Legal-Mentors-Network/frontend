import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = context.colors.onPrimaryContainer.withOpacity(0.7);

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
                  cursorColor: textColor,
                  autocorrect: false,
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
