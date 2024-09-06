import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class Name extends StatelessWidget {
  const Name({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: context.text.titleSmall,
    );
  }
}
