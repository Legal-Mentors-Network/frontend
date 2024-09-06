import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lmn/common/extensions.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Time extends StatelessWidget {
  const Time({
    super.key,
    required this.time,
  });

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final String formattedTime = DateFormat('HH:mm').format(time);

    return Skeleton.ignore(
      child: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(formattedTime, style: context.text.bodySmall),
          ],
        ),
      ),
    );
  }
}
