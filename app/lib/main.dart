import 'package:flutter/material.dart';
import 'package:lmn/core/layouts/main_layout.dart';
import 'package:lmn/core/theme.dart';
import 'package:lmn/features/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      darkTheme: AppTheme.dark(context),
      themeMode: ThemeMode.dark,
      home: const AppLayout(child: Home()),
    );
  }
}
