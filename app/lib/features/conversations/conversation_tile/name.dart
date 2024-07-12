import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class Name extends StatelessWidget {
  const Name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Montana",
      style: context.text.titleSmall,
    );
  }
}
