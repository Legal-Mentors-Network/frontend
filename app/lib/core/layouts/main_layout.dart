import 'package:flutter/material.dart';
import 'package:lmn/core/extensions.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
