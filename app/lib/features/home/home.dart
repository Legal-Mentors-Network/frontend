import 'package:flutter/material.dart';
import 'package:lmn/core/extensions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Text(
              'Hello, World!'.capitalize(),
              style: context.text.displaySmall,
            ),

            const SizedBox(height: 16),

            FilledButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
          ],
        ),
      ],
    );
  }
}
