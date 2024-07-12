import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

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

            const SizedBox(height: 16),

            const FilledButton(
              onPressed: null,
              child: Text('Disabled'),
            ),

            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: context.colors.primaryContainer,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "On Primary Container",
                  style: context.text.bodyLarge?.copyWith(color: context.colors.onPrimaryContainer),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: context.colors.secondaryContainer,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "On Secondary Container",
                  style: context.text.bodyLarge?.copyWith(color: context.colors.onSecondaryContainer),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
