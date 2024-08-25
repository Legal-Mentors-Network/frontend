import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    // TODO: fix badge
    return Badge(
      label: const Text("2"),
      alignment: const AlignmentDirectional(34, 34),
      backgroundColor: context.colors.primary,
      isLabelVisible: true,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: image,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
