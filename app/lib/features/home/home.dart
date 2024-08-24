import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/state/user.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.text;
    final colorScheme = context.colors;

    final user = ref.watch(userProvider);

    debugPrint("user: $user");

    if (user == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        Row(
          textDirection: TextDirection.rtl,
          children: [
            //
            Avatar(image: user.image),

            const Spacer(),

            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
              iconSize: 34,
            ),
          ],
        ),

        const SizedBox(height: xl),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back,', style: textTheme.titleLarge?.copyWith(color: colorScheme.secondary)),
              Text(
                user.name,
                style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900, color: colorScheme.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
