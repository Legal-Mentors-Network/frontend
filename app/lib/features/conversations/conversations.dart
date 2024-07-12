import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class Conversations extends StatelessWidget {
  const Conversations({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Conversations", style: context.text.displaySmall),
    );
  }
}
