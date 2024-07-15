import 'package:flutter/material.dart';
import 'package:lmn/features/settings/toggle.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Option(
          title: 'Dark mode',
          value: true,
          onChanged: (_) {},
        ),
        const Option(title: 'Notifications'),
        const Option(title: 'Find new matches'),
      ],
    );
  }
}
