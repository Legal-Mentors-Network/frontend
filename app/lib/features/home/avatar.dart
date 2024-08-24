import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lmn/common/theme/constants.dart';

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
            height: 60,
            width: 60,
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
                onTap: () {
                  debugPrint('go to profile');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
