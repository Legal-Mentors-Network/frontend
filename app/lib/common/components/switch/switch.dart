import 'package:flutter/material.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, required this.child});

  final Switch child;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      alignment: FractionalOffset.centerRight,
      child: child,
    );
  }
}
