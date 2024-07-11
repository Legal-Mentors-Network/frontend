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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World!',
            style: ctx.text.headlineMedium,
          ),
        ),
      ),
    );
  }
}
