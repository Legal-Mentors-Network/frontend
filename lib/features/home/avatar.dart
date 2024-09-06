import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/router/routes.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) return const SizedBox.shrink();

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(md)),
          child: CachedNetworkImage(
            imageUrl: image,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),

        //
        Positioned.fill(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(md)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.go(Routes.profile.path),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
