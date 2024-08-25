import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lmn/common/extensions.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.image,
    this.unreadMessages,
  });

  final String image;
  final int? unreadMessages;

  @override
  Widget build(BuildContext context) {
    if (unreadMessages == null || unreadMessages == 0) {
      return UserImage(image: image);
    }

    return Badge(
      label: Text(unreadMessages.toString()),
      backgroundColor: context.colors.primary,
      alignment: const FractionalOffset(0.9, 0.1),
      isLabelVisible: true,
      child: UserImage(image: image),
    );
  }
}

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: image,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
