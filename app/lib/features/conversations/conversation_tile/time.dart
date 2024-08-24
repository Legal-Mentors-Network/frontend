import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lmn/common/extensions.dart';

class Time extends StatelessWidget {
  const Time({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime(2023, 01, 24, 10, 10, 10).add(
      const Duration(seconds: 120),
    );

    final String time = DateFormat('HH:mm').format(date);

    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(time, style: context.text.bodySmall),
        ],
      ),
    );
  }
}
