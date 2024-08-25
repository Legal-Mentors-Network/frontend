import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/models/user.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required this.recipient,
  });

  final User recipient;

  @override
  Widget build(BuildContext context) {
    final Widget backBtn = IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () => context.pop(),
    );

    return AppBar(
      title: Text(recipient.name, style: context.text.titleMedium),
      centerTitle: true,
      scrolledUnderElevation: 0,
      leading: backBtn,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: recipient.image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
