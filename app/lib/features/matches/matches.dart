import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class Matches extends StatelessWidget {
  const Matches({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Matches", style: context.text.titleSmall),
    );
  }
}
