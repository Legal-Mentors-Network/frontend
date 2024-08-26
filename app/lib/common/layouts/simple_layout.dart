import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';

class SimpleLayout extends StatelessWidget {
  const SimpleLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: md),
          child: child,
        ),
      ),
    );
  }
}
