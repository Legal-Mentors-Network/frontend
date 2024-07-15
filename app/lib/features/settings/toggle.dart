import 'package:flutter/material.dart';
import 'package:lmn/common/components/atoms/switch.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.title,
    this.value = false,
    this.onChanged,
  });

  final String title;
  final bool value;
  final Function(bool item)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: context.text.titleSmall?.copyWith(fontWeight: FontWeight.w500),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      contentPadding: const EdgeInsets.symmetric(horizontal: rl),
      trailing: AppSwitch(
        child: Switch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
