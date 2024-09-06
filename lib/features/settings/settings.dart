import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/features/settings/toggle.dart';
import 'package:lmn/state/theme.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Option(
          title: 'Dark mode',
          value: ref.watch(themeProvider) == ThemeMode.dark,
          onChanged: (value) {
            ref.read(themeProvider.notifier).setTheme(value ? ThemeMode.dark : ThemeMode.light);
          },
        ),
        const Option(title: 'Notifications'),
        const Option(title: 'Find new matches'),
      ],
    );
  }
}
