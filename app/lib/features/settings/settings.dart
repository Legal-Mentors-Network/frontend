import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings", style: context.text.titleSmall),
    );
  }
}
