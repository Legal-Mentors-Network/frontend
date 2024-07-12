import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';

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

            const SizedBox(height: lg),

            FilledButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),

            const SizedBox(height: lg),

            FilledButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),

            const SizedBox(height: lg),

            const FilledButton(
              onPressed: null,
              child: Text('Disabled'),
            ),

            const SizedBox(height: lg),

            Container(
              decoration: BoxDecoration(
                color: context.colors.primaryContainer,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(lg),
                child: Text(
                  "On Primary Container",
                  style: context.text.bodyLarge?.copyWith(color: context.colors.onPrimaryContainer),
                ),
              ),
            ),

            const SizedBox(height: lg),

            Material(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(lg),
                  child: Text(
                    "On Secondary Container",
                    style: context.text.bodyLarge?.copyWith(color: context.colors.onSecondaryContainer),
                  ),
                ),
              ),
            ),

            const SizedBox(height: lg),
          ],
        ),
      ],
    );
  }
}
