import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: const Text("2"),
      alignment: const AlignmentDirectional(34, 34),
      backgroundColor: context.colors.primary,
      isLabelVisible: true,
      child: CircleAvatar(
        // backgroundColor: AssetImage('assets/images/${user.image}'),
        backgroundColor: context.colors.primary,
        radius: 24,
      ),
    );
  }
}
