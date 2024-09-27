import 'package:flutter/material.dart';
import 'package:lmn/common/theme/constants.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({
    super.key,
    required this.text,
    required this.callback,
    this.isDisabled = false,
    this.color,
    this.icon,
  });

  final String text;
  final void Function() callback;
  final bool isDisabled;
  final Color? color;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return FilledButton.icon(
        onPressed: isDisabled ? null : callback,
        icon: icon,
        label: Text(text),
        style: FilledButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size.fromHeight(50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(sm)),
          ),
        ),
      );
    }

    return FilledButton(
      onPressed: isDisabled ? null : callback,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(sm)),
        ),
      ),
      child: Text(text),
    );
  }
}
