import 'package:flutter/material.dart';
import 'package:lmn/core/extensions.dart';
import 'package:lmn/core/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'LMN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(ctx),
      darkTheme: AppTheme.dark(ctx),
      themeMode: ThemeMode.dark,
      home: const Temp(),
    );
  }
}

class Temp extends StatelessWidget {
  const Temp({
    super.key,
  });

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: ctx.theme.colorScheme.surface,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                Text(
                  'Hello, World!'.capitalize(),
                  style: ctx.text.displaySmall,
                ),

                const SizedBox(height: 16),

                FilledButton(
                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
