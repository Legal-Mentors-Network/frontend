import 'package:flutter/material.dart';
import 'package:lmn/common/components/atoms/switch.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.text.titleSmall?.copyWith(fontWeight: FontWeight.w500);

    // todo: make list tile into components

    return Column(
      children: [
        ListTile(
          title: Text('Dark mode', style: textStyle),
          titleAlignment: ListTileTitleAlignment.center,
          contentPadding: const EdgeInsets.symmetric(horizontal: rl),
          trailing: AppSwitch(
            child: Switch(
              //   value: themeMode == ThemeMode.dark,
              value: true,
              onChanged: (_) {},
            ),
          ),
        ),
        ListTile(
          title: Text('Notifications', style: textStyle),
          titleAlignment: ListTileTitleAlignment.center,
          contentPadding: const EdgeInsets.symmetric(horizontal: rl),
          trailing: const AppSwitch(
            child: Switch(
              value: true,
              onChanged: null,
            ),
          ),
        ),
        ListTile(
          title: Text('Find new matches', style: textStyle),
          titleAlignment: ListTileTitleAlignment.center,
          contentPadding: const EdgeInsets.symmetric(horizontal: rl),
          trailing: const AppSwitch(
            child: Switch(
              value: true,
              onChanged: null,
            ),
          ),
        ),
      ],
    );
  }
}
